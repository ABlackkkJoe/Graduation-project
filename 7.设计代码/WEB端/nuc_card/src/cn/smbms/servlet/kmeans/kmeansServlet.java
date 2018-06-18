package cn.smbms.servlet.kmeans;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.util.ArrayList;

@WebServlet("/kmeans")
public class kmeansServlet extends HttpServlet {

    //聚类的数目
    final static int ClassCount = 2;
    //样本数目（测试集）
    final static int InstanceNumber = 6923;
    //样本属性数目（测试）
    final static int FieldCount = 3;

    //设置异常点阈值参数（每一类初始的最小数目为InstanceNumber/ClassCount^t）
    final static double t = 2.0;
    //存放学号
    private String[] number;
    //存放数据的矩阵
    private float[][] data;
    //每个类的均值中心
    private float[][] classData;
    //噪声集合索引
    private ArrayList<Integer> noises;
    //存放每次变换结果的矩阵
    private ArrayList<ArrayList<Integer>> result;
    private HttpServletRequest request;
    private HttpServletResponse response;

    public kmeansServlet(){
        //最后一位用来储存结果
        number=new String[InstanceNumber];
        data = new float[InstanceNumber][FieldCount+1];//6923 6
        classData = new float[ClassCount][FieldCount];//3 5
        result = new ArrayList<ArrayList<Integer>>(ClassCount);//list 3
        noises = new ArrayList<Integer>();//
    }
    public void readData(String TrainDataFile){
        try{
            FileReader fr = new FileReader(TrainDataFile);
            BufferedReader br = new BufferedReader(fr);
            //存放数据的临时变量
            String lineData = null;
            String[] splitData = null;
            int line = 0;
            while( br.ready()){
                lineData = br.readLine();
                //System.out.println(lineData);
                splitData = lineData.split(" ");
                for(int i = 0 ; i < splitData.length ;i++){
                    data[line][i] = Float.parseFloat(splitData[i]);
                }
                line++;
            }
        }catch(Exception e){
            e.printStackTrace();
        }

    }
    /*
     * 聚类过程，主要分为两步
     * 1.循环找初始点
     * 2.不断调整直到分类不再发生变化
     */
    public void cluster()
    {
        //数据归一化
        normalize();
        //标记是否需要重新找初始点
        boolean needUpdataInitials = true;

        //找初始点的迭代次数
        int times = 1;
        //找初始点
        while(needUpdataInitials)
        {
            needUpdataInitials = false;
            result.clear();
            System.out.println("Find Initials Iteration"+(times++)+"time(s)");

            //一次找初始点的尝试和根据初始点的分类
            findInitials();
            firstClassify();

            //如果某个分类的数目小于特定的阈值，则认为这个分类中的所有样本都是噪声点
            //需要重新找初始点
            for(int i = 0;i < result.size();i++)
            {
                if(result.get(i).size() < InstanceNumber/Math.pow(ClassCount,t))
                {
                    needUpdataInitials = true;
                    noises.addAll(result.get(i));
                }
            }
        }

        //找到合适的初始点后
        //不断的调整均值中心和分类，直到不再发生任何变化
        Adjust();
    }
    /*
     * 对数据进行归一化
     * 1.找每一个属性的最大值
     * 2.对某个样本的每个属性除以其最大值
     */
    private void normalize(){
        //找最大值
        float[] max = new float[FieldCount];
        for(int i = 0;i < InstanceNumber;i++){
            for(int j = 0;j < FieldCount;j++){
                if(data[i][j] > max[j])
                    max[j] = data[i][j];
            }
        }

        //归一化
        for(int i = 0;i < InstanceNumber;i++){
            for(int j = 0;j < FieldCount;j++){
                data[i][j] = data[i][j]/max[j];
            }
        }
    }

