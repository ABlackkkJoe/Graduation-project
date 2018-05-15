package nuc.sw.zd.card.service.role;

import nuc.sw.zd.card.dao.BaseDao;
import nuc.sw.zd.card.dao.role.RoleDaoImpl;
import nuc.sw.zd.card.pojo.Role;

import java.sql.Connection;
import java.util.List;


public class RoleServiceImpl implements RoleService {

    private RoleDaoImpl roleDao;

    public RoleServiceImpl() {
        roleDao = new RoleDaoImpl();
    }

    @Override
    public List<Role> getRoleList() {
        Connection connection = null;
        List<Role> roleList = null;
        try {
            connection = BaseDao.getConnection();
            roleList = roleDao.getRoleList(connection);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            BaseDao.closeResource(connection, null, null);
        }
        return roleList;
    }
}
