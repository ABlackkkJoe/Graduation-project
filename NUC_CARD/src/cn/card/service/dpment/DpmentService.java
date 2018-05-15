package cn.card.service.dpment;

import cn.card.pojo.Dpment;

import java.util.List;

public interface DpmentService {

    /**
     * 增加供应商
     * @param Dpment
     * @return
     */
    public boolean add(Dpment Dpment);

    /**
     * 通过供应商名称,编码获取供应商列表 - 模糊查询 - DpmentList
     * @param dpname1
     * @return
     */
    public List<Dpment> getDpmentList(String dpname1);

    /**
     * 通过proId删除Dpment
     * @param delId
     * @return
     */
    public int deleteDpmentById(String delId);

    /**
     * 通过proId获取Dpment
     * @param id
     * @return
     */
    public Dpment getDpmentById(String id);

    /**
     * 修改用户信息
     * @param Dpment
     * @return
     */
    public boolean modify(Dpment Dpment);
}
