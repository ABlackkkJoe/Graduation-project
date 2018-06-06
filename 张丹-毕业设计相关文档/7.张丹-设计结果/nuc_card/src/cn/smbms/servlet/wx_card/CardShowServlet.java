package cn.smbms.servlet.wx_card;

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


@WebServlet("/card_show")
public class CardShowServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 获取参数
        // 获取用户名和密码
        response.setContentType("text/html;charset=utf‐8");
        String userCode = request.getParameter("userCode");
        System.out.println("学号："+userCode);
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

        String sql = "select  OPFAR as cost , balance , \n" +
                "opedt,dscrp,termname ,dpname1,dpname2,dpname3,dpname4 from  tb_n_attend_consume_date_wx " +
                "where outid="+userCode+"  ORDER BY OPEDT DESC ;";
        ResultSet set = null;
        Statement stmt = null;
        List<PieEntity> list = new ArrayList<PieEntity>();
        try {
            stmt = conn.createStatement();
            set = stmt.executeQuery(sql);
            while (set.next()) {
                PieEntity bean = new PieEntity();
                bean.setCost(set.getFloat("cost"));
                bean.setBalance(set.getFloat("balance"));
                bean.setOpedt(String.valueOf(set.getDate("opedt")));
                bean.setDscrp(set.getString("dscrp"));
                bean.setTermname(set.getString("termname"));
                bean.setDpname1(set.getString("dpname1"));
                bean.setDpname2(set.getString("dpname2"));
                bean.setDpname3(set.getString("dpname3"));
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
