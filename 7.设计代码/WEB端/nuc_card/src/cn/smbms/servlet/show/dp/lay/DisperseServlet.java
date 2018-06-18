package cn.smbms.servlet.show.dp.lay;

import cn.smbms.pojo.PieEntity;
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

@WebServlet("/disperse")
public class DisperseServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("123");
        response.setContentType("text/html;charset=utf‐8");
        /** 链接数据库 */
        String driver= "com.mysql.jdbc.Driver";
        String url= "jdbc:mysql://localhost:3306/nuc_card?zeroDateTimeBehavior=convertToNull&characterEncoding=UTF-8";
        String user= "root";
        String password = "";
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

        String sql = "select classify,COUNT(classify) as count " +
                "from tb_n_attend_consume_date GROUP BY classify; ";

        ResultSet set = null;
        Statement stmt = null;
        List<PieEntity> list = new ArrayList<PieEntity>();
        try {
            stmt = conn.createStatement();
            set = stmt.executeQuery(sql);
            while (set.next()) {
                PieEntity bean = new PieEntity();
                bean.setClassify(set.getString("classify"));
                bean.setCount(set.getInt("count"));
                list.add(bean);
            }
        } catch (SQLException e) {
            System.err.println(e.getMessage());
        }
        String jsonString = JSON.toJSONString(list);
        System.err.println(jsonString);
        PrintWriter out = response.getWriter();
        out.print(jsonString);

/*
        String sql1 = "select  A.classify as classify,f,m from" +
                " (SELECT classify, COUNT(gender) as f from tb_n_attend_consume_date where gender='1' GROUP BY gender,classify) A" +
                " INNER join" +
                " (SELECT classify, COUNT(gender) as m  from tb_n_attend_consume_date where gender='2' GROUP BY gender,classify) B" +
                " ON" +
                " A.classify=B.classify; ";

        set = null;
        stmt = null;
        List<PieEntity> list1 = new ArrayList<PieEntity>();
        try {
            stmt = conn.createStatement();
            set = stmt.executeQuery(sql1);
            while (set.next()) {
                PieEntity bean = new PieEntity();
                bean.setClassify(set.getString("classify"));
                bean.setF(set.getString("f"));
                bean.setM(set.getString("m"));
                list1.add(bean);
            }
        } catch (SQLException e) {
            System.err.println(e.getMessage());
        }
        System.out.println(list1);
        //request.setAttribute("list",list1);
        //request.getRequestDispatcher("/jsp/user_dp/dp_disperse.jsp").forward(request, response);


        */

         out.flush();
        out.close();

    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
