package cn.smbms.servlet.show.admin;

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

@WebServlet("/canteenmon10")
public class canteenMon1DataServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("123");
        response.setContentType("text/html;charset=utf‐8");
        /** 链接数据库 */
        String driver= "com.mysql.jdbc.Driver";
        String url= "jdbc:mysql://localhost:3306/nuc_card?zeroDateTimeBehavior=convertToNull&characterEncoding=utf8";
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

        String sql = "SELECT outid,opfar from `tb_n_attend_consume_date` \n" +
                "where EXTRACT(MONTH from CAST(opdt as DATE)) = 10 " +
                "and ACCCODE=210;";

        ResultSet set = null;
        Statement stmt = null;
        List<PieEntity> list = new ArrayList<PieEntity>();
        try {
            stmt = conn.createStatement();
            set = stmt.executeQuery(sql);
            while (set.next()) {
                PieEntity bean = new PieEntity();
                bean.setOutid(set.getString("outid"));
                bean.setOpfare(set.getFloat("opfar"));
                list.add(bean);
            }
        } catch (SQLException e) {
            System.err.println(e.getMessage());
        }
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
