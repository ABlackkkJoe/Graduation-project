package cn.smbms.kmeans;
public class TestKMeans {
    public  static void testKMeans(){
        //记录一下启动的时间
        long startTime = System.currentTimeMillis();
        KMeans cluster = new KMeans();
        String in="/Users/Zd/Desktop/nuc_card/src/cn/smbms/kmeans/k_means.txt";
        String out="/Users/Zd/Desktop/nuc_card/src/cn/smbms/kmeans/clusterResult.txt";
        //读取数据

        cluster.readData(in);
        cluster.cluster();
        // 输出结果
        cluster.printResult(in,out);
        long endTime = System.currentTimeMillis();
        System.out.println("Total Time:" + (endTime - startTime) / 1000 + "s");
        System.out.println("Memory Consuming:"
                + (float) (Runtime.getRuntime().totalMemory() - Runtime
                .getRuntime().freeMemory()) / 1000000 + "MB");
    }
    public static void main(String[] args) {
        // TODO Auto-generated method stub
        testKMeans();

    }

}