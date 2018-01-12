package cs.bigdata.Tutorial2;


import java.io.*;

import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.fs.*;



public class CompterLigneFile {

	public static void main(String[] args) throws IOException {
		
		//Open the file
		Configuration conf = new Configuration();
		FileSystem fs = FileSystem.get(conf);
		Path hdfsfile=new Path(args[0]);
		
		int count=0;		
		try{
			
			BufferedReader br=new BufferedReader(new InputStreamReader(fs.open(hdfsfile)));
	       
			// read line by line
			String line = br.readLine();
			
			while (line !=null){
				// Process of the current line
				//System.out.println(line);
				// go to the next line
				count+=1;
				line = br.readLine();
			}
		}
		finally{
			//close the file
			
			fs.close();
		}
 
		System.out.println("The number of lines in the file arbres.csv is :");
		System.out.println(count);
		
	}

}
