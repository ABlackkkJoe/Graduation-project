package cn.smbms.service.role;

import cn.smbms.pojo.Role;

import java.util.List;


public interface RoleService {
    /**
     * 获取所有的角色
     */
    public List<Role> getRoleList();

}
