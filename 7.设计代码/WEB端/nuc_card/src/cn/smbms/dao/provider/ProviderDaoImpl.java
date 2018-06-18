package cn.smbms.dao.provider;

import cn.smbms.dao.BaseDao;
import cn.smbms.pojo.Provider;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;


public class ProviderDaoImpl implements ProviderDao {

    /*
    // 测试
    public static void main(String[] args) throws Exception {
        ProviderDaoImpl providerDao = new ProviderDaoImpl();
        // 1.添加
        Provider provider = new Provider();
        provider.setProCode("ZZ_GYS001");
        provider.setProName("河南蓝鸥科技");
        provider.setProDesc("hahahaahah");
        provider.setProContact("贞贞");
        provider.setProPhone("1243123421");
        provider.setProAddress("河南省郑州市");
        provider.setProFax("010-13421412");
        provider.setCreateBy(1);
        provider.setCreationDate(new Date());
        int flag = providerDao.add(BaseDao.getConnection(), provider);
        System.out.println("flag = " + flag);
        // 2.获取所有的列表
        List<Provider> proList = providerDao.getProviderList(BaseDao.getConnection(), null, null);
        for (Provider pro:proList) {
            System.out.println("pro:" + pro);
        }
        // 3.根据id获取某个provider
        Provider pro1 = providerDao.getProviderById(BaseDao.getConnection(), "10");
        System.out.println("pro1 = " + pro1);
        // 4.根据id删除某个provider
        flag = providerDao.deleteProviderById(BaseDao.getConnection(), "18");
        System.out.println("flag = " + flag);
        // 5.修改
        pro1.setProContact("贞贞");
        pro1.setModifyBy(1);
        pro1.setModifyDate(new Date());
        flag = providerDao.modify(BaseDao.getConnection(), pro1);
        System.out.println("flag = " + flag);
    }
    */

    @Override
    public int add(Connection connection, Provider provider) throws Exception {
        PreparedStatement psmt = null;
        int updateRows = 0;
        if (null != connection) {
            String sql = "insert into smbms_provider(proCode, proName, proDesc, proContact, proPhone, proAddress, proFax, createdBy," +
                    " creationDate) values(?,?,?,?,?,?,?,?,?)";
            Object[] params = {provider.getProCode(), provider.getProName(), provider.getProDesc(), provider.getProContact(), provider.getProPhone()
            , provider.getProAddress(), provider.getProFax(), provider.getCreateBy(), provider.getCreationDate()};
            updateRows = BaseDao.execute(connection, psmt, sql, params);
            BaseDao.closeResource(null, psmt, null);
        }
        return updateRows;
    }

    @Override
    public List<Provider> getProviderList(Connection connection, String proName, String proCode) throws Exception {
        System.out.println("proName = " + proName);
        System.out.println("proCode = " + proCode);

        PreparedStatement psmt = null;
        ResultSet rs = null;
        List<Provider> proList = new ArrayList<>();
        if (null != connection) {
            List<Object> params = new ArrayList<>();
            String sql = "select * from smbms_provider where 1=1 ";
            if (proName != null && !proName.isEmpty()) {
                sql += " and proName like ?";
                params.add("%" + proName + "%");
            }
            if (proCode != null && !proCode.isEmpty()) {
                sql += " and proCode like ?";
                params.add("%" + proCode + "%");
            }

            // 测试
            for (Object o:params) {
                System.out.println("o : " + o);
            }

            rs = BaseDao.execute(connection, psmt, rs, sql, params.toArray());
            while (rs.next()) {
                Provider provider = new Provider();
                provider.setId(rs.getInt("id"));
                provider.setProCode(rs.getString("proCode"));
                provider.setProName(rs.getString("proName"));
                provider.setProDesc(rs.getString("proDesc"));
                provider.setProContact(rs.getString("proContact"));
                provider.setProPhone(rs.getString("proPhone"));
                provider.setProAddress(rs.getString("proAddress"));
                provider.setProFax(rs.getString("proFax"));
                provider.setCreateBy(rs.getInt("createdBy"));
                provider.setCreationDate(rs.getTimestamp("creationDate"));
                proList.add(provider);
            }
            BaseDao.closeResource(null, psmt, rs);
        }
        return proList;
    }

    @Override
    public int deleteProviderById(Connection connection, String delId) throws Exception {
        PreparedStatement psmt = null;
        int flag = 0;
        if (null != connection) {
            String sql = "delete from smbms_provider where id = ?";
            Object[] params = {delId};
            flag = BaseDao.execute(connection, psmt, sql, params);
            BaseDao.closeResource(null, psmt, null);
        }
        return flag;
    }

    @Override
    public Provider getProviderById(Connection connection, String id) throws Exception {
        PreparedStatement psmt = null;
        Provider provider = null;
        ResultSet rs = null;
        if (null != connection) {
            String sql = "select * from smbms_provider where id = ?";
            Object[] params = {id};
            rs = BaseDao.execute(connection, psmt, rs, sql, params);
            while (rs.next()) {
                provider = new Provider();
                provider.setId(rs.getInt("id"));
                provider.setProCode(rs.getString("proCode"));
                provider.setProName(rs.getString("proName"));
                provider.setProDesc(rs.getString("proDesc"));
                provider.setProContact(rs.getString("proContact"));
                provider.setProPhone(rs.getString("proPhone"));
                provider.setProAddress(rs.getString("proAddress"));
                provider.setProFax(rs.getString("proFax"));
                provider.setCreateBy(rs.getInt("createdBy"));
                provider.setCreationDate(rs.getTimestamp("creationDate"));
                provider.setModifyBy(rs.getInt("modifyBy"));
                provider.setModifyDate(rs.getTimestamp("modifyDate"));
            }
            BaseDao.closeResource(null, psmt, rs);
        }
        return provider;
    }

    @Override
    public int modify(Connection connection, Provider provider) throws Exception {
        PreparedStatement psmt = null;
        int flag = 0;
        if (null != connection) {
            String sql = "update smbms_provider set proCode = ?, proName = ?, proDesc = ?, proContact = ?, proPhone = ?, proAddress = ?," +
                    " proFax = ?, createdby = ?, creationDate = ?, modifyBy = ?, modifyDate = ? where smbms_provider.id = ?";
            Object[] params = {provider.getProCode(), provider.getProName(), provider.getProDesc(), provider.getProContact(), provider.getProPhone()
                    , provider.getProAddress(), provider.getProFax(), provider.getCreateBy(), provider.getCreationDate(), provider.getModifyBy(),
                    provider.getModifyDate(), provider.getId()};
            flag = BaseDao.execute(connection, psmt, sql, params);
            BaseDao.closeResource(null, psmt, null);
        }
        return flag;
    }
}
