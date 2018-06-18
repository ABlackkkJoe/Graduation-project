package cn.smbms.dao.consume;

import cn.smbms.pojo.AConsume;
import cn.smbms.pojo.NConsume;
import cn.smbms.util.DBCPUtil;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import java.sql.SQLException;
import java.util.List;


public class ConsumeDaoImpl implements ConsumeDao{


    /**
     * 通过acccode获取信息
     * @param acccode
     * @return
     */
    @Override
    public List<AConsume> selectBy(Integer acccode){
        String sql = "select * from tb_a_attend_consume where acccode=? group by termname";

        QueryRunner queryRunner = new QueryRunner(DBCPUtil.getBasicDataSource());
        List<AConsume> consumes = null;
        try {
            consumes = queryRunner.query(sql,new BeanListHandler<AConsume>(AConsume.class),acccode);
        }catch (SQLException e){
            e.printStackTrace();
        }
        return consumes;
    }

    /**
     * 按照学号获取消费信息
     * @param outid
     * @return
     */
    @Override
    public List<NConsume> selectByNOutid(Integer outid) {
        String sql = "select * from tb_n_attend_consume_date where outid = ?";
        QueryRunner queryRunner = new QueryRunner(DBCPUtil.getBasicDataSource());
        List<NConsume> consumes = null;
        try {
            consumes = queryRunner.query(sql,new BeanListHandler<>(NConsume.class),outid);
        }catch (SQLException e){
            e.printStackTrace();
        }
        return consumes;
    }@Override
    public List<AConsume> selectByAOutid(Integer outid) {
        String sql = "select * from tb_a_attend_consume where outid = ?";
        QueryRunner queryRunner = new QueryRunner(DBCPUtil.getBasicDataSource());
        List<AConsume> consumes = null;
        try {
            consumes = queryRunner.query(sql,new BeanListHandler<>(AConsume.class),outid);
        }catch (SQLException e){
            e.printStackTrace();
        }
        return consumes;
    }
}
