package cn.smbms.service.dpment;

import cn.smbms.dao.BaseDao;
import cn.smbms.dao.dpment.DpmentDao;
import cn.smbms.dao.dpment.DpmentDaoImpl;
import cn.smbms.pojo.Dpment;

import java.sql.Connection;
import java.util.List;

public class DpmentServiceImpl implements DpmentService {

    private DpmentDao DpmentDao;

    public DpmentServiceImpl() {
        DpmentDao = new DpmentDaoImpl();
    }


    @Override
    public List<Dpment> getDp1List() {
        Connection connection = null;
        List<Dpment> dp1List = null;
        try {
            connection = BaseDao.getConnection();
            dp1List = DpmentDao.getDp1List(connection);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            BaseDao.closeResource(connection, null, null);
        }
        return dp1List;
    }

    @Override
    public List<Dpment> getDp2List() {
        Connection connection = null;
        List<Dpment> dp2List = null;
        try {
            connection = BaseDao.getConnection();
            dp2List = DpmentDao.getDp1List(connection);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            BaseDao.closeResource(connection, null, null);
        }
        return dp2List;
    }

    @Override
    public List<Dpment> getDp3List() {
        Connection connection = null;
        List<Dpment> dp3List = null;
        try {
            connection = BaseDao.getConnection();
            dp3List = DpmentDao.getDp1List(connection);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            BaseDao.closeResource(connection, null, null);
        }
        return dp3List;
    }
}
