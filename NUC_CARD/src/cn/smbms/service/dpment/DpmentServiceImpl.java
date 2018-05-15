package cn.smbms.service.dpment;

import cn.smbms.dao.BaseDao;
import cn.smbms.dao.dpment.DpmentDao;
import cn.smbms.dao.dpment.DpmentDaoImpl;
import cn.smbms.pojo.Dpment;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

public class DpmentServiceImpl implements DpmentService {

    private DpmentDao DpmentDao;

    public DpmentServiceImpl() {
        DpmentDao = new DpmentDaoImpl();
    }

    @Override
    public boolean add(Dpment Dpment) {
        boolean flag = false;
        Connection connection = null;
        try {
            connection = BaseDao.getConnection();
            connection.setAutoCommit(false);  // 开启JDBC事务管理
            if (DpmentDao.add(connection, Dpment) > 0) {
                flag = true;
            }
            connection.commit();
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
    public List<Dpment> getDpmentList(String dpname1) {
        Connection connection = null;
        List<Dpment> DpmentList = null;
        try {
            connection = BaseDao.getConnection();
            DpmentList = DpmentDao.getDpmentList(connection, dpname1);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            BaseDao.closeResource(connection, null, null);
        }
        return DpmentList;
    }

    @Override
    public int deleteDpmentById(String delId) {
        int flag=0;
        Connection connection = null;
        try {
            connection = BaseDao.getConnection();
            connection.setAutoCommit(false);
            flag=DpmentDao.deleteDpmentById(connection, delId);
            connection.commit();
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
    public Dpment getDpmentById(String id) {
        Connection connection = null;
        Dpment Dpment = null;
        try {
            connection = BaseDao.getConnection();
            Dpment = DpmentDao.getDpmentById(connection, id);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            BaseDao.closeResource(connection, null, null);
        }
        return Dpment;
    }

    @Override
    public boolean modify(Dpment Dpment) {
        Connection connection = BaseDao.getConnection();
        boolean flag = false;
        try {
            if (DpmentDao.modify(connection, Dpment) > 0) {
                flag = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            BaseDao.closeResource(connection, null, null);
        }
        return flag;
    }
}
