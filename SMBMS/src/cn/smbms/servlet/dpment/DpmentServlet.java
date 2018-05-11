package cn.smbms.servlet.dpment;

import cn.smbms.pojo.Dpment;
import cn.smbms.pojo.Provider;
import cn.smbms.pojo.User;
import cn.smbms.service.dpment.DpmentService;
import cn.smbms.service.dpment.DpmentServiceImpl;
import cn.smbms.service.provider.ProviderService;
import cn.smbms.service.provider.ProviderServiceImpl;
import cn.smbms.tools.Constants;
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


public class DpmentServlet extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String dpname1 = request.getParameter("dpname1");
        if (StringUtils.isNullOrEmpty(dpname1)) {
            dpname1 = "";
        }

        DpmentService providerService = new DpmentServiceImpl();
        List<Dpment> providerList =  providerService.getDpmentList(dpname1);
        request.setAttribute("providerList", providerList);
        request.setAttribute("dpname1", dpname1);
        request.getRequestDispatcher(request.getContextPath() + "/jsp/dpmentlist.jsp").forward(request, response);



        // 根据不同的请求来执行不同的操作
        String method = request.getParameter("method");

        if (method != null && method.equals("query")) {             //  查询
            this.query(request, response);
        } else if (method != null && method.equals("add")) {        //  添加
            this.add(request, response);
        } else if (method != null && method.equals("view")) {       //  查看详情
            this.getProviderById(request, response, "/jsp/dpmentview.jsp");
        } else if (method != null && method.equals("modify")) {     //  修改, 或得到商家信息,跳转到修改界面
            this.getProviderById(request, response, "/jsp/dpmentmodify.jsp");
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
        String dpname1 = request.getParameter("dpname1");
        if (StringUtils.isNullOrEmpty(dpname1)) {
            dpname1 = "";
        }

        DpmentService providerService = new DpmentServiceImpl();
        List<Dpment> providerList =  providerService.getDpmentList(dpname1);
        request.setAttribute("providerList", providerList);
        request.setAttribute("dpname1", dpname1);
        request.getRequestDispatcher(request.getContextPath() + "/jsp/dpmentlist.jsp").forward(request, response);
    }

    /**
     * 添加商家
     */
    public void add(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        // 1.获取前端信息
        String dpname1 = request.getParameter("dpname1");       //  商家编码
        String dpname2 = request.getParameter("dpname2");       //  商家姓名
        String dpname3 = request.getParameter("dpname3");     //  商家联系方式
        String dpname4 = request.getParameter("dpname4"); //  商家联系人

        // 2.封装Provider对象
        Dpment provider = new Dpment();
        provider.setDpname1(dpname1);
        provider.setDpname2(dpname2);
        provider.setDpname3(dpname3);
        provider.setDpname4(dpname4);
        provider.setId(((User)request.getSession().getAttribute(Constants.USER_SESSION)).getId());  // id
        provider.setCreationDate(new Date());       // 创建日期

        boolean flag = false;
        DpmentService providerService = new DpmentServiceImpl();
        flag = providerService.add(provider);
        if (flag) {    // 添加成功,跳转到查询界面
            response.sendRedirect(request.getContextPath() + "/jsp/dpment.do?method=query");
        } else {       // 添加失败,继续留在添加界面
            request.getRequestDispatcher(request.getContextPath() + "jsp/dpmentadd.jsp").forward(request, response);
        }
    }

    /**
     * 根据id 获取商家
     */
    public void getProviderById(HttpServletRequest request, HttpServletResponse response, String url) throws ServletException, IOException {
        String id = request.getParameter("id");
        if (!StringUtils.isNullOrEmpty(id)) {
            DpmentService providerService = new DpmentServiceImpl();
            Dpment provider = null;
            provider = providerService.getDpmentById(id);
            // 跳转到 修改界面 或者 详情界面
            request.setAttribute("dpment", provider);
            request.getRequestDispatcher(request.getContextPath() + url).forward(request, response);
        }
    }

    /**
     * 修改商家信息
     */
    public void modify(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        // 1.获取前端数据
        String dpname1 = request.getParameter("dpname1");
        String dpname2 = request.getParameter("dpname2");
        String dpname3 = request.getParameter("dpname3");
        String dpname4 = request.getParameter("dpname4");

        // 2.封装Provider
        Dpment provider = new Dpment();
        provider.setDpname1(dpname1);
        provider.setDpname2(dpname2);
        provider.setDpname3(dpname3);
        provider.setDpname4(dpname4);
        provider.setModifyBy(((User)request.getSession().getAttribute(Constants.USER_SESSION)).getId());
        provider.setModifyDate(new Date());


        // 3.执行修改操作
        boolean flag = false;
        DpmentService providerService = new DpmentServiceImpl();
        flag = providerService.modify(provider);
        if (flag) {
            response.sendRedirect(request.getContextPath() + "/jsp/dpment.do?method=query");
        } else {
            request.getRequestDispatcher(request.getContextPath() + "/jsp/dpmentmodify.jsp").forward(request, response);
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
            DpmentService providerService = new DpmentServiceImpl();
            int flag = providerService.deleteDpmentById(id);
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
