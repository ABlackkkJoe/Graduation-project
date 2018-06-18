package cn.smbms.dao.role;


import cn.smbms.pojo.Role;

import java.sql.Connection;
import java.util.List;

/**
 * RoleDao: 用户角色接口
 */
public interface RoleDao {

    /**
     * 获取所有的角色数据
     */
    List<Role> getRoleList(Connection connection) throws  Exception;

}
