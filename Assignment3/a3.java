package weather;
import java.io.IOException;

import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.fs.Path;
import org.apache.hadoop.io.IntWritable;
import org.apache.hadoop.io.LongWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Job;
import org.apache.hadoop.mapreduce.Mapper;
import org.apache.hadoop.mapreduce.Reducer;
import org.apache.hadoop.mapreduce.lib.input.FileInputFormat;
import org.apache.hadoop.mapreduce.lib.output.FileOutputFormat;
import org.apache.hadoop.util.GenericOptionsParser;


public class weatherdata {

	public static void main(String [] args) throws Exception
	{
	Configuration c=new Configuration();
	String[] files=new GenericOptionsParser(c,args).getRemainingArgs();
	Path input=new Path(files[0]);
	Path output=new Path(files[1]);
	Job j=new Job(c,"wordcount");
	j.setJarByClass(weatherdata.class);
	j.setMapperClass(MapForWordCount.class);
	j.setReducerClass(ReduceForWordCount.class);
	j.setOutputKeyClass(Text.class);
	j.setOutputValueClass(IntWritable.class);
	FileInputFormat.addInputPath(j, input);
	FileOutputFormat.setOutputPath(j, output);
	System.exit(j.waitForCompletion(true)?0:1);
	}
	public static class MapForWordCount extends Mapper<LongWritable, Text, Text, IntWritable>{
		private static final int MISSING = 9999; 
		int t=0,sum=0;
	public void map(LongWritable key, Text value, Context con) throws IOException, InterruptedException
	{
		String line = value.toString(); 
		String year = line.substring(15, 19); 
		int airTemperature; 
		if (line.charAt(87)=='+') 
		{ 
		airTemperature= Integer.parseInt(line.substring(88, 92)); 
		} 
		else 
		{ 
		airTemperature= Integer.parseInt(line.substring(87, 92)); 
		} 
		String quality= line.substring(92, 93); 
		if (airTemperature != MISSING && quality.matches("[01459]")) 
		{ 
			con.write(new Text(year), new IntWritable(airTemperature)); 
		}
	}
	}
	public static class ReduceForWordCount extends Reducer<Text, IntWritable, Text, IntWritable>
	{
		int max=0,min=999999;
		Text yearmax=new Text(),yearmin=new Text();
		Text print=new Text();
	public void reduce(Text key, Iterable<IntWritable> values, Context con) throws IOException, InterruptedException
	{
		int sum=0;
		int t=0;
		for (IntWritable value : values ) 
		{ 
				sum+=value.get();
				t++;
		} 
		if((sum/t)>max)
		{
			max=sum/t;
			yearmax.set(key);
		}
		if((sum/t)<min)
		{
			min=sum/t;
			yearmin.set(key);
		}
		con.write(key, new IntWritable((sum/t))); 
	}
	protected void cleanup(Context con) throws IOException, InterruptedException
	{
		print.set("Coolest Year::");
		con.write(print,new IntWritable());
		con.write(yearmax,new IntWritable(max));
		print.set("Hottest Year::");
		con.write(print,new IntWritable());
		con.write(yearmin,new IntWritable(min));
	}
	}
	
	}