package nuc.sw.zd.card.dao.bill;



import nuc.sw.zd.card.pojo.Bill;

import java.sql.Connection;
import java.util.List;

/**
 * 订单接口
 */
public interface BillDao {
    /**
     * 增加订单
     */
    public int add(Connection connection, Bill bill) throws Exception;

    /**
     * 通过查询条件获取供应商列表-模糊查询
     */
    public List<Bill> getBillList(Connection connection, Bill bill) throws Exception;

    /**
     * 根据delId删除Bill
     */
    public int deleteBillById(Connection connection, String id) throws Exception;

    /**
     * 根据id获取Bill
     */
    public Bill getBillById(Connection connection, String id) throws Exception;

    /**
     * 修改订单信息
     */
    public int modify(Connection connection, Bill bill) throws Exception;

    /**
     * 根据供应商ID查询订单数量
     */
    public int getBillCountByProviderId(Connection connection, String providerId) throws Exception;
}
