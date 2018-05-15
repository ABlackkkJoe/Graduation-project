package cn.card.servlet.bill;

import cn.card.pojo.Bill;
import cn.card.pojo.Provider;
import cn.card.pojo.User;
import cn.card.service.bill.BillService;
import cn.card.service.bill.BillServiceImpl;
import cn.card.service.provider.ProviderService;
import cn.card.service.provider.ProviderServiceImpl;
import cn.card.tools.Constants;
import com.alibaba.fastjson.JSON;
import com.mysql.jdbc.StringUtils;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.util.Date;
import java.util.HashMap;
import java.util.List;


public class BillServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String method = request.getParameter("method");

        if (method != null && method.equals("query")) {         // 查询
            this.query(request, response);
        } else if (method != null && method.equals("add")) {    // 添加
            this.add(request, response);
        } else if (method != null && method.equals("view")) {   // 详情
            this.getBillById(request, response, "/jsp/billview.jsp");
        } else if (method != null && method.equals("modify")) {  //     获取订单信息
            this.getBillById(request, response, "/jsp/billmodify.jsp");
        } else if (method != null && method.equals("modifysave")) {  // 修改订单信息
            this.modify(request, response);
        } else if (method != null && method.equals("delbill")) {  // 删除订单
            this.delBill(request, response);
        } else if (method != null && method.equals("getproviderlist")) {  // 获取商家列表
            this.getProviderList(request, response);
        }
    }

    /**
     * 查询
     */
    private void query(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ProviderService providerService = new ProviderServiceImpl();
        List<Provider> providerList = providerService.getProviderList("", "");
        request.setAttribute("providerList", providerList);

        String queryProductName = request.getParameter("queryProductName");
        String queryProviderId = request.getParameter("queryProviderId");
        String queryIsPayment = request.getParameter("queryIsPayment");
        if (StringUtils.isNullOrEmpty(queryProductName)) {
            queryProductName = "";
        }

        BillService billService = new BillServiceImpl();
        Bill bill = new Bill();
        if (StringUtils.isNullOrEmpty(queryIsPayment)) {
            bill.setIsPayment(0);
        } else {
            bill.setIsPayment(Integer.parseInt(queryIsPayment));
        }
        if (StringUtils.isNullOrEmpty(queryProviderId)) {
            bill.setProviderId(0);
        } else {
            bill.setProviderId(Integer.parseInt(queryProviderId));
        }
        bill.setProductName(queryProductName);
        List<Bill> billList = billService.getBillList(bill);
        request.setAttribute("billList", billList);
        request.setAttribute("queryProductName", queryProductName);
        request.setAttribute("queryProviderId", queryProviderId);
        request.setAttribute("queryIsPayment", queryIsPayment);
        request.getRequestDispatcher("billlist.jsp").forward(request, response);
    }

    /**
     * 添加订单
     */
    private void add(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        // 1.获取数据
        String billCode = request.getParameter("billCode");
        String productName = request.getParameter("productName");
        String productDesc = request.getParameter("productDesc");
        String productUnit = request.getParameter("productUnit");

        String productCount = request.getParameter("productCount");
        String totalPrice = request.getParameter("totalPrice");
        String providerId = request.getParameter("providerId");
        String isPayment = request.getParameter("isPayment");

        // 2.封装
        Bill bill = new Bill();
        bill.setBillCode(billCode);
        bill.setProductName(productName);
        bill.setProductDesc(productDesc);
        bill.setProductUnit(productUnit);
        bill.setProductCount(new BigDecimal(productCount).setScale(2, BigDecimal.ROUND_DOWN));
        bill.setIsPayment(Integer.valueOf(isPayment));
        bill.setTotalPrice(new BigDecimal(totalPrice).setScale(2, BigDecimal.ROUND_DOWN));
        bill.setProviderId(Integer.valueOf(providerId));
        bill.setCreateBy(((User)request.getSession().getAttribute(Constants.USER_SESSION)).getId());
        bill.setCreationDate(new Date());

        boolean flag = false;
        BillService billService = new BillServiceImpl();
        flag = billService.add(bill);
        if (flag) {
            response.sendRedirect(request.getContextPath() + "/jsp/bill.do?method=query");
        } else  {
            request.getRequestDispatcher("billadd.jsp").forward(request, response);
        }
    }

    /**
     * 根据id获取订单
     */
    private void getBillById(HttpServletRequest request, HttpServletResponse response, String url) throws ServletException, IOException {
        String id = request.getParameter("id");

        if (!StringUtils.isNullOrEmpty(id)) {
            BillService billService = new BillServiceImpl();
            Bill bill = billService.getBillById(id);
            request.setAttribute("bill", bill);
            request.getRequestDispatcher(request.getContextPath() + url).forward(request, response);
        }
    }

    /**
     * 修改订单
     *    2: 小数点保留2位,   ROUND_DOWN 舍弃,   ROUND_UP 进位
     *    new BigDecimal(productCount).setScale(2, BigDecimal.ROUND_DOWN);
     */
    private void modify(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String id = request.getParameter("id");
        String productCode = request.getParameter("billCode");
        String productName = request.getParameter("productName");
        String productDesc = request.getParameter("productDesc");
        String productUnit = request.getParameter("productUnit");
        String productCount = request.getParameter("productCount");
        String totalPrice = request.getParameter("totalPrice");
        String providerId = request.getParameter("providerId");
        String isPayment = request.getParameter("isPayment");

        Bill bill = new Bill();
        bill.setId(Integer.valueOf(id));
        bill.setProductName(productName);
        bill.setBillCode(productCode);
        bill.setProductDesc(productDesc);
        bill.setProductUnit(productUnit);
        bill.setProductCount(new BigDecimal(productCount).setScale(2, BigDecimal.ROUND_DOWN));  // ???
        bill.setIsPayment(Integer.valueOf(isPayment));
        bill.setTotalPrice(new BigDecimal(totalPrice).setScale(2, BigDecimal.ROUND_DOWN));
        bill.setProviderId(Integer.valueOf(providerId));

        bill.setModifyBy(((User)request.getSession().getAttribute(Constants.USER_SESSION)).getId());
        bill.setModifyDate(new Date());

        boolean flag = false;
        BillService billService = new BillServiceImpl();
        flag = billService.modify(bill);
        if (flag) {
            response.sendRedirect(request.getContextPath() + "/jsp/bill.do?method=query");
        } else  {
            request.getRequestDispatcher("billmodify.jsp").forward(request, response);
        }
    }

    /**
     * 删除订单
     */
    private void delBill(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String id = request.getParameter("id");
        HashMap<String, String> resultMap = new HashMap<>();
        if (!StringUtils.isNullOrEmpty(id)) {
            BillService billService = new BillServiceImpl();
            boolean flag = billService.deleteBillById(id);
            if (flag) {   // 删除成功
                resultMap.put("delResult", "true");
            } else {      // 删除失败
                resultMap.put("delResult", "false");
            }
        } else {
            resultMap.put("delResult", "notexist");
        }

        // 数据返回
        PrintWriter printWriter = response.getWriter();
        printWriter.write(JSON.toJSONString(resultMap));
        printWriter.flush();
        printWriter.close();
    }

    /**
     * 获取商家列表
     */
    private void getProviderList(HttpServletRequest request, HttpServletResponse response) throws IOException {
        List<Provider> providerList = null;
        ProviderService providerService = new ProviderServiceImpl();
        providerList = providerService.getProviderList("", "");

        // 把providerList转换成json对象输出
        response.setContentType("application/json");
        PrintWriter outPrinterWriter = response.getWriter();
        outPrinterWriter.write(JSON.toJSONString(providerList));
        outPrinterWriter.flush();
        outPrinterWriter.close();
    }
}