    // 关于初始向量的一次找寻尝试
    private void findInitials() {
        // a,b为标志距离最远的两个向量的索引
        int i, j, a, b;
        i = j = a = b = 0;

        // 最远距离
        float maxDis = 0;

        // 已经找到的初始点个数
        int alreadyCls = 2;

        // 存放已经标记为初始点的向量索引
        ArrayList<Integer> initials = new ArrayList<Integer>();

        // 从两个开始
        for (; i < InstanceNumber; i++) {
            // 噪声点
            if (noises.contains(i))
                continue;
            // long startTime = System.currentTimeMillis();
            j = i + 1;
            for (; j < InstanceNumber; j++) {
                // 噪声点
                if (noises.contains(j))
                    continue;
                // 找出最大的距离并记录下来
                float newDis = calDis(data[i], data[j]);
                if (maxDis < newDis) {
                    a = i;
                    b = j;
                    maxDis = newDis;
                }
            }
            // long endTime = System.currentTimeMillis();
            // System.out.println(i +
            // "Vector Caculation Time:"+(endTime-startTime)+"ms");
        }

        // 将前两个初始点记录下来
        initials.add(a);
        initials.add(b);
        classData[0] = data[a];
        classData[1] = data[b];

        // 在结果中新建存放某样本索引的对象，并把初始点添加进去
        ArrayList<Integer> resultOne = new ArrayList<Integer>();
        ArrayList<Integer> resultTwo = new ArrayList<Integer>();
        resultOne.add(a);
        resultTwo.add(b);
        result.add(resultOne);
        result.add(resultTwo);

        // 找到剩余的几个初始点
        while (alreadyCls < ClassCount) {
            i = j = 0;
            float maxMin = 0;
            int newClass = -1;

            // 找最小值中的最大值
            for (; i < InstanceNumber; i++) {
                float min = 0;
                float newMin = 0;
                // 找和已有类的最小值
                if (initials.contains(i))
                    continue;
                // 噪声点去除
                if (noises.contains(i))
                    continue;
                for (j = 0; j < alreadyCls; j++) {
                    newMin = calDis(data[i], classData[j]);
                    if (min == 0 || newMin < min)
                        min = newMin;
                }
                // 新最小距离较大
                if (min > maxMin) {
                    maxMin = min;
                    newClass = i;
                }
            }
            // 添加到均值集合和结果集合中
            // System.out.println("NewClass"+newClass);
            initials.add(newClass);
            classData[alreadyCls++] = data[newClass];
            ArrayList<Integer> rslt = new ArrayList<Integer>();
            rslt.add(newClass);
            result.add(rslt);
        }
    }

    // 第一次分类
    public void firstClassify() {
        // 根据初始向量分类
        for (int i = 0; i < InstanceNumber; i++) {
            float min = 0f;
            int clsId = -1;
            for (int j = 0; j < classData.length; j++) {
                // 欧式距离
                float newMin = calDis(classData[j], data[i]);
                if (clsId == -1 || newMin < min) {
                    clsId = j;
                    min = newMin;
                }

            }
            // 本身不再添加
            if (!result.get(clsId).contains(i))
                result.get(clsId).add(i);
        }
    }

    // 迭代分类，直到各个类的数据不再变化
    public void Adjust() {
        // 记录是否发生变化
        boolean change = true;

        // 循环的次数
        int times = 1;
        while (change) {
            // 复位
            change = false;
            System.out.println("Adjust Iteration" + (times++) + "time(s)");

            // 重新计算每个类的均值
            for (int i = 0; i < ClassCount; i++) {
                // 原有的数据
                ArrayList<Integer> cls = result.get(i);

                // 新的均值
                float[] newMean = new float[FieldCount];


                // 计算均值
                for (Integer index : cls) {
                    for (int j = 0; j < FieldCount; j++) {
                        newMean[j] += data[index][j];
                    }
                }

                for (int j = 0; j < FieldCount; j++) {
                    newMean[j] /= cls.size();
                    System.out.println("2:"+newMean[j]);
                }
                if (!compareMean(newMean, classData[i])) {
                    classData[i] = newMean;
                    System.out.println(classData[i]);
                    change = true;
                }
            }
            // 清空之前的数据
            for (ArrayList<Integer> cls : result)
                cls.clear();

            // 重新分配
            for (int i = 0; i < InstanceNumber; i++) {
                float min = 0f;
                int clsId = -1;
                for (int j = 0; j < classData.length; j++) {
                    float newMin = calDis(classData[j], data[i]);
                    if (clsId == -1 || newMin < min) {
                        clsId = j;
                        min = newMin;
                    }
                }
                data[i][FieldCount] = clsId;
                result.get(clsId).add(i);
            }

            // 测试聚类效果(训练集)
            // for(int i = 0;i < ClassCount;i++){
            // int positives = 0;
            // int negatives = 0;
            // ArrayList<Integer> cls = result.get(i);
            // for(Integer instance:cls)
            // if (data[instance][FieldCount - 1] == 1f)
            // positives ++;
            // else
            // negatives ++;
            // System.out.println(" " + i + " Positive: " + positives +
            // " Negatives: " + negatives);
            // }
            // System.out.println();
        }

    }

