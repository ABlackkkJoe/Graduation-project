package nuc.sw.zd.card.servlet.provider;

import nuc.sw.zd.card.pojo.Provider;
import nuc.sw.zd.card.pojo.User;
import nuc.sw.zd.card.service.provider.ProviderService;
import nuc.sw.zd.card.service.provider.ProviderServiceImpl;
import nuc.sw.zd.card.tools.Constants;
import com.alibaba.fastjson.JSON;
import com.mysql.jdbc.StringUtils;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.HashMap;
import java.util.List;


public class ProviderServlet extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 根据不同的请求来执行不同的操作
        String method = request.getParameter("method");

        if (method != null && method.equals("query")) {             //  查询
            this.query(request, response);
        } else if (method != null && method.equals("add")) {        //  添加
            this.add(request, response);
        } else if (method != null && method.equals("view")) {       //  查看详情
            this.getProviderById(request, response, "/jsp/providerview.jsp");
        } else if (method != null && method.equals("modify")) {     //  修改, 或得到商家信息,跳转到修改界面
            this.getProviderById(request, response, "/jsp/providermodify.jsp");
        } else if (method != null && method.equals("modifysava")) {  // 执行修改操作
            this.modify(request, response);
        } else if (method != null && method.equals("delprovider")) { // 删除
            this.delProvider(request, response);
        }
    }

    /**
     * 查询商家信息
     *     1.
     */
    public void query(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String queryProName = request.getParameter("queryProName");
        String queryProCode = request.getParameter("queryProCode");
        if (StringUtils.isNullOrEmpty(queryProName)) {
            queryProName = "";
        }
        if (StringUtils.isNullOrEmpty(queryProCode)) {
            queryProCode = "";
        }

        ProviderService providerService = new ProviderServiceImpl();
        List<Provider> providerList =  providerService.getProviderList(queryProName, queryProCode);
        request.setAttribute("providerList", providerList);
        request.setAttribute("queryProName", queryProName);
        request.setAttribute("queryProCode", queryProCode);
        request.getRequestDispatcher(request.getContextPath() + "/jsp/providerlist.jsp").forward(request, response);
    }

    /**
     * 添加商家
     */
    public void add(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        // 1.获取前端信息
        String proCode = request.getParameter("proCode");       //  商家编码
        String proName = request.getParameter("proName");       //  商家姓名
        String proPhone = request.getParameter("proPhone");     //  商家联系方式
        String proContact = request.getParameter("proContact"); //  商家联系人
        String proAddress = request.getParameter("proAddress"); //  商家地址
        String proFax = request.getParameter("proFax");         //  商家传真
        String proDesc = request.getParameter("proDesc");       //  商家描述

        // 2.封装Provider对象
        Provider provider = new Provider();
        provider.setProCode(proCode);
        provider.setProName(proName);
        provider.setProPhone(proPhone);
        provider.setProContact(proContact);
        provider.setProAddress(proAddress);
        provider.setProFax(proFax);
        provider.setProDesc(proDesc);
        provider.setId(((User)request.getSession().getAttribute(Constants.USER_SESSION)).getId());  // id
        provider.setCreationDate(new Date());       // 创建日期

        boolean flag = false;
        ProviderService providerService = new ProviderServiceImpl();
        flag = providerService.add(provider);
        if (flag) {    // 添加成功,跳转到查询界面
            response.sendRedirect(request.getContextPath() + "/jsp/provider.do?method=query");
        } else {       // 添加失败,继续留在添加界面
            request.getRequestDispatcher(request.getContextPath() + "jsp/provideradd.jsp").forward(request, response);
        }
    }

    /**
     * 根据id 获取商家
     */
    public void getProviderById(HttpServletRequest request, HttpServletResponse response, String url) throws ServletException, IOException {
        String id = request.getParameter("id");
        if (!StringUtils.isNullOrEmpty(id)) {
            ProviderService providerService = new ProviderServiceImpl();
            Provider provider = null;
            provider = providerService.getProviderById(id);
            // 跳转到 修改界面 或者 详情界面
            request.setAttribute("provider", provider);
            request.getRequestDispatcher(request.getContextPath() + url).forward(request, response);
        }
    }

    /**
     * 修改商家信息
     */
    public void modify(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        // 1.获取前端数据
        String proContact = request.getParameter("proContact");
        String proPhone = request.getParameter("proPhone");
        String proCode = request.getParameter("proCode");
        String proName = request.getParameter("proName");
        String proAddress = request.getParameter("proAddress");
        String proFax = request.getParameter("proFax");
        String proDesc = request.getParameter("proDesc");
        String id = request.getParameter("id");

        // 2.封装Provider
        Provider provider = new Provider();
        provider.setId(Integer.valueOf(id));
        provider.setProCode(proCode);
        provider.setProName(proName);
        provider.setProContact(proContact);
        provider.setProPhone(proPhone);
        provider.setProFax(proFax);
        provider.setProDesc(proDesc);
        provider.setProAddress(proAddress);
        provider.setModifyBy(((User)request.getSession().getAttribute(Constants.USER_SESSION)).getId());
        provider.setModifyDate(new Date());


        // 3.执行修改操作
        boolean flag = false;
        ProviderService providerService = new ProviderServiceImpl();
        flag = providerService.modify(provider);
        if (flag) {
            response.sendRedirect(request.getContextPath() + "/jsp/provider.do?method=query");
        } else {
            request.getRequestDispatcher(request.getContextPath() + "/jsp/providermodify.jsp").forward(request, response);
        }
    }

    /**
     * 删除商家
     */
    public void delProvider(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String id = request.getParameter("id");
        // 封装返回数据
        HashMap<String, String> resultMap = new HashMap<>();
        if (StringUtils.isNullOrEmpty(id)) {
            resultMap.put("delResult", "noexist");
        } else {
            ProviderService providerService = new ProviderServiceImpl();
            int flag = providerService.deleteProviderById(id);
            if (flag == 0) {   // 删除成功
                resultMap.put("delResult" , "true");
            } else if (flag == -1) {  // 删除失败
                resultMap.put("delResult", "false");
            } else if (flag > 0) {  // 该供应商下有订单, 不能删除, 返回订单数
                resultMap.put("delResult", String.valueOf(flag));
            }
        }

        // 把resultMap转换成json对象输出
        response.setContentType("application/json");
        PrintWriter outPrintWriter = response.getWriter();
        outPrintWriter.write(JSON.toJSONString(resultMap));
        outPrintWriter.flush();
        outPrintWriter.close();
    }
}
