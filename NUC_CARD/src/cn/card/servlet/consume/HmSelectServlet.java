package cn.card.servlet.consume;

import cn.card.dao.consume.ConsumeDaoImpl;
import cn.card.pojo.AConsume;
import cn.card.pojo.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * 对210的机子进行查询
 */
@WebServlet("/hmselect")
public class HmSelectServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ConsumeDaoImpl consumeDaoImpl = new ConsumeDaoImpl();

        User user = (User) req.getSession().getAttribute("userSession");
        Integer userRole = user.getUserRole();
        int acccode = -1;
        if (userRole == 2){
            acccode = 210;
        }else if (userRole == 3){
            acccode = 211;
        }else if (userRole == 4){
            acccode = 222;
        }
        List<AConsume> consumes = consumeDaoImpl.selectBy(acccode);
        req.setAttribute("consumes",consumes);
        System.out.println(consumes);;
        req.getRequestDispatcher("/jsp/user_hm/hm_msg.jsp").forward(req,resp);

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req,resp);
    }
}
