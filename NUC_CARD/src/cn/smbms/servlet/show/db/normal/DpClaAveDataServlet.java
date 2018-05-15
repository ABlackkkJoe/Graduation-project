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

@WebServlet("/normal_ave")
public class DpClaAveDataServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("123");
        response.setContentType("text/html;charset=utf‐8");
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

        String sql = "select su opfare, nu count,su/nu ave ,A.dpname2,A.dpname4 from\n" +
                "  (select sum(OPFARE_sum) su,dpname1,dpname2,dpname3,dpname4 from tb_n_attend_consume where dpname1='软件学院' group by dpname1,dpname2,dpname3,dpname4) A\n" +
                "  inner join\n" +
                "  (select count(distinct outid)  nu,dpname1,dpname2,dpname3,dpname4 from tb_n_attend_consume where dpname1='软件学院' group by dpname1,dpname2,dpname3,dpname4) B\n" +
                "  on\n" +
                "A.dpname1=B.dpname1 and A.dpname2=B.dpname2 and A.dpname3=B.dpname3 and A.dpname4=B.dpname4\n" +
                "group by su/nu  desc;";
        ResultSet set = null;
        Statement stmt = null;
        List<PieEntity> list = new ArrayList<PieEntity>();
        try {
            stmt = conn.createStatement();
            set = stmt.executeQuery(sql);
            while (set.next()) {
                PieEntity bean = new PieEntity();
                bean.setAve(set.getFloat("ave"));
                bean.setCount(set.getInt("count"));
                bean.setOpfare(set.getFloat("opfare"));
                bean.setDpname2(set.getString("dpname2"));
                bean.setDpname4(set.getString("dpname4"));
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
