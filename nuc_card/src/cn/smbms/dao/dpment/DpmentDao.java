package cn.smbms.dao.dpment;

import cn.smbms.pojo.Dpment;

import java.sql.Connection;
import java.util.List;

/**
 * DpmentDao -- 用户接口
 */
public interface DpmentDao {
    List<Dpment> getDp1List(Connection connection) throws  Exception;
    List<Dpment> getDp2List(Connection connection) throws  Exception;
    List<Dpment> getDp3List(Connection connection) throws  Exception;

}
