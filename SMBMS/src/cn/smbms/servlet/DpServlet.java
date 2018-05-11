package cn.smbms.servlet;

import cn.smbms.pojo.Dpment;
import cn.smbms.pojo.User;
import cn.smbms.service.dpment.DpmentService;
import cn.smbms.service.dpment.DpmentServiceImpl;
import cn.smbms.tools.Constants;
import com.alibaba.fastjson.JSON;
import com.mysql.jdbc.StringUtils;

import javax.jws.WebService;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.HashMap;
import java.util.List;


public class DpServlet extends HttpServlet {

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


    }


}
