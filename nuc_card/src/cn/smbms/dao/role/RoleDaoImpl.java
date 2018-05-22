package cn.smbms.dao.role;

import cn.smbms.dao.BaseDao;
import cn.smbms.pojo.Role;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class RoleDaoImpl implements RoleDao {

    /*
    // 测试
    public static void main(String[] args) throws Exception {
        RoleDaoImpl roleDao = new RoleDaoImpl();
        List<Role> roleList = roleDao.getRoleList(BaseDao.getConnection());
        for (Role role : roleList) {
            System.out.println("role = " + role);
        }
    }
    */


    @Override
    public List<Role> getRoleList(Connection connection) throws Exception {
        PreparedStatement psmt = null;
        ResultSet rs = null;
        List<Role> roleList = new ArrayList<>();
        if (null != connection) {
            String sql = "select * from card_role";
            Object[] params = {};
            rs = BaseDao.execute(connection, psmt, rs, sql, params);
            while (rs.next()) {
                Role role = new Role();
                role.setId(rs.getInt("id"));
                role.setRoleCode(rs.getString("roleCode"));
                role.setRoleName(rs.getString("roleName"));
                roleList.add(role);
            }
            BaseDao.closeResource(null, psmt, rs);
        }
        return roleList;
    }
}
