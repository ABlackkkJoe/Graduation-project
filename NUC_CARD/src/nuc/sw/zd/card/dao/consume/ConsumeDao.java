package nuc.sw.zd.card.dao.consume;

import nuc.sw.zd.card.pojo.AConsume;
import nuc.sw.zd.card.pojo.NConsume;

import java.util.List;

public interface ConsumeDao {
    /**
     * 通过acccode获取信息
     * @param acccode
     * @return
     */
    public List<AConsume> selectBy(Integer acccode);


    /**
     * 按照学号获取消费信息
     * @param outid
     * @return
     */
    public List<AConsume> selectByAOutid(Integer outid);
    public List<NConsume> selectByNOutid(Integer outid);

}
