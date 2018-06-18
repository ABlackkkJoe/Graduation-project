package cn.smbms.servlet.show.db.normal;

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

@WebServlet("/normal_part")
public class DpPartDataServlet extends HttpServlet {
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

        String sql = "select acccode,sum(OPFARE_sum) opfare,dpname1 from tb_n_attend_consume group by acccode,dpname1;";
        ResultSet set = null;
        Statement stmt = null;
        List<PieEntity> list = new ArrayList<PieEntity>();
        try {
            stmt = conn.createStatement();
            set = stmt.executeQuery(sql);
            while (set.next()) {
                PieEntity bean = new PieEntity();
                bean.setAcccode(set.getInt("acccode"));
                bean.setOpfare(set.getFloat("opfare"));
                bean.setDpname1(set.getString("dpname1"));
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
