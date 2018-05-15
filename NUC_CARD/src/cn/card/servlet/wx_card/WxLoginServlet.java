package cn.card.servlet.wx_card;

import cn.card.pojo.User;
import cn.card.service.user.UserServiceImpl;
import com.alibaba.fastjson.JSON;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;


@WebServlet("/wx_login")
public class WxLoginServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 获取参数
        // 获取用户名和密码
        response.setContentType("text/html;charset=utf‐8");
        String userCode = request.getParameter("userCode");
        String userPassword = request.getParameter("userPassword");
        //String nickName = request.getParameter("nickName");
        // 调用service方法, 进行用户匹配
        UserServiceImpl userService = new UserServiceImpl();
        //User user = userService.wxLogin(userCode, userPassword,nickName);
        User user = userService.login(userCode, userPassword);
        user.setStatus(200);
        System.out.println("wx_login:" + user);
        user.setUserCode(userCode);
        user.setUserPassword(userPassword);
        List<User> list = new ArrayList<User>();
        list.add(user);
        String jsonString = JSON.toJSONString(list);
        System.err.println(jsonString);
        PrintWriter out = response.getWriter();
        out.print(jsonString);
        //System.out.println(list.toString());
        out.flush();
        out.close();
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }



}
