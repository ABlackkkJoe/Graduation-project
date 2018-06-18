package cn.smbms.dao.dpment;

import cn.smbms.dao.BaseDao;
import cn.smbms.pojo.Dpment;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;


public class DpmentDaoImpl implements DpmentDao {


    @Override
    public List<Dpment> getDp1List(Connection connection) throws Exception {
        PreparedStatement psmt = null;
        ResultSet rs = null;
        List<Dpment> dp1List = new ArrayList<>();
        if (null != connection) {
            String sql = "select dpname1 from card_dpment group by dpname1";
            Object[] params = {};
            rs = BaseDao.execute(connection, psmt, rs, sql, params);
            while (rs.next()) {
                Dpment dpment = new Dpment();
                dpment.setDpname1(rs.getString("dpname1"));
                dp1List.add(dpment);
            }
            BaseDao.closeResource(null, psmt, rs);
        }
        return dp1List;
    }

    @Override
    public List<Dpment> getDp2List(Connection connection) throws Exception {
        PreparedStatement psmt = null;
        ResultSet rs = null;
        List<Dpment> dp2List = new ArrayList<>();
        if (null != connection) {
            String sql = "select dpname2 from card_dpment group by dpname2";
            Object[] params = {};
            rs = BaseDao.execute(connection, psmt, rs, sql, params);
            while (rs.next()) {
                Dpment dpment = new Dpment();
                dpment.setDpname2(rs.getString("dpname2"));
                dp2List.add(dpment);
            }
            BaseDao.closeResource(null, psmt, rs);
        }
        return dp2List;
    }

    @Override
    public List<Dpment> getDp3List(Connection connection) throws Exception {
        PreparedStatement psmt = null;
        ResultSet rs = null;
        List<Dpment> dp3List = new ArrayList<>();
        if (null != connection) {
            String sql = "select dpname3 from card_dpment group by dpname3";
            Object[] params = {};
            rs = BaseDao.execute(connection, psmt, rs, sql, params);
            while (rs.next()) {
                Dpment dpment = new Dpment();
                dpment.setDpname3(rs.getString("dpname3"));
                dp3List.add(dpment);
            }
            BaseDao.closeResource(null, psmt, rs);
        }
        return dp3List;
    }
}
