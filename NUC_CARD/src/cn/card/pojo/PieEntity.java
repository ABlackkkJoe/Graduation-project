package cn.card.pojo;

public class PieEntity {
    private String opedt;
    private String opdt;
    private String dscrp;
    private  float balance;
    private  float cost;
    private int acccode;
    private float opfare;
    private float income;
    private String outid;
    private String passwd;
    private  float max;
    private  float min;
    private int status;
    private String dt;
    private String termname;
    private String dpname1;
    private String dpname2;
    private String dpname3;
    private String dpname4;
    private String classname;
    private String updatetime;
    private float ave;
private int count;

    public void setOpedt(String opedt) {
        this.opedt = opedt;
    }

    public String getOpedt() {
        return opedt;
    }

    public void setIncome(float income) {
        this.income = income;
    }

    public float getIncome() {
        return income;
    }

    public void setOpdt(String opdt) {
        this.opdt = opdt;
    }

    public String getOpdt() {
        return opdt;
    }

    public void setDscrp(String dscrp) {
        this.dscrp = dscrp;
    }

    public String getDscrp() {
        return dscrp;
    }

    public void setCost(float cost) {
        this.cost = cost;
    }

    public float getCost() {
        return cost;
    }

    public void setBalance(float balance) {
        this.balance = balance;
    }

    public float getBalance() {
        return balance;
    }

    public void setPasswd(String passwd) {
        this.passwd = passwd;
    }

    public String getPasswd() {
        return passwd;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public int getStatus() {
        return status;
    }

    public void setMax(float max) {
        this.max = max;
    }

    public void setMin(float min) {
        this.min = min;
    }

    public float getMax() {
        return max;
    }

    public float getMin() {
        return min;
    }

    public void setDt(String dt) {
        this.dt = dt;
    }

    public String getDt() {
        return dt;
    }

    public void setOutid(String outid) {
        this.outid = outid;
    }

    public String getOutid() {
        return outid;
    }

    public void setAve(float ave) {
        this.ave = ave;
    }

    public float getAve() {
        return ave;
    }

    public void setCount(int count) {
        this.count = count;
    }

    public int getCount() {
        return count;
    }

    public void setDpname1(String dpname1) {
        this.dpname1 = dpname1;
    }

    public String getDpname1() {
        return dpname1;
    }

    public void setDpname2(String dpname2) {
        this.dpname2 = dpname2;
    }

    public String getDpname2() {
        return dpname2;
    }

    public void setDpname3(String dpname3) {
        this.dpname3 = dpname3;
    }

    public String getDpname3() {
        return dpname3;
    }

    public void setDpname4(String dpname4) {
        this.dpname4 = dpname4;
    }

    public String getDpname4() {
        return dpname4;
    }

    public void setTermname(String termname) {
        this.termname = termname;
    }

    public String getTermname() {
        return termname;
    }

    public void setAcccode(int acccode) {
        this.acccode = acccode;
    }
    public int getAcccode() {
        return acccode;
    }

    public void setOpfare(float opfare) {
        this.opfare = opfare;
    }

    public float getOpfare() {
        return opfare;
    }

    public String getClassname() {
        return classname;
    }
    public void setClassname(String classname) {
        this.classname = classname;
    }
    public String getUpdatetime() {
        return updatetime;
    }
    public void setUpdatetime(String updatetime) {
        this.updatetime = updatetime;
    }
    @Override
    public String toString() {
        return "PieEntity [acccode=" + acccode+ ", outid=" + outid + ", opfare=" + opfare+ ", termname=" + termname + ", dpname2=" + dpname2+ ", dpname3=" + dpname3+ ", dpname1=" + dpname1+ ", dpname4=" + dpname4+ ", classname="
                + classname+ ", opedt=" + opedt+ ", income=" + income+ ", opdt=" + opdt+ ", dscrp=" + dscrp+ ", cost=" + cost+ ", passwd=" + passwd+ ", status=" + status+ ", dt=" + dt + ", max=" + max + ", min=" + min + ", count=" + count+ ", ave=" + ave+ ", updatetime=" + updatetime + "]";
    }
    public PieEntity(int count,String opedt,int status,float income,String dscrp,String opdt,float cost,float balance,String passwd,int acccode,String outid,float max,float min,String dt, float ave,float opfare,String termname,String dpname1,String dpname2,String dpname3,String dpname4, String classname, String updatetime) {
        super();
        this.opedt=opedt;
        this.income=income;
        this.opdt=opdt;
        this.dscrp=dscrp;
        this.cost=cost;
        this.balance=balance;
        this.passwd=passwd;
        this.status=status;
        this.max=max;
        this.min=min;
        this.dt=dt;
        this.ave=ave;
        this.outid=outid;
        this.count=count;
        this.termname=termname;
        this.acccode = acccode;
        this.opfare = opfare;
        this.dpname1=dpname1;
        this.dpname2=dpname2;
        this.dpname3=dpname3;
        this.dpname4=dpname4;
        this.classname = classname;
        this.updatetime = updatetime;
    }
    public PieEntity() {
    }
}