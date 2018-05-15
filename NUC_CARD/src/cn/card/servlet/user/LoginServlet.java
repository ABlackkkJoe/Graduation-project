package cn.card.servlet.user;

import cn.card.pojo.User;
import cn.card.tools.Constants;
import cn.card.service.user.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


public class LoginServlet extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        doPost(request, response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        // 获取用户名和密码
        String userCode = request.getParameter("userCode");
        String userPassword = request.getParameter("userPassword");
        // 调用service方法, 进行用户匹配
        UserServiceImpl userService = new UserServiceImpl();
        User user = userService.login(userCode, userPassword);
        System.out.println("web_login" + user);

        if (null != user) {  // 登录成功
            // 存储到session
            request.getSession().setAttribute(Constants.USER_SESSION, user);

            // 页面跳转 -- 重定向
            if (user.getUserRole()==1){
                System.out.println(user.getUserRole());
                try {
                    response.sendRedirect(request.getContextPath() + "/jsp/frame_root.jsp");
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
            if (user.getUserRole()==2 || user.getUserRole()==3 || user.getUserRole()==4) {
                try {
                    response.sendRedirect(request.getContextPath() + "/jsp/frame_hm.jsp");
                } catch (IOException e) {
                    e.printStackTrace();
                }
                System.out.println(user.getUserRole());
            }
            if (user.getUserRole()==5||user.getUserRole()==6||user.getUserRole()==7||user.getUserRole()==9){
                try {
                    response.sendRedirect(request.getContextPath() + "/jsp/frame_stu.jsp");
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
            if (user.getUserRole()==8){
                try {
                    response.sendRedirect(request.getContextPath() + "/jsp/frame_dp.jsp");
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }

        }   // 登录失败
        else { // 页面跳转(login.jsp) 带出提示信息 -- 转发
            request.setAttribute("error", "用户名或密码不正确");
            try {
                request.getRequestDispatcher(request.getContextPath() + "/login.jsp").forward(request, response);
            } catch (ServletException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }
}
