package nuc.sw.zd.card.service.user;

import nuc.sw.zd.card.pojo.PieEntity;
import nuc.sw.zd.card.pojo.User;

import java.util.List;


public interface UserService {
    /**
     * 增加用户信息 -- 添加用户
     */
    public boolean add(User user);
    public boolean addOpfare(PieEntity pieEntity);
    public boolean addIncome(PieEntity pieEntity);
    /**
     * 用户登录  -- 登录功能, 通过用户名和密码实现登录
     */
    public User login(String userCode, String password);
    public User wxLogin(String userCode, String password,String nickName);

    /**
     * 根据条件查询用户列表   -- 根据用户名 和 用户角色 进行查询, 为了做分页效果, 需传入当前页数以及每页显示的条数.
     */
    public List<User> getUserList(String queryUserName, int queryUserRole, int currentPageNo, int pageSize);

    /**
     * 根据条件查询用户表记录数  -- 查询记录数 - 做分页
     */
    public int getUserCount(String queryUserName, int queryUserRole);

    /**
     * 根据userCode查询出User
     */
    public User selectUserCodeExist(String userCode);

    /**
     * 根据id删除user   -- 删除功能
     */
    public boolean deleteUserById(Integer delId);

    /**
     * 根据id查找User
     */
    public User getUserById(String id);

    /**
     * 修改用户信息  -- 编辑用户信息, 实现用户信息的修改
     */
    public boolean modfiy(User user);

    /**
     * 根据userId修改密码  -- 密码修改界面, 需要知道新密码以及要更改的用户id
     */
    public boolean updatePwd(int id, String pwd);
}
