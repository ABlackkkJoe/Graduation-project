package cn.smbms.dao.consume;

import cn.smbms.pojo.Consume;


import java.sql.Connection;
import java.util.List;

public interface ConsumeDao {
    /**
     * 通过acccode获取信息
     * @param acccode
     * @return
     */
    public List<Consume> selectBy(Integer acccode);


    /**
     * 按照学号获取消费信息
     * @param outid
     * @return
     */
    public List<Consume> selectByOutid(Integer outid);

}
