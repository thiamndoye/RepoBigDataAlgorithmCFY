package cs.bigdata.Tutorial2;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.fs.FileSystem;
import org.apache.hadoop.fs.Path;

public class Tree{

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
				String[] el=line.split(","); 
				count+=1;
				System.out.println("The age of the tree is "+el[5]+" and the height "+ el[6]);
				//mon_arbre=new TreeParis(el[5],el[6]);
				line = br.readLine();
				
			}
		}
		finally{
			//close the file
			
			fs.close();
		}
		
		
		
	}

}