package cn.smbms.pojo;


/**
 * DPMENY - 学院类
 */
public class Dpment {
    private String dpname1;
    private String dpname2;
    private String dpname3;
public Dpment(){

}

    public Dpment(String dpname1, String dpname2, String dpname3) {
        this.dpname1 = dpname1;
        this.dpname2 = dpname2;
        this.dpname3 = dpname3;
    }

    // setter and getter



    public void setDpname1(String dpname1) {
        this.dpname1 = dpname1;
    }

    public void setDpname2(String dpname2) {
        this.dpname2 = dpname2;
    }

    public void setDpname3(String dpname3) {
        this.dpname3 = dpname3;
    }



    @Override
    public String toString() {
        return "Dpment{" +
                "dpment1=" + dpname1 +
                ", dpment2='" + dpname2 + '\'' +
                ", dpment3='" + dpname3 +
                '}';
    }
}
