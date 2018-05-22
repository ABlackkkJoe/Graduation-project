package cn.smbms.servlet.user;

import cn.smbms.tools.Constants;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


public class LogoutServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) {

        doPost(request, response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) {
        // 删除session会话信息
        request.getSession().removeAttribute(Constants.USER_SESSION);
        // 并直接跳转回登录界面
        try {
            // request.getContextPath() 拿到的是web项目的根路径,也就是webcontent的路径
            response.sendRedirect(request.getContextPath() + "/login.jsp");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
