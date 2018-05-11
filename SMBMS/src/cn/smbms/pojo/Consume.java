package cn.smbms.pojo;
/**
 * 消费账单类
 */


public class Consume {
    private Integer outid;      //编号
    private Integer acccode;    //用户名
    private Double opfare_sum;
    private String termname;
    private String dpname1;     //学院
    private String dpname2;     //系
    private String dpname3;     //年级
    private String dpname4;     //学号


    public Consume() {
    }

    public Consume(Integer outid, Integer acccode, Double opfare_sum, String termname, String dpname1, String dpname2, String dpname3, String dpname4) {
        this.outid = outid;
        this.acccode = acccode;
        this.opfare_sum = opfare_sum;
        this.termname = termname;
        this.dpname1 = dpname1;
        this.dpname2 = dpname2;
        this.dpname3 = dpname3;
        this.dpname4 = dpname4;
    }

    public Integer getOutid() {
        return outid;
    }

    public void setOutid(Integer outid) {
        this.outid = outid;
    }

    public Integer getAcccode() {
        return acccode;
    }

    public void setAcccode(Integer acccode) {
        this.acccode = acccode;
    }

    public Double getOpfare_sum() {
        return opfare_sum;
    }

    public void setOpfare_sum(Double opfare_sum) {
        this.opfare_sum = opfare_sum;
    }

    public String getTermname() {
        return termname;
    }

    public void setTermname(String termname) {
        this.termname = termname;
    }

    public String getDpname1() {
        return dpname1;
    }

    public void setDpname1(String dpname1) {
        this.dpname1 = dpname1;
    }

    public String getDpname2() {
        return dpname2;
    }

    public void setDpname2(String dpname2) {
        this.dpname2 = dpname2;
    }

    public String getDpname3() {
        return dpname3;
    }

    public void setDpname3(String dpname3) {
        this.dpname3 = dpname3;
    }

    public String getDpname4() {
        return dpname4;
    }

    public void setDpname4(String dpname4) {
        this.dpname4 = dpname4;
    }


    @Override
    public String toString() {
        return "Consume{" +
                "outid=" + outid +
                ", acccode=" + acccode +
                ", opfare_sum=" + opfare_sum +
                ", termname='" + termname + '\'' +
                ", dpname1='" + dpname1 + '\'' +
                ", dpname2='" + dpname2 + '\'' +
                ", dpname3='" + dpname3 + '\'' +
                ", dpname4='" + dpname4 + '\'' +
                '}';
    }
}
