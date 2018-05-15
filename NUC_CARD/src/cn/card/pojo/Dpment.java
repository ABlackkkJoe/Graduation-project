package cn.card.pojo;


import java.util.Date;

/**
 * DPMENY - 学院类
 */
public class Dpment {
    private int id;
    private String dpname1;
    private String dpname2;
    private String dpname3;
    private String dpname4;
    private Integer createdBy;     // 创建者
    private Date creationDate;    // 创建时间
    private Integer modifyBy;     // 更新者
    private Date modifyDate;      // 更新时间
public Dpment(){

}

    public Dpment(int id,String dpname1, String dpname2, String dpname3, String dpname4, Integer createdBy, Date creationDate, Integer modifyBy, Date modifyDate) {
        this.id=id;
        this.dpname1 = dpname1;
        this.dpname2 = dpname2;
        this.dpname3 = dpname3;
        this.dpname4 = dpname4;
        this.createdBy = createdBy;
        this.creationDate = creationDate;
        this.modifyBy = modifyBy;
        this.modifyDate = modifyDate;
    }

    // setter and getter


    public void setId(int id) {
        this.id = id;
    }

    public int getId() {
        return id;
    }

    public void setDpname1(String dpname1) {
        this.dpname1 = dpname1;
    }

    public void setDpname2(String dpname2) {
        this.dpname2 = dpname2;
    }

    public void setDpname3(String dpname3) {
        this.dpname3 = dpname3;
    }

    public void setDpname4(String dpname4) {
        this.dpname4 = dpname4;
    }

    public String getDpname1() {
        return dpname1;
    }

    public String getDpname2() {
        return dpname2;
    }

    public String getDpname3() {
        return dpname3;
    }

    public String getDpname4() {
        return dpname4;
    }

    public Integer getCreateBy() {
        return createdBy;
    }

    public void setCreateBy(Integer createBy) {
        this.createdBy = createBy;
    }

    public Date getCreationDate() {
        return creationDate;
    }

    public void setCreationDate(Date creationDate) {
        this.creationDate = creationDate;
    }

    public Integer getModifyBy() {
        return modifyBy;
    }

    public void setModifyBy(Integer modifyBy) {
        this.modifyBy = modifyBy;
    }

    public Date getModifyDate() {
        return modifyDate;
    }

    public void setModifyDate(Date modifyDate) {
        this.modifyDate = modifyDate;
    }



    @Override
    public String toString() {
        return "Dpment{" +
                "id=" +id +
                "dpment1=" + dpname1 +
                ", dpment2='" + dpname2 + '\'' +
                ", dpment3='" + dpname3 + '\'' +
                ", dpment4='" + dpname4 + '\'' +
                ", createBy=" + createdBy +
                ", creationDate=" + creationDate +
                ", modifyBy=" + modifyBy +
                ", modifyDate=" + modifyDate  +
                '}';
    }
}
