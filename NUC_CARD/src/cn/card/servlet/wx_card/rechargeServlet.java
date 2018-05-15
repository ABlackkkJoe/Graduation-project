package cn.card.servlet.wx_card;

import cn.card.pojo.PieEntity;
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

@WebServlet("/recharge")
public class rechargeServlet extends HttpServlet {
    CheckIn in=new CheckIn(new java.sql.Date(System.currentTimeMillis()));
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 获取参数
        // 获取用户名和密码
        response.setContentType("text/html;charset=utf‐8");
        String userCode = request.getParameter("userCode");
        float balance = Float.parseFloat(request.getParameter("balance"));
        float income= Float.parseFloat(request.getParameter("payMoney"));
        System.out.println("recharge:::userCode:"+userCode+";balance:"+balance+";income:"+income);
        PieEntity pieEntity=new PieEntity();

        pieEntity.setOutid(userCode);
        String formatTime = in.getFormatTime("yyyy-MM-dd HH:MM:ss");
        pieEntity.setOpedt(formatTime);
        pieEntity.setAcccode(210);
        pieEntity.setDscrp("充值");
        pieEntity.setTermname("");
        pieEntity.setIncome(income);
        pieEntity.setBalance(income+balance);
        pieEntity.setOpfare(0);
            pieEntity.setDpname1("软件学院");
            pieEntity.setDpname2("软件工程(云计算与大数据方向)");
            pieEntity.setDpname3("14级");
            pieEntity.setDpname4("14140Y01");
        List<PieEntity> list = new ArrayList<PieEntity>();
            list.add(pieEntity);
            String jsonString = JSON.toJSONString(list);
            System.err.println(jsonString);
            PrintWriter out = response.getWriter();
            out.print(jsonString);
            //System.out.println(list.toString());
            out.flush();
            out.close();

            // 进行底层数据操作
            UserServiceImpl userService = new UserServiceImpl();
            if (userService.addIncome(pieEntity)) {
                System.out.println("充值成功");// 如果添加成功, 则直接跳转到查询页面
                //response.sendRedirect(request.getContextPath() + "/jsp/user.do?method=query");
            } else {   // 如果添加失败, 则还是停留在添加界面
                System.out.println("充值失败");
                //request.getRequestDispatcher("useradd.jsp").forward(request, response);
            }




    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }



}
