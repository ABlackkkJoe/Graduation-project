package nuc.sw.zd.card.dao.user;

import nuc.sw.zd.card.pojo.PieEntity;
import nuc.sw.zd.card.pojo.User;

import java.sql.Connection;
import java.util.List;

/**
 * UserDao -- 用户接口
 */
public interface UserDao {
    /**
     * 增加用户信息
     */
    public int add(Connection connection, User user) throws Exception;
    /**
     * 增加消费信息
     */
    public int addOpfare(Connection connection, PieEntity pieEntity) throws Exception;
    /**
     * 增加充值信息
     */
    public int addIncome(Connection connection, PieEntity pieEntity) throws Exception;
    /**
     * 通过userCode获取User
     */
    public User getLoginUser(Connection connection, String userCode) throws Exception;
    public User getWxLoginUser(Connection connection, String userCode) throws Exception;
    /**
     * 通过条件查询 - userList
     */
    public List<User> getUserList(Connection connection, String userName, int userRole, int currentPageNo, int pageSize) throws Exception;

    /**
     * 通过条件查询 - 用户表记录数 - 根据用户名和用户角色来查询
     */
    public int getUserCount(Connection connection, String userName, int userRole) throws Exception;

    /**
     * 通过userId删除User
     */
    public int deleteUserById(Connection connection, Integer delId) throws Exception;

    /**
     * 通过userId获取User, 并获取对应的角色名称
     */
    public User getUserById(Connection connection, String id) throws Exception;

    /**
     * 修改用户信息
     */
    public int modify(Connection connection, User user) throws Exception;

    /**
     * 修改当前用户密码
     */
    public int updatePwd(Connection connection, int id, String pwd) throws Exception;
}
