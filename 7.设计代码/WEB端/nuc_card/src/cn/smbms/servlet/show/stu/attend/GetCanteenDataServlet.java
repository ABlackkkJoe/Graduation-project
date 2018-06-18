package cn.smbms.servlet.show.stu.attend;

import cn.smbms.pojo.PieEntity;
import cn.smbms.pojo.User;
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

@WebServlet("/canteenshow")
public class GetCanteenDataServlet extends HttpServlet {
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
        User userSession = (User) request.getSession().getAttribute("userSession");
        String userCode = userSession.getUserCode();
        System.out.println("hhh" + userCode);
        /*** 获得数据 */

        String sql = "select outid,acccode,termname,sum(OPFARE_sum) opfare " +
                "from tb_a_attend_consume WHERE OUTID="+userCode+" and acccode=210 group by outid,acccode,termname;";

        ResultSet set = null;
        Statement stmt = null;
        List<PieEntity> list = new ArrayList<PieEntity>();
        try {
            stmt = conn.createStatement();
            set = stmt.executeQuery(sql);
            while (set.next()) {
                PieEntity bean = new PieEntity();
                bean.setTermname(set.getString("termname"));
                bean.setAcccode(set.getInt("acccode"));
                bean.setOpfare(set.getFloat("opfare"));
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