    /**
     * 计算a样本和b样本的欧式距离作为不相似度
     *
     * @param a
     *            样本a
     * @param b
     *            样本b
     * @return 欧式距离长度
     */
    private float calDis(float[] aVector, float[] bVector) {
        double dis = 0;
        int i = 0;
            /* 最后一个数据在训练集中为结果，所以不考虑 */
        for (; i < aVector.length; i++)
            dis += Math.pow(bVector[i] - aVector[i], 2);
        dis = Math.pow(dis, 0.5);
        return (float) dis;
    }

    /**
     * 判断两个均值向量是否相等
     *
     * @param a
     *            向量a
     * @param b
     *            向量b
     * @return
     */
    private boolean compareMean(float[] a, float[] b) {
        if (a.length != b.length)
            return false;
        for (int i = 0; i < a.length; i++) {
            if (a[i] > 0 && b[i] > 0 && a[i] != b[i]) {
                return false;
            }
        }
        return true;
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("test kmeans 123");
        //记录一下启动的时间
        long startTime = System.currentTimeMillis();
        String in="/Users/Zd/Desktop/nuc_card/src/cn/smbms/kmeans/k_means.txt";
        String out="/Users/Zd/Desktop/nuc_card/src/cn/smbms/kmeans/clusterResult.txt";
        //读取数据
        readData(in);
        cluster();


        FileWriter fw = null;
        BufferedWriter bw = null;
        try{
            FileReader fr = new FileReader(in);
            BufferedReader br = new BufferedReader(fr);
            //存放数据的临时变量
            String lineData = null;
            String[] splitData = null;
            int line = 0;
            while( br.ready()){
                lineData = br.readLine();
                //System.out.println(lineData);
                splitData = lineData.split(" ");
                number[line]=splitData[0];
                line++;
            }
        }catch(Exception e){
            e.printStackTrace();
        }


        try {
            fw = new FileWriter(out);
            bw = new BufferedWriter(fw);
            // 写入文件
            for (int i = 0; i < InstanceNumber; i++) {


                String num=number[i];
                bw.write(num+" ");
                if(String.valueOf(data[i][FieldCount]).substring(0, 1).equals("0")){
                    bw.write(String.valueOf(data[i][FieldCount]).substring(0, 1)+" ");
                    bw.write("低消费水平");

                }else if(String.valueOf(data[i][FieldCount]).substring(0, 1).equals("1")){
                    bw.write(String.valueOf(data[i][FieldCount]).substring(0, 1)+" ");
                    bw.write("中消费水平");

                }
                else if(String.valueOf(data[i][FieldCount]).substring(0, 1).equals("2")){
                    bw.write(String.valueOf(data[i][FieldCount]).substring(0, 1)+" ");
                    bw.write("高消费水平");

                }

                bw.newLine();
            }

            // 统计每类的数目，打印到控制台
            for (int i = 0; i < ClassCount; i++) {

                System.out.println("第" + (i + 1) + "类数目: "
                        + result.get(i).size());
                //List<String> clList = new ArrayList<String>();
                //clList.add("第" + (i + 1) + "类数目: " + result.get(i).size());
                //request.setAttribute("clList", clList);
            }
            request.getRequestDispatcher("/jsp/user_dp/dp_kmeans.jsp").forward(request, response);
        } catch (IOException e) {
            e.printStackTrace();
        } catch (ServletException e) {
            e.printStackTrace();
        } finally {

            // 关闭资源
            if (bw != null)
                try {
                    bw.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            if (fw != null)
                try {
                    fw.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
        }

        long endTime = System.currentTimeMillis();
        System.out.println("Total Time:" + (endTime - startTime) / 1000 + "s");
        System.out.println("Memory Consuming:"
                + (float) (Runtime.getRuntime().totalMemory() - Runtime
                .getRuntime().freeMemory()) / 1000000 + "MB");



    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
