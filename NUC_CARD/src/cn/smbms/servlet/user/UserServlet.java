package cn.smbms.servlet.user;

import cn.smbms.pojo.Role;
import cn.smbms.pojo.User;
import cn.smbms.service.role.RoleService;
import cn.smbms.service.role.RoleServiceImpl;
import cn.smbms.service.user.UserService;
import cn.smbms.service.user.UserServiceImpl;
import cn.smbms.tools.Constants;
import com.alibaba.fastjson.JSON;
import com.mysql.jdbc.StringUtils;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;


public class UserServlet extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        doPost(request, response);
    }

    /**
     *  view层传入 参数 method, 通过method来识别进行增删改查操作
     * @param request
     * @param response
     */
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String method = request.getParameter("method");

        System.out.println("method = " + method);

        if (null != method && method.equals("add")) {                   // 添加操作
            this.add(request, response);
        } else if (null != method && method.equals("query")) {          // 查询操作
            this.query(request, response);
        } else if (null != method && method.equals("getrolelist")) {    // 获取角色列表
            this.getRoleList(request, response);
        } else if (null != method && method.equals("ucexist")) {        // 获取存在用户 - 根据userCode查询
            this.userCodeExist(request, response);
        } else if (null != method && method.equals("delUser")) {        // 删除用户 - 根据id
            this.delUser(request, response);
        } else if (null != method && method.equals("view")) {           // 查看用户详情
            this.getUserById(request, response, "/jsp/userview.jsp");
        } else if (null != method && method.equals("modify")) {         // 修改用户信息
            this.getUserById(request, response,  "/jsp/usermodify.jsp");
        } else if (null != method && method.equals("modifyexe")) {      // 执行修改操作
            this.modify(request, response);
        } else if (null != method && method.equals("pwdmodify")) {      // 查询判断旧密码是否输入正确
            this.getPwdByUserId(request, response);
        } else if (null != method && method.equals("savepwd")) {        // 执行更新密码操作
            this.updatePwd(request, response);
        }
    }

    /**
     * 添加用户
     *      添加成功 - 直接进入用户列表界面, 查询列表信息
     *      添加失败 - 直接进入错误界面
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    private void add(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("add-------------->");

        // 获取参数
        String userCode = request.getParameter("userCode");
        String userName = request.getParameter("userName");
        String userPassword = request.getParameter("userPassword");
        String gender = request.getParameter("gender");
        String birthday = request.getParameter("birthday");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String userRole = request.getParameter("userRole");

        User user = new User();
        user.setUserCode(userCode);
        user.setUserName(userName);
        user.setUserPassword(userPassword);
        user.setAddress(address);
        try {
            user.setBirthday(new SimpleDateFormat("yyyy-MM-dd").parse(birthday));
        } catch (ParseException e) {
            e.printStackTrace();
        }
        user.setGender(Integer.valueOf(gender));
        user.setPhone(phone);
        user.setUserRole(Integer.valueOf(userRole));
        user.setCreationDate(new Date());
        // 获取登录用户的id, 则为创建用户的id
        user.setCreateBy(((User)request.getSession().getAttribute(Constants.USER_SESSION)).getId());

        // 进行底层数据操作
        UserServiceImpl userService = new UserServiceImpl();
        if (userService.add(user)) {  // 如果添加成功, 则直接跳转到查询页面
            response.sendRedirect(request.getContextPath() + "/jsp/user.do?method=query");
        } else {   // 如果添加失败, 则还是停留在添加界面
            request.getRequestDispatcher("useradd.jsp").forward(request, response);
        }
    }


    /**
     * 获取用户列表
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    private void query(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 查询用户列表

        String queryUserName = request.getParameter("queryname");
        System.out.println(queryUserName);
        String temp = request.getParameter("queryUserRole");
        String pageIndex = request.getParameter("pageIndex");
        int queryUserRole = 0;
        int currentPageNo = 1;
        // 设置页面容量
        int pageSize = Constants.pageSize;

        if (queryUserName == null) {
            queryUserName = "";
        }

        if (temp != null && !temp.isEmpty()) {
            queryUserRole = Integer.valueOf(temp);
        }

        if (pageIndex != null) {
            currentPageNo = Integer.valueOf(pageIndex);
        }

        // 查询总数量
        UserService userService = new UserServiceImpl();
        int totalCount = userService.getUserCount(queryUserName, queryUserRole);
        // 总页数
        int totalPageCount = 1;
        if (totalCount <= pageSize) {
            totalPageCount = 1;
        } else {
           totalPageCount = (int) Math.ceil(totalCount * 1.0 / pageSize);
        }
        // 页数索引安全判断
        if (currentPageNo < 1) {
            currentPageNo = 1;
        } else if (currentPageNo > totalPageCount) {
            currentPageNo = totalPageCount;
        }

        // 获取用户列表
        List<User> userList = userService.getUserList(queryUserName, queryUserRole, currentPageNo, pageSize);
        request.setAttribute("userList", userList);

        RoleService roleService = new RoleServiceImpl();
        List<Role> roleList = roleService.getRoleList();
        request.setAttribute("roleList", roleList);
        request.setAttribute("queryUserName", queryUserName);
        request.setAttribute("queryUserRole", queryUserRole);
        request.setAttribute("totalPageCount", totalPageCount);
        request.setAttribute("totalCount", totalCount);
        request.setAttribute("currentPageNo", currentPageNo);
        request.getRequestDispatcher("/jsp/userlist.jsp").forward(request, response);

    }

    /**
     * 获取用户列表 - 将结果以json数据返回
     * @param request
     * @param response
     * @throws IOException
     */
    private void getRoleList(HttpServletRequest request, HttpServletResponse response) throws IOException {
        RoleService roleService = new RoleServiceImpl();
        List<Role> roleList = roleService.getRoleList();
        // 把roleList转为json对象输出
        response.setContentType("application/json");
        PrintWriter outPrinterWriter = response.getWriter();
        outPrinterWriter.write(JSON.toJSONString(roleList));
        outPrinterWriter.flush();
        outPrinterWriter.close();
    }

    /**
     * 通过userCode查询是否有存在的用户, 这是在添加之前进行的一步操作, 如果有, 则不进行添加.
     * @param request
     * @param response
     */
    private void userCodeExist(HttpServletRequest request, HttpServletResponse response) throws IOException {
        // 判断用户账号是否可用
        String userCode = request.getParameter("userCode");
        System.out.println("userCodeExist = " + userCode);

        HashMap<String, String> resultMap = new HashMap<>();
        if (StringUtils.isNullOrEmpty(userCode)) {
            resultMap.put("code", "2");
            resultMap.put("msg", "false");
        } else  {
            UserService userService = new UserServiceImpl();
            User user = userService.selectUserCodeExist(userCode);
            if (null != user) {
                resultMap.put("code", "2");
                resultMap.put("msg", "false");
            } else {
                resultMap.put("code", "1");
                resultMap.put("msg", "true");
            }
        }

        // 返回
        response.setContentType("application/json");
        PrintWriter outPrintWriter = response.getWriter();
        outPrintWriter.write(JSON.toJSONString(resultMap));
        outPrintWriter.flush();
        outPrintWriter.close();
    }
    /**
     * 删除用户 - 传入id
     * @param request
     * @param response
     * @throws IOException
     */
    private void delUser(HttpServletRequest request, HttpServletResponse response) throws IOException {
        // 1.从jsp获取数据
        String id = request.getParameter("id");
        Integer delId = Integer.valueOf(id);

        UserService userService = new UserServiceImpl();
        // 2.封装返回数据
        HashMap<String, Object> hashMap = new HashMap<>();
        if (delId <= 0) {
            hashMap.put("code", "3");
            hashMap.put("msg", "不存在");
        } else {
            if (userService.deleteUserById(delId)) {
                hashMap.put("code", "1");
                hashMap.put("msg", "删除成功");
            } else {
                hashMap.put("code", "2");
                hashMap.put("msg", "删除失败");
            }
        }

        // 3.将结果返回
        response.setContentType("application/json");
        PrintWriter outPrintWriter = response.getWriter();
        outPrintWriter.write(JSON.toJSONString(hashMap));
        outPrintWriter.flush();    // 清除缓存
        outPrintWriter.close();    // 关闭
    }

    /**
     * 获取用户 - 传入id  - 并且传入要跳转到的页面
     * @param request
     * @param response
     * @param url
     * @throws ServletException
     * @throws IOException
     */
    private void getUserById(HttpServletRequest request, HttpServletResponse response, String url) throws ServletException, IOException {
        String id = request.getParameter("id");
        if (null != id && !id.isEmpty()) {
            UserService userService = new UserServiceImpl();
            User user = userService.getUserById(id);
            request.setAttribute("user", user);
            request.getRequestDispatcher( url).forward(request, response);
        }
    }

    /**
     * 修改用户信息
     *      修改成功之后, 跳转到 用户列表界面
     *      修改失败, 还是停留在当前界面
     * @param request
     * @param response
     * @throws IOException
     * @throws ServletException
     */
    private void modify(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        // 获取参数
        String id = request.getParameter("id");
        String userName = request.getParameter("userName");
        String gender = request.getParameter("gender");
        String birthday = request.getParameter("birthday");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String userRole = request.getParameter("userRole");

        User user = new User();
        user.setId(Integer.valueOf(id));
        user.setUserName(userName);
        user.setGender(Integer.valueOf(gender));
        try {
            user.setBirthday(new SimpleDateFormat("yyyy-MM-dd").parse(birthday));
        } catch (ParseException e) {
            e.printStackTrace();
        }
        user.setPhone(phone);
        user.setAddress(address);
        user.setUserRole(Integer.valueOf(userRole));
        user.setModifyDate(new Date());
        user.setModifyBy(((User)request.getSession().getAttribute(Constants.USER_SESSION)).getId());

        // 进行数据处理
        UserService userService = new UserServiceImpl();
        if (userService.modfiy(user)) {   // 修改成功, 跳到列表界面
            response.sendRedirect( "/jsp/user.do?method=query");
        } else {
            request.getRequestDispatcher(  "/jsp/userModify.jsp").forward(request, response);
        }
    }

    /**
     * 修改用户密码
     *      两步操作:
     *          1.判断旧密码是否输入正确.
     *          2.将新的密码进行更新.
     * @param request
     * @param response
     */
    private void getPwdByUserId(HttpServletRequest request, HttpServletResponse response) throws IOException {
        // 1.获取输入的密码
        String oldPassword = request.getParameter("oldpassword");
        // 2.获取之前存储的用户密码
        User o = (User)request.getSession().getAttribute(Constants.USER_SESSION);

        HashMap<String, Object> resultMap = new HashMap<>();
        if (null == o) {
//            resultMap.put("code", "3");
//            resultMap.put("msg", "session信息过期");
            resultMap.put("result", "sessionerror");
        } else {
            if (!StringUtils.isNullOrEmpty(oldPassword)) {
                if (oldPassword.equals(o.getUserPassword())) {
                    //resultMap.put("code", "1");
                    //resultMap.put("msg", "旧密码验证成功");
                    resultMap.put("result", "true");
                } else {
                    //resultMap.put("code", "2");
                    //resultMap.put("msg", "输入错误");
                    resultMap.put("result", "false");
                }
            } else {
                //resultMap.put("code", "4");
                //resultMap.put("msg", "不能为空");
                resultMap.put("result", "error");
            }
        }

        // 3.数据返回给view层
        response.setContentType("application/json");
        PrintWriter outPrinterWriter = response.getWriter();
        outPrinterWriter.write(JSON.toJSONString(resultMap));
        outPrinterWriter.flush();
        outPrinterWriter.close();
    }

    /**
     * 修改密码  第二步
     *      根据id修改
     *  稍后需要修改
     * @param request
     * @param response
     */
    private void updatePwd(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User user = (User)request.getSession().getAttribute(Constants.USER_SESSION);
        String newpassword = request.getParameter("newpassword");
        boolean flag = false;
        if (user != null && !StringUtils.isNullOrEmpty(newpassword)) {
            UserService userService = new UserServiceImpl();
            flag = userService.updatePwd(user.getId(), newpassword);
            if (flag) {
                request.setAttribute(Constants.SYS_MESSAGE, "修改密码成功, 请退出并使用新密码重新登录!");
                request.getSession().removeAttribute(Constants.USER_SESSION);  // 注销之前的session
            } else {
                request.setAttribute(Constants.SYS_MESSAGE, "修改密码失败!");
            }
        } else {
            request.setAttribute(Constants.SYS_MESSAGE, "修改密码失败!");
        }

        // 跳转到修改界面
        request.getSession().removeAttribute(Constants.USER_SESSION);
        request.getRequestDispatcher( "/login.jsp").forward(request, response);
    }
}
