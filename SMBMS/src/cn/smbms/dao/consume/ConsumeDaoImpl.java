package cn.smbms.dao.consume;

import cn.smbms.dao.BaseDao;
import cn.smbms.pojo.Consume;
import cn.smbms.util.DBCPUtil;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


public class ConsumeDaoImpl implements ConsumeDao{


    /**
     * 通过acccode获取信息
     * @param acccode
     * @return
     */
    @Override
    public List<Consume> selectBy(Integer acccode){
        String sql = "select * from tb_a_attend_consume where acccode=? group by termname";

        QueryRunner queryRunner = new QueryRunner(DBCPUtil.getBasicDataSource());
        List<Consume> consumes = null;
        try {
            consumes = queryRunner.query(sql,new BeanListHandler<Consume>(Consume.class),acccode);
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
    public List<Consume> selectByOutid(Integer outid) {
        String sql = "select * from tb_a_attend_consume where outid = ?";

        QueryRunner queryRunner = new QueryRunner(DBCPUtil.getBasicDataSource());
        List<Consume> consumes = null;
        try {
            consumes = queryRunner.query(sql,new BeanListHandler<>(Consume.class),outid);
        }catch (SQLException e){
            e.printStackTrace();
        }
        return consumes;
    }
}
