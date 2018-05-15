package cn.smbms.dao.user;

import cn.smbms.dao.BaseDao;
import cn.smbms.mail.EmailTest;
import cn.smbms.pojo.PieEntity;
import cn.smbms.pojo.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;


public class UserDaoImpl implements UserDao {


    @Override
    public int add(Connection connection, User user) throws Exception {
        PreparedStatement pstm = null;  // 预编译指令
        int updateRows = 0;
        if (null != connection) {
            String sql = "insert into smbms_user(userCode, userName, userPassword, gender, birthday, phone, address," +
                    "userRole, createdBy, creationDate) values(?,?,?,?,?,?,?,?,?,?)";
            Object[] params = {user.getUserCode(), user.getUserName(), user.getUserPassword(), user.getGender(), user.getBirthday(),
            user.getPhone(), user.getAddress(), user.getUserRole(), user.getCreateBy(), user.getCreationDate()};
            updateRows = BaseDao.execute(connection, pstm, sql, params);
            BaseDao.closeResource(null, pstm, null);
        }
        return updateRows;
    }
    @Override
    public int addOpfare(Connection connection, PieEntity pieEntity) throws Exception {
        PreparedStatement pstm = null;  // 预编译指令
        int updateRows = 0;
        if (null != connection) {
            String sql = "insert into tb_n_attend_consume_date_wx(outid, opedt, acccode, dscrp, termname, income, opfar," +
                    "balance, dpname1, dpname2,dpname3,dpname4) values(?,?,?,?,?,?,?,?,?,?,?,?)";
            Object[] params = {pieEntity.getOutid(), pieEntity.getOpedt(), pieEntity.getAcccode(), pieEntity.getDscrp(), pieEntity.getTermname(),
                    pieEntity.getIncome(),pieEntity.getOpfare(), pieEntity.getBalance(), pieEntity.getDpname1(), pieEntity.getDpname2(),pieEntity.getDpname3(),pieEntity.getDpname4()};
            updateRows = BaseDao.execute(connection, pstm, sql, params);
            BaseDao.closeResource(null, pstm, null);
        }
        return updateRows;
    }
    @Override
    public int addIncome(Connection connection, PieEntity pieEntity) throws Exception {
        PreparedStatement pstm = null;  // 预编译指令
        int updateRows = 0;
        if (null != connection) {
            String sql = "insert into tb_n_attend_consume_date_wx(outid, opedt, acccode, dscrp, termname, income, opfar," +
                    "balance, dpname1, dpname2,dpname3,dpname4) values(?,?,?,?,?,?,?,?,?,?,?,?)";
            Object[] params = {pieEntity.getOutid(), pieEntity.getOpedt(), pieEntity.getAcccode(), pieEntity.getDscrp(), pieEntity.getTermname(),
                    pieEntity.getIncome(),pieEntity.getOpfare(), pieEntity.getBalance(), pieEntity.getDpname1(), pieEntity.getDpname2(),pieEntity.getDpname3(),pieEntity.getDpname4()};
            updateRows = BaseDao.execute(connection, pstm, sql, params);
            BaseDao.closeResource(null, pstm, null);
        }
        return updateRows;
    }
    @Override
    public User getLoginUser(Connection connection, String userCode) throws Exception {
        PreparedStatement pstm = null;
        ResultSet rs = null;
        User user = null;
        if (null != connection) {
            String sql = "select * from smbms_user where userCode = ?";
            Object[] params = {userCode};
            rs = BaseDao.execute(connection, pstm, rs, sql, params);
            if (rs.next()) {
                user = new User();
                user.setId(rs.getInt("id"));
                user.setUserCode(rs.getString("userCode"));
                user.setUserName(rs.getString("userName"));
                user.setUserPassword(rs.getString("userPassword"));
                user.setGender(rs.getInt("gender"));
                user.setBirthday(rs.getDate("birthday"));
                user.setPhone(rs.getString("phone"));
                user.setAddress(rs.getString("address"));
                user.setUserRole(rs.getInt("userRole"));
                user.setCreateBy(rs.getInt("createdBy"));
                user.setCreationDate(rs.getTimestamp("creationDate"));
                user.setModifyBy(rs.getInt("modifyBy"));
                user.setModifyDate(rs.getTimestamp("modifyDate"));
            }
            if (user.getUserRole()==9){

                try {
                    EmailTest.testSendEmail();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
            BaseDao.closeResource(null, pstm, rs);

        }
        return user;
    }
    @Override
    public User getWxLoginUser(Connection connection, String userCode) throws Exception {
        PreparedStatement pstm = null;
        ResultSet rs = null;
        User user = null;
        if (null != connection) {
            String sql = "select * from smbms_user where userCode = ?";
            Object[] params = {userCode};
            rs = BaseDao.execute(connection, pstm, rs, sql, params);
            if (rs.next()) {
                user = new User();
                user.setId(rs.getInt("id"));
                user.setNickName(rs.getString("nickName"));
                user.setUserCode(rs.getString("userCode"));
                user.setUserName(rs.getString("userName"));
                user.setUserPassword(rs.getString("userPassword"));
                user.setGender(rs.getInt("gender"));
                user.setBirthday(rs.getDate("birthday"));
                user.setPhone(rs.getString("phone"));
                user.setAddress(rs.getString("address"));
                user.setUserRole(rs.getInt("userRole"));
                user.setCreateBy(rs.getInt("createdBy"));
                user.setCreationDate(rs.getTimestamp("creationDate"));
                user.setModifyBy(rs.getInt("modifyBy"));
                user.setModifyDate(rs.getTimestamp("modifyDate"));
            }
            BaseDao.closeResource(null, pstm, rs);
        }
        return user;
    }

    @Override
    public List<User> getUserList(Connection connection, String userName, int userRole, int currentPageNo, int pageSize) throws Exception {
        PreparedStatement psmt = null;
        ResultSet rs = null;
        List<User> userList = new ArrayList<>();
        if (null != connection) {
            List<Object> list = new ArrayList<>();
            String sql = "select u.*, roleName from smbms_user u, smbms_role r where u.userRole = r.id";
            if (!userName.isEmpty()) {
                sql += " and u.userName like ?";
                list.add("%" + userName + "%");
            }

            if (userRole > 0) {
                sql += " and u.userRole = ?";
                list.add(userRole);
            }

            sql += " order by creationDate desc limit ?, ?";
            currentPageNo = (currentPageNo - 1) * pageSize;   // 从第几个开始取
            list.add(currentPageNo);  // 取多少个, 每页的个数
            list.add(pageSize);

            rs = BaseDao.execute(connection, psmt, rs, sql, list.toArray());

            while (rs.next()) {
                User user = new User();
                user.setId(rs.getInt("id"));
                user.setUserCode(rs.getString("userCode"));
                user.setUserName(rs.getString("userName"));
                user.setGender(rs.getInt("gender"));
                user.setBirthday(rs.getDate("birthday"));
                user.setPhone(rs.getString("phone"));
                user.setAddress(rs.getString("address"));
                user.setUserRole(rs.getInt("userRole"));
                user.setUserRoleName(rs.getString("roleName"));
                user.setCreateBy(rs.getInt("createdBy"));
                user.setCreationDate(rs.getTimestamp("creationDate"));
                user.setModifyBy(rs.getInt("modifyBy"));
                user.setModifyDate(rs.getTimestamp("modifyDate"));
                userList.add(user);
            }

            BaseDao.closeResource(null, psmt, rs);
        }
        return userList;
    }

    @Override
    public int getUserCount(Connection connection, String userName, int userRole) throws Exception {
        PreparedStatement psmt = null;
        ResultSet rs = null;
        int count = 0;
        List<Object> list = new ArrayList<>();
        if (null != connection) {
            // 此处是为了后面好拼接, 所以才多加了一个 多表查询条件
            String sql = "select count(1) as count from smbms_user u, smbms_role r where u.userRole = r.id";
            if (!userName.isEmpty()) {
                sql += " and u.userName like ?";
                list.add("%" + userName + "%");
            }

            if (userRole > 0) {
                sql += " and u.userRole = ?";
                list.add(userRole);
            }
            rs = BaseDao.execute(connection, psmt, rs, sql, list.toArray());
            while (rs.next()) {
                count = rs.getInt("count");
            }
            BaseDao.closeResource(null, psmt, rs);
        }
        return count;
    }

    @Override
    public int deleteUserById(Connection connection, Integer delId) throws Exception {
        PreparedStatement psmt = null;
        int flag = 0;
        if (null != connection) {
            String sql = "delete from smbms_user where id = ?";
            Object[] params = {delId};
            flag = BaseDao.execute(connection, psmt, sql, params);
            BaseDao.closeResource(null, psmt, null);
        }
        return flag;
    }

    @Override
    public User getUserById(Connection connection, String id) throws Exception {
        User user = null;
        PreparedStatement psmt = null;
        ResultSet rs = null;
        if (null != connection) {
            String sql = "select u.*, roleName from smbms_user u, smbms_role r where u.id = ? and u.userRole = r.id";
            Object[] params = {id};
            rs = BaseDao.execute(connection, psmt, rs, sql, params);
            while (rs.next()) {
                user = new User();
                user.setId(rs.getInt("id"));
                user.setUserCode(rs.getString("userCode"));
                user.setUserName(rs.getString("userName"));
                user.setUserPassword(rs.getString("userPassword"));
                user.setGender(rs.getInt("gender"));
                user.setBirthday(rs.getDate("birthday"));
                user.setPhone(rs.getString("phone"));
                user.setAddress(rs.getString("address"));
                user.setUserRole(rs.getInt("userRole"));
                user.setCreateBy(rs.getInt("createdBy"));
                user.setCreationDate(rs.getTimestamp("creationDate"));
                user.setModifyBy(rs.getInt("modifyBy"));
                user.setModifyDate(rs.getTimestamp("modifyDate"));
                user.setUserRoleName(rs.getString("roleName"));
            }
            BaseDao.closeResource(null, psmt, rs);
        }
        return user;
    }

    @Override
    public int modify(Connection connection, User user) throws Exception {
        int flag = 0;
        PreparedStatement pstm = null;
        if (null != connection) {
            String sql = "update smbms_user set userName = ?, gender = ?, address = ?, birthday = ?, phone = ?, birthday = ?, userRole = ?," +
                    " modifyBy = ?, modifyDate = ? where id = ?";
            System.out.println("sql = " + sql);
            Object[] params = {user.getUserName(), user.getGender(), user.getAddress(), user.getBirthday(), user.getPhone(), user.getBirthday(),
            user.getUserRole(), user.getModifyBy(), user.getModifyDate(), user.getId()};
            flag = BaseDao.execute(connection, pstm, sql, params);
            BaseDao.closeResource(null, pstm, null);
        }
        return flag;
    }

    @Override
    public int updatePwd(Connection connection, int id, String pwd) throws Exception {
        int flag = 0;
        PreparedStatement pstm = null;
        if (null != connection) {
            String sql = "update smbms_user set userPassword = ? where id = ?";
            Object[] params = {pwd, id};
            flag = BaseDao.execute(connection, pstm, sql, params);
            BaseDao.closeResource(null, pstm, null);
        }
        return flag;
    }
}
