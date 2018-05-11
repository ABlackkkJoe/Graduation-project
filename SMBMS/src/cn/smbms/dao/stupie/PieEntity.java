package cn.smbms.dao.stupie;

public class PieEntity {
    private int acccode;
    private double opfare;
    private String termname;
    private String classname;
    private String updatetime;

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

    public void setOpfare(double opfare) {
        this.opfare = opfare;
    }

    public double getOpfare() {
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
        return "PieEntity [acccode=" + acccode + ", opfare=" + opfare+ ", termname=" + termname + ", classname="
                + classname + ", updatetime=" + updatetime + "]";
    }
    public PieEntity(int acccode, double opfare,String termname, String classname, String updatetime) {
        super();
        this.termname=termname;
        this.acccode = acccode;
        this.opfare = opfare;
        this.classname = classname;
        this.updatetime = updatetime;
    }
    public PieEntity() {
    }
}