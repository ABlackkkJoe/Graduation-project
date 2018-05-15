package nuc.sw.zd.card.service.user;

import nuc.sw.zd.card.dao.BaseDao;
import nuc.sw.zd.card.dao.user.UserDao;
import nuc.sw.zd.card.dao.user.UserDaoImpl;
import nuc.sw.zd.card.pojo.PieEntity;
import nuc.sw.zd.card.pojo.User;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

public class UserServiceImpl implements UserService {
    private UserDao userDao;

    public UserServiceImpl() {
        userDao = new UserDaoImpl();
    }

    @Override
    public boolean add(User user) {
        boolean flag = false;
        Connection connection = null;
        try {
            connection = BaseDao.getConnection();
            connection.setAutoCommit(false);   // 开启JDBC事物管理
            int updateRows = userDao.add(connection, user);
            connection.commit();
            if (updateRows > 0) {
                flag = true;
                System.out.println("add success!");
            } else {
                System.out.println("add fail!");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            BaseDao.closeResource(connection, null, null);
        }

        return flag;
    }
    @Override
    public boolean addOpfare(PieEntity pieEntity) {
        boolean flag = false;
        Connection connection = null;
        try {
            connection = BaseDao.getConnection();
            connection.setAutoCommit(false);   // 开启JDBC事物管理
            int updateRows = userDao.addOpfare(connection, pieEntity);
            connection.commit();
            if (updateRows > 0) {
                flag = true;
                System.out.println("addOpfare success!");
            } else {
                System.out.println("addOpfare fail!");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            BaseDao.closeResource(connection, null, null);
        }

        return flag;
    }
    @Override
    public boolean addIncome(PieEntity pieEntity) {
        boolean flag = false;
        Connection connection = null;
        try {
            connection = BaseDao.getConnection();
            connection.setAutoCommit(false);   // 开启JDBC事物管理
            int updateRows = userDao.addIncome(connection, pieEntity);
            connection.commit();
            if (updateRows > 0) {
                flag = true;
                System.out.println("addIncome success!");
            } else {
                System.out.println("addIncome fail!");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            BaseDao.closeResource(connection, null, null);
        }

        return flag;
    }
    @Override
    public User login(String userCode, String password) {
        Connection connection = null;
        User user = null;

        try {
            connection = BaseDao.getConnection();
            user = userDao.getLoginUser(connection, userCode);
            System.out.println("web的login:" + user);

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            BaseDao.closeResource(connection, null, null);
        }
        // 匹配密码
        if (null != user) {
            if (!user.getUserPassword().equals(password)) {
                user = null;
            }
        }
        return user;
    }
    @Override
    public User wxLogin(String userCode, String password,String nickName) {
        Connection connection = null;
        User user = null;
        try {
            connection = BaseDao.getConnection();
            user = userDao.getWxLoginUser(connection, userCode);
            System.out.println("wx的login:" + user);

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            BaseDao.closeResource(connection, null, null);
        }
        // 匹配密码
        if (null != user) {
            if (!user.getUserPassword().equals(password)) {
                user = null;
            }
            if (!user.getNickName().equals(nickName)) {
                user = null;
            }
        }
        return user;
    }
    @Override
    public List<User> getUserList(String queryUserName, int queryUserRole, int currentPageNo, int pageSize) {
        Connection connection = null;
        List<User> userList = null;
        try {
            connection = BaseDao.getConnection();
            userList = userDao.getUserList(connection, queryUserName, queryUserRole, currentPageNo, pageSize);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            BaseDao.closeResource(connection, null, null);
        }
        return userList;
    }

    @Override
    public int getUserCount(String queryUserName, int queryUserRole) {
        Connection connection = null;
        int count = 0;

        try {
            connection = BaseDao.getConnection();
            count = userDao.getUserCount(connection, queryUserName, queryUserRole);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            BaseDao.closeResource(connection, null, null);
        }
        return count;
    }

    @Override
    public User selectUserCodeExist(String userCode) {
        Connection connection = BaseDao.getConnection();;
        User user = null;

        try {
            user = userDao.getLoginUser(connection, userCode);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            BaseDao.closeResource(connection, null, null);
        }

        return user;
    }

    @Override
    public boolean deleteUserById(Integer delId) {
        Connection connection = null;
        boolean flag = false;

        try {
            connection = BaseDao.getConnection();
            if (userDao.deleteUserById(connection, delId) > 0) {
                flag = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            BaseDao.closeResource(connection, null, null);
        }
        return flag;
    }

    @Override
    public User getUserById(String id) {
        Connection connection = null;
        User user = null;

        try {
            connection = BaseDao.getConnection();
            user = userDao.getUserById(connection, id);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            BaseDao.closeResource(connection, null, null);
        }
        return user;
    }

    @Override
    public boolean modfiy(User user) {
        Connection connection = null;
        boolean flag = false;

        try {
            connection = BaseDao.getConnection();
            if (userDao.modify(connection, user) > 0) {
                flag = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            BaseDao.closeResource(connection, null, null);
        }
        return flag;
    }

    @Override
    public boolean updatePwd(int id, String pwd) {
        Connection connection = null;
        boolean flag = false;

        try {
            connection = BaseDao.getConnection();
            if (userDao.updatePwd(connection, id, pwd) > 0) {
                flag = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return flag;
    }
}
