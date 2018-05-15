package cn.card.dao.dpment;

import cn.card.pojo.Dpment;

import java.sql.Connection;
import java.util.List;

/**
 * DpmentDao -- 用户接口
 */
public interface DpmentDao {
    /**
     * 增加用户信息
     */
    public int add(Connection connection, Dpment Dpment) throws Exception;

    /**
     * 通过DpmentCode获取Dpment
     */
    public Dpment getLoginDpment(Connection connection, String DpmentCode) throws Exception;

    /**
     * 通过条件查询 - DpmentList
     */
    public List<Dpment> getDpmentList(Connection connection, String DpmentName) throws Exception;

    /**
     * 通过DpmentId删除Dpment
     */
    public int deleteDpmentById(Connection connection, String delId) throws Exception;

    /**
     * 通过DpmentId获取Dpment, 并获取对应的角色名称
     */
    public Dpment getDpmentById(Connection connection, String id) throws Exception;

    public int modify(Connection connection, Dpment dpment) throws Exception;

}
