package cn.card.dao.bill;

import cn.card.dao.BaseDao;
import cn.card.pojo.Bill;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class BillDaoImpl implements BillDao {

    @Override
    public int add(Connection connection, Bill bill) throws Exception {
        PreparedStatement psmt = null;
        ResultSet rs = null;
        int updateRows = 0;
        if (null != connection) {
            String sql = "insert into smbms_bill(billCode, productName, productDesc, productUnit, productCount, totalPrice, isPayment, createdBy, creationDate, providerId)" +
                    "values(?,?,?,?,?,?,?,?,?,?)";
            Object[] params = {bill.getBillCode(), bill.getProductName(), bill.getProductDesc(), bill.getProductUnit(), bill.getProductCount(), bill.getTotalPrice()
            , bill.getIsPayment(), bill.getCreateBy(), bill.getCreationDate(), bill.getProviderId()};
            updateRows = BaseDao.execute(BaseDao.getConnection(), psmt, sql, params);
            BaseDao.closeResource(null, psmt, null);
        }
        return updateRows;
    }

    @Override
    public List<Bill> getBillList(Connection connection, Bill bill) throws Exception {
        PreparedStatement psmt = null;
        ResultSet rs = null;
        List<Bill> billList = new ArrayList<>();
        if (null != connection) {
            String sql = "select b.*, p.proName as providerName from smbms_bill b, smbms_provider p where b.providerId = p.id";
            List<Object> params = new ArrayList<>();
            if (bill.getProductName() != null && !bill.getProductName().isEmpty()) {
                sql += " and b.productName like ?";
                params.add("%" + bill.getProductName() + "%");
            }

            if (bill.getProviderId() > 0) {
                sql += " and providerId = ?";
                params.add(bill.getProviderId());
            }

            if (bill.getIsPayment() > 0) {
                sql += " and isPayment = ?";
                params.add(bill.getIsPayment());
            }


            rs = BaseDao.execute(connection, psmt, rs, sql, params.toArray());
            while (rs.next()) {
                Bill _bill = new Bill();
                _bill.setId(rs.getInt("id"));
                _bill.setBillCode(rs.getString("billCode"));
                _bill.setProductName(rs.getString("productName"));
                _bill.setProductDesc(rs.getString("productDesc"));
                _bill.setProductUnit(rs.getString("productUnit"));
                _bill.setProductCount(rs.getBigDecimal("productCount"));
                _bill.setTotalPrice(rs.getBigDecimal("totalPrice"));
                _bill.setIsPayment(rs.getInt("isPayment"));
                _bill.setProviderId(rs.getInt("providerId"));
                _bill.setProvideName(rs.getString("providerName"));
                _bill.setCreationDate(rs.getTimestamp("creationDate"));
                _bill.setCreateBy(rs.getInt("createdBy"));
                _bill.setModifyBy(rs.getInt("modifyBy"));
                _bill.setModifyDate(rs.getTimestamp("modifyDate"));
                billList.add(_bill);
            }
            BaseDao.closeResource(null, psmt, rs);
        }
        return billList;
    }

    @Override
    public int deleteBillById(Connection connection, String id) throws Exception {
        PreparedStatement psmt = null;
        int flag = 0;
        if (null != connection) {
            String sql = "delete from smbms_bill where id = ?";
            Object[] params = {id};
            flag = BaseDao.execute(BaseDao.getConnection(), psmt, sql, params);
            BaseDao.closeResource(null, psmt, null);
        }
        return flag;
    }

    @Override
    public Bill getBillById(Connection connection, String id) throws Exception {
        PreparedStatement psmt = null;
        ResultSet rs = null;
        Bill bill = null;
        if (null != connection) {
            String sql = "select b.*, p.proName as providerName from smbms_bill b, smbms_provider p where b.providerId = p.id and b.id = ?";
            Object[] params = {id};
            rs = BaseDao.execute(connection, psmt, rs, sql, params);
            while (rs.next()) {
                bill = new Bill();
                bill.setId(rs.getInt("id"));
                bill.setBillCode(rs.getString("billCode"));
                bill.setProductName(rs.getString("productName"));
                bill.setProductDesc(rs.getString("productDesc"));
                bill.setProductUnit(rs.getString("productUnit"));
                bill.setProductCount(rs.getBigDecimal("productCount"));
                bill.setTotalPrice(rs.getBigDecimal("totalPrice"));
                bill.setIsPayment(rs.getInt("isPayment"));
                bill.setProviderId(rs.getInt("providerId"));
                bill.setProvideName(rs.getString("providerName"));
                bill.setCreationDate(rs.getTimestamp("creationDate"));
                bill.setCreateBy(rs.getInt("createdBy"));
                bill.setModifyBy(rs.getInt("modifyBy"));
                bill.setModifyDate(rs.getTimestamp("modifyDate"));
            }
            BaseDao.closeResource(null, psmt, rs);
        }
        return bill;
    }

    @Override
    public int modify(Connection connection, Bill bill) throws Exception {
        PreparedStatement psmt = null;
        int flag = 0;
        if (null != connection) {
            String sql = "update smbms_bill set billCode = ?, productName = ?, productDesc = ?, productUnit = ?, productCount = ?, " +
                    "totalPrice = ?, isPayment = ?, modifyBy = ?, modifyDate = ?, providerId = ? where id = ?";
            Object[] params = {bill.getBillCode(), bill.getProductName(), bill.getProductDesc(), bill.getProductUnit(), bill.getProductCount(), bill.getTotalPrice()
                    , bill.getIsPayment(), bill.getModifyBy(), bill.getModifyDate(), bill.getProviderId(), bill.getId()};
            flag = BaseDao.execute(connection, psmt, sql, params);
            BaseDao.closeResource(null, psmt, null);
        }
        return flag;
    }

    @Override
    public int getBillCountByProviderId(Connection connection, String providerId) throws Exception {
        PreparedStatement psmt = null;
        ResultSet rs = null;
        int count = 0;
        if (null != connection) {
            String sql = "select count(1) as billCount from smbms_bill where providerId = ?";
            Object[] params = {providerId};
            rs = BaseDao.execute(connection, psmt, rs, sql, params);
            while (rs.next()) {
                count = rs.getInt("billCount");
            }
            BaseDao.closeResource(null, psmt, rs);
        }
        return count;
    }
}
