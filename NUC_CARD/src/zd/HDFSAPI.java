package zd;
import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.fs.FSDataOutputStream;
import org.apache.hadoop.fs.FileSystem;
import org.apache.hadoop.fs.Path;
import org.apache.hadoop.io.IOUtils;
import org.junit.Before;
import org.junit.Test;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;

public class HDFSAPI {

	private FileSystem fileSystem = null;

	@Before
	public void init() throws Exception {
		Configuration conf = new Configuration();
		System.setProperty("HADOOP_USER_NAME", "root");
		conf.set("fs.defaultFS", "hdfs://hdp1:9000");
		fileSystem = FileSystem.get(conf);
		//fileSystem = FileSystem.get(new URI("hdfs://hdp1:9000"), conf, "root");
	}

	@Test
	public void testUpload() throws Exception {
		//跟HDFS建立连接
		//打开本地文件系统的一个文件作为输入流
		InputStream in = new FileInputStream("/Users/Zd/Desktop/20180205大数据/aAttend.txt");

		//使用hdfs的fileSystem打开一个输出流
		FSDataOutputStream out = fileSystem.create(new Path("/local_hdfs"));
		//in -> out
		IOUtils.copyBytes(in, out, 1024, true);
		//关闭fileSystem连接
		fileSystem.close();
	}

	@Test
	public void testDel() throws IllegalArgumentException, IOException {
		boolean flag = fileSystem.delete(new Path("/local_hdfs"), true);
		System.out.println(flag);
		fileSystem.close();
	}


	@Test
	public void testMkdir() throws IllegalArgumentException, IOException {
		fileSystem.mkdirs(new Path("/a/b"));
		//关闭fileSystem连接
		fileSystem.close();
	}

	public static void main(String[] args) throws Exception {
		//跟HDFS建立上连接，要知道NameNode的地址即可
		//Configuration conf = new Configuration();
		//conf.set("fs.defaultFS", "hdfs://hdp1:9000");
		//FileSystem fileSystem = FileSystem.get(conf);
	}

}
