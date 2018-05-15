package nuc.sw.zd.card.dao.dpment;

import nuc.sw.zd.card.dao.BaseDao;
import nuc.sw.zd.card.pojo.Dpment;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;


public class DpmentDaoImpl implements DpmentDao {


    @Override
    public int add(Connection connection, Dpment Dpment) throws Exception {
        PreparedStatement pstm = null;  // 预编译指令
        int updateRows = 0;
        if (null != connection) {
            String sql = "insert into smbms_dpment(Dpment1, Dpment2, Dpment3,Dpment4," +
                    "createdBy, creationDate) values(?,?,?,?,?,?)";
            Object[] params = {Dpment.getDpname1(), Dpment.getDpname2(), Dpment.getDpname3(), Dpment.getDpname4()
            , Dpment.getCreateBy(), Dpment.getCreationDate()};
            updateRows = BaseDao.execute(connection, pstm, sql, params);
            BaseDao.closeResource(null, pstm, null);
        }
        return updateRows;
    }

    @Override
    public Dpment getLoginDpment(Connection connection, String DpmentCode) throws Exception {
        PreparedStatement pstm = null;
        ResultSet rs = null;
        Dpment Dpment = null;
        if (null != connection) {
            String sql = "select * from smbms_dpment where DpmentCode = ?";
            Object[] params = {DpmentCode};
            rs = BaseDao.execute(connection, pstm, rs, sql, params);
            if (rs.next()) {
                Dpment = new Dpment();
                Dpment.setDpname1(rs.getString("dpname1"));
                Dpment.setDpname2(rs.getString("dpname2"));
                Dpment.setDpname3(rs.getString("dpname3"));
                Dpment.setDpname4(rs.getString("dpname4"));
                Dpment.setCreateBy(rs.getInt("createdBy"));
                Dpment.setCreationDate(rs.getTimestamp("creationDate"));
                Dpment.setModifyBy(rs.getInt("modifyBy"));
                Dpment.setModifyDate(rs.getTimestamp("modifyDate"));
            }
            BaseDao.closeResource(null, pstm, rs);
        }
        return Dpment;
    }

    @Override
    public List<Dpment> getDpmentList(Connection connection, String DpmentName) throws Exception {
        PreparedStatement psmt = null;
        ResultSet rs = null;
        List<Dpment> DpmentList = new ArrayList<>();
        if (null != connection) {
            List<Object> list = new ArrayList<>();
            String sql = "select * from smbms_dpment";
            if (!DpmentName.isEmpty()) {
                list.add("%" + DpmentName + "%");
            }
            sql += " order by creationDate desc limit ?, ?";
            rs = BaseDao.execute(connection, psmt, rs, sql, list.toArray());
            while (rs.next()) {
                Dpment Dpment = new Dpment();
                Dpment.setDpname1(rs.getString("dpname1"));
                Dpment.setDpname2(rs.getString("dpname2"));
                Dpment.setDpname3(rs.getString("dpname3"));
                Dpment.setDpname4(rs.getString("dpname4"));
                Dpment.setCreateBy(rs.getInt("createdBy"));
                Dpment.setCreationDate(rs.getTimestamp("creationDate"));
                Dpment.setModifyBy(rs.getInt("modifyBy"));
                Dpment.setModifyDate(rs.getTimestamp("modifyDate"));
                DpmentList.add(Dpment);
            }

            BaseDao.closeResource(null, psmt, rs);
        }
        return DpmentList;
    }


    @Override
    public int deleteDpmentById(Connection connection, String delId) throws Exception {
        PreparedStatement psmt = null;
        int flag = 0;
        if (null != connection) {
            String sql = "delete from smbms_dpment where id = ?";
            Object[] params = {delId};
            flag = BaseDao.execute(connection, psmt, sql, params);
            BaseDao.closeResource(null, psmt, null);
        }
        return flag;
    }

    @Override
    public Dpment getDpmentById(Connection connection, String id) throws Exception {
        Dpment Dpment = null;
        PreparedStatement psmt = null;
        ResultSet rs = null;
        if (null != connection) {
            String sql = "select u.* from smbms_dpment u";
            Object[] params = {id};
            rs = BaseDao.execute(connection, psmt, rs, sql, params);
            while (rs.next()) {
                Dpment = new Dpment();
                Dpment.setId(rs.getInt("id"));
                Dpment.setDpname1(rs.getString("dpname1"));
                Dpment.setDpname2(rs.getString("dpname2"));
                Dpment.setDpname3(rs.getString("dpname3"));
                Dpment.setDpname4(rs.getString("dpname4"));
                Dpment.setCreateBy(rs.getInt("createdBy"));
                Dpment.setCreationDate(rs.getTimestamp("creationDate"));
                Dpment.setModifyBy(rs.getInt("modifyBy"));
                Dpment.setModifyDate(rs.getTimestamp("modifyDate"));
            }
            BaseDao.closeResource(null, psmt, rs);
        }
        return Dpment;
    }

    @Override
    public int modify(Connection connection, Dpment dpment) throws Exception {
        PreparedStatement psmt = null;
        int flag = 0;
        if (null != connection) {
            String sql = "update smbms_dpment set dpment1 = ?, dpment2= ?, dpment3= ?, dpment4 = ?, " +
                    " createdby = ?, creationDate = ?, modifyBy = ?, modifyDate = ? where smbms_dpment.id = ?";
            Object[] params = {dpment.getDpname1(), dpment.getDpname2(), dpment.getDpname3(), dpment.getDpname4(),
                     dpment.getCreateBy(), dpment.getCreationDate(),dpment.getModifyBy(),
                    dpment.getModifyDate(), dpment.getId()};
            flag = BaseDao.execute(connection, psmt, sql, params);
            BaseDao.closeResource(null, psmt, null);
        }
        return flag;
    }
}
