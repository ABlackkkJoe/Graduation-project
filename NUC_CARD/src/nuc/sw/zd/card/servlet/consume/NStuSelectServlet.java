package nuc.sw.zd.card.servlet.consume;

import nuc.sw.zd.card.dao.consume.ConsumeDaoImpl;
import nuc.sw.zd.card.pojo.NConsume;
import nuc.sw.zd.card.pojo.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/n_stuselect")
public class NStuSelectServlet extends HttpServlet{
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ConsumeDaoImpl consumeDaoImpl = new ConsumeDaoImpl();


        User user = (User) req.getSession().getAttribute("userSession");
        String userCode = user.getUserCode();
        System.out.println("show"+userCode);
        List<NConsume> consumes = consumeDaoImpl.selectByNOutid(Integer.valueOf(userCode));
        req.setAttribute("consumes",consumes);
        System.out.println(consumes);
        req.getRequestDispatcher("/jsp/user_stu/n_stu_msg.jsp").forward(req,resp);

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req,resp);
    }
}
