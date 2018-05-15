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
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
@WebServlet("/add_opfare")
public class addOpfareServlet extends HttpServlet {
    CheckIn in=new CheckIn(new java.sql.Date(System.currentTimeMillis()));
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 获取参数
        // 获取用户名和密码
        response.setContentType("text/html;charset=utf‐8");
        String userCode = request.getParameter("userCode");
        float opfare = Float.parseFloat(request.getParameter("opfare"));
        float income= Float.parseFloat(request.getParameter("income"));
        System.out.println("userCode:"+userCode+";opfare:"+opfare+";income:"+income);
        PieEntity pieEntity=new PieEntity();
        /** 链接数据库 */
        String driver= "com.mysql.jdbc.Driver";
        String url= "jdbc:mysql://www.ocpro.cc:3306/smbms?zeroDateTimeBehavior=convertToNull&characterEncoding=utf8";
        String user= "root";
        String password = "hz19950326";
        Connection conn = null;
        try {
            Class.forName(driver);
            conn = DriverManager.getConnection(url, user, password);
        } catch (SQLException e) {
            System.err.println(e.getMessage());
        } catch (ClassNotFoundException e) {
            System.err.println(e.getMessage());
        }
        /*** 获得数据 */

        String sql = "select balance from tb_n_attend_consume_date_wx \n" +
                "where opedt=(select max(OPEDT) from tb_n_attend_consume_date_wx) and OUTID="+userCode+";";
        ResultSet set = null;
        Statement stmt = null;
        List<PieEntity> list = new ArrayList<PieEntity>();
        try {
            stmt = conn.createStatement();
            set = stmt.executeQuery(sql);
            while (set.next()) {
                PieEntity bean = new PieEntity();
                bean.setBalance(set.getFloat("balance"));
                list.add(bean);
            }
        } catch (SQLException e) {
            System.err.println(e.getMessage());
        }
        list.add(pieEntity);
        float balance=list.get(0).getBalance();
        //System.out.println(balance);
        pieEntity=new PieEntity();
        pieEntity.setOutid(userCode);
        String formatTime = in.getFormatTime("yyyy-MM-dd HH:MM:ss");
        //System.out.println(formatTime);
        pieEntity.setOpedt(formatTime);
        pieEntity.setAcccode(210);
        pieEntity.setDscrp("餐饮支出");
        pieEntity.setTermname("5#");
        pieEntity.setIncome(income);
        pieEntity.setOpfare(opfare);
        if ((balance+income-opfare)>0) {
            pieEntity.setBalance(balance - opfare);
            pieEntity.setDpname1("软件学院");
            pieEntity.setDpname2("软件工程(云计算与大数据方向)");
            pieEntity.setDpname3("14级");
            pieEntity.setDpname4("14140Y01");
            list = new ArrayList<PieEntity>();
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
            if (userService.addOpfare(pieEntity)) {
                System.out.println("添加消费成功");// 如果添加成功, 则直接跳转到查询页面
                //response.sendRedirect(request.getContextPath() + "/jsp/user.do?method=query");
            } else {   // 如果添加失败, 则还是停留在添加界面
                System.out.println("添加消费失败");
                //request.getRequestDispatcher("useradd.jsp").forward(request, response);
            }
        }
        else{
            System.out.println("余额不足！");
            pieEntity.setBalance(-1);
            List listErr = new ArrayList();
            listErr.add(pieEntity);
            String jsonString = JSON.toJSONString(list);
            System.err.println(jsonString);
            PrintWriter out = response.getWriter();
            out.print(jsonString);
            //System.out.println(list.toString());
            out.flush();
            out.close();
        }



    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }



}
