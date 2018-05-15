package nuc.sw.zd.card.service.bill;

import nuc.sw.zd.card.dao.BaseDao;
import nuc.sw.zd.card.dao.bill.BillDao;
import nuc.sw.zd.card.dao.bill.BillDaoImpl;
import nuc.sw.zd.card.pojo.Bill;

import java.sql.Connection;
import java.util.List;


public class BillServiceImpl implements BillService {

    private BillDao billDao;
    public BillServiceImpl() {
        billDao = new BillDaoImpl();
    }

    @Override
    public boolean add(Bill bill) {
        Connection connection = null;
        boolean flag = false;
        try {
            connection = BaseDao.getConnection();
            connection.setAutoCommit(false);
            if (billDao.add(connection, bill) > 0) {
                flag = true;
            }
            connection.commit();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            BaseDao.closeResource(connection, null, null);
        }
        return flag;
    }

    @Override
    public List<Bill> getBillList(Bill bill) {
        Connection connection = null;
        List<Bill> billList = null;
        try {
            connection = BaseDao.getConnection();
            billList = billDao.getBillList(connection, bill);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            BaseDao.closeResource(connection, null, null);
        }
        return billList;
    }

    @Override
    public boolean deleteBillById(String delId) {
        Connection connection = null;
        boolean flag = false;
        try {
            connection = BaseDao.getConnection();
            if (billDao.deleteBillById(connection, delId) > 0) {
                flag = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            BaseDao.closeResource(connection, null, null);
        }
        return flag;
    }

    @Override
    public Bill getBillById(String id) {
        Connection connection = null;
        Bill bill = null;
        try {
            connection = BaseDao.getConnection();
            bill = billDao.getBillById(connection, id);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            BaseDao.closeResource(connection, null, null);
        }
        return bill;
    }

    @Override
    public boolean modify(Bill bill) {
        Connection connection = BaseDao.getConnection();
        boolean flag = false;
        try {
            if (billDao.modify(connection, bill) > 0) {
                flag = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
            bill = null;
        } finally {
            BaseDao.closeResource(connection, null, null);
        }
        return flag;
    }
}
