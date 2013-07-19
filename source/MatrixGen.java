import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;


public class MatrixGen {

	String drlop="0000000000000010";
	String ldmop="0000000000000001";
	int dataaddr=5000; //next free address
	int opaddr=4200;
	/**
	 * @param args
	 */
	
	public String doubleToBin(double d)
	{
		String ret;
		int fixedpoint=(int)(d*256);
		boolean isneg=false;
	//	if(fixedpoint<0)
	//		isneg=true;
	//	fixedpoint=Math.abs(fixedpoint);
	//	ret="";
		short sho=(short)fixedpoint;
		ret=Integer.toHexString(sho);
		String revd="";
	//	System.out.println(ret);
	/*	for(int i=ret.length()-1;i>=0;i--)
		{
			revd+=ret.charAt(i);
		}
		if(ret.length()>4)
		{
			revd=revd.substring(0, );
		}*/
		
		if(ret.length()>4)
		ret=ret.substring(ret.length()-4, ret.length());
		
		return ret;
	}
	
	public MatrixGen(String inp, String outp)
	{
		
		String parts[], coor[];
		String temp;
		double xt = 0,yt=0,zt=0;
		double xs=0,ys=0,zs=0;
		double xr=0, yr=0, zr=0;
		double x0=0,y0=0,z0=0;
		double x1=0,y1=0,z1=0;
		double pi=Math.PI;
		double trans[][] = new double[4][4];
	//	doubleToBin(-1.0);

    		 

		 try
		  {
			 
		  	    File filedata = new File(outp);
		  	    File fileop = new File("opcode");
		  	  
	    	    //if file doesnt exists, then create it
	    	    if(!filedata.exists()){
	    		filedata.createNewFile();
	    	    }
	    	    if(!fileop.exists()){
		    		fileop.createNewFile();
		    	    }
	 
	    	    FileWriter dw = new FileWriter(filedata.getName());
	    	    BufferedWriter dataw = new BufferedWriter(dw);
	    	    FileWriter ow = new FileWriter(fileop.getName());
	    	    BufferedWriter opw = new BufferedWriter(ow);
	    	 //   bw.write(content);
	    	  //  bw.close();
	    	  dataw.write("<addr>");
	    	  dataw.newLine();
	    	    
		   // BufferedReader bf = new BufferedReader(new InputStreamReader(System.in));
		   // String filename = "cube_first";//bf.readLine();
		    String filename=inp;
		        BufferedReader in = new BufferedReader(new FileReader(filename));
		        String str;
		        in.readLine();
		        while ((str = in.readLine()) != null) 
		        {
		        //	System.out.println(str);
		        str=str.trim();
		        if(str.length()==0) continue;
		        if(str.charAt(0)=='#') continue;
		        if(str.substring(0, 3).compareTo("ldm")==0)
		        {
		        	// trans, rot, then scaling
		        	for(int i=0; i<9;i++)
		        	{
		        	str=in.readLine().trim();
		        	parts=str.split("=");
		        	str=parts[1];
		        	switch (i)
		        	{
		        	case 0:
		        	xt=Double.parseDouble(str);
		        	break;
		        	case 1:
			        yt=Double.parseDouble(str);
			        break;
		        	case 2:
				    zt=Double.parseDouble(str);
				    break;
		        	case 3:
			        xr=Double.parseDouble(str);
			        break;
			        case 4:
				    yr=Double.parseDouble(str);
				    break;
			        case 5:
					zr=Double.parseDouble(str);
					break;
		        	case 6:
				    xs=Double.parseDouble(str);
				    break;
				    case 7:
					ys=Double.parseDouble(str);
					break;
				    case 8:
					zs=Double.parseDouble(str);
					break;
		        	
		        	}
		        	}
		        	//trans
		        	trans[0][3]=xt;
		        	trans[1][3]=yt;
		        	trans[2][3]=zt;
		        	trans[3][3]=1;
		        	
		        	xr*=pi/180;
		        	yr*=pi/180;
		        	zr*=pi/180;
		        	
		        	// row 1
		        	trans[0][0]=xs*(Math.cos(yr)*Math.cos(zr));
		        	trans[0][1]=xs*(-Math.cos(xr)*Math.sin(zr)+Math.sin(xr)*Math.sin(yr)*Math.cos(zr));
		        	trans[0][2]=xs*(Math.sin(xr)*Math.sin(zr)+Math.cos(xr)*Math.sin(yr)*Math.cos(zr));
		        	// row 2
		        	trans[1][0]=ys*(Math.cos(yr)*Math.sin(zr));
		        	trans[1][1]=ys*(Math.cos(xr)*Math.cos(zr)+Math.sin(xr)*Math.sin(yr)*Math.sin(zr));
		        	trans[1][2]=ys*(-Math.sin(xr)*Math.cos(zr)+Math.cos(xr)*Math.sin(yr)*Math.sin(zr));
		        	// row 3
		        	trans[2][0]=zs*(-Math.sin(yr));
		        	trans[2][1]=zs*(Math.sin(xr)*Math.cos(yr));
		        	trans[2][2]=zs*(Math.cos(xr)*Math.cos(yr));
		        	
		        	//bottom
		        	trans[3][0]=0;
		        	trans[3][1]=0;
		        	trans[3][2]=0;
		        	
		        	writeLineOP(opw,ldmop);
		        	writeLineOP(opw,Integer.toBinaryString(dataaddr));
		        	
		        	for(int r=0;r<4;r++)
		        		for(int c=0;c<4;c++)
		        		{
		        			writeLineDat(dataw,doubleToBin(trans[r][c]));
		        		}

		        	
		        	
		        	continue;
		        	
		        }
		        else if(str.substring(0, 3).compareTo("drl")==0)
		        {
		        	str=str.trim();
		        	parts=str.split(" ");
		        	str=parts[1]; // first point
		        //	System.out.println(parts[1]);
		        	coor=str.split(",");
		        	
		        	x0=Double.parseDouble(coor[0]);
		        	y0=Double.parseDouble(coor[1]);
		        	z0=Double.parseDouble(coor[2]);
		        	
		        	str=parts[3];
		        	coor=str.split(",");
		        	//System.out.println(parts[3]);
		        	x1=Double.parseDouble(coor[0]);
		        	y1=Double.parseDouble(coor[1]);
		        	z1=Double.parseDouble(coor[2]);
		        	
		        			        	
		        	writeLineOP(opw,drlop);
		        	writeLineOP(opw,Integer.toBinaryString(dataaddr));
		        	writeLineDat(dataw,doubleToBin(x0));
		        	writeLineDat(dataw,doubleToBin(y0));
		        	writeLineDat(dataw,doubleToBin(z0));
		        	writeLineDat(dataw,doubleToBin(x1));
		        	writeLineDat(dataw,doubleToBin(y1));
		        	writeLineDat(dataw,doubleToBin(z1));

		        //	str="A";
		        	
		        	continue;
		         }
		        }
		        /*	
		          parts=str.split(":");
		          parts[1]=parts[1].substring(0, 4);
		          temp=Integer.parseInt(parts[0]);
		          yp=temp/16;
		          rowmod=temp%16;
		          bin=hextobin(parts[1]);
		   //       System.out.println(bin+ " "+bin.length());
		          for(int i=0; i<bin.length();i++)
		          {
		        	  
		        	if(bin.charAt(i)=='1')  
		        	{
		        	ind=i;  
		          xp=16*rowmod+ind;
		          myrast[xp][yp]=1;
		       //   System.out.println(xp + " "+yp);
		        	}
		          }
		        	  
		        }
		        repaint();
		        in.close();
		    
*/
		        opw.flush();
		        opw.close();
		        dataw.flush();
		        dataw.close();
		  }
		  catch(Exception e)
		  {
			  System.out.println("Fail "+ e);
		  }
		
	
		
	}
	
	void writeLineOP(BufferedWriter bw, String s) throws IOException
	{
		//String towr=Integer.toBinaryString(opaddr)+":"+s+";";
		String towr=s;
		while(towr.length()<16)
		{
		towr="0"+towr;	
		}
	//	opaddr++;
    	bw.write(towr);
    	bw.newLine();
	}
	
	void writeLineDat(BufferedWriter bw, String s) throws IOException
	{
		String towr=Integer.toString(dataaddr)+":"+s+";";
		dataaddr++;
    	bw.write(towr);
    	bw.newLine();
	}
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
	//	for(int i=0;i<args.length;i++)
	//	System.out.println(args[i]);
		if(args.length<2)
			{System.out.println("Can has <input file> <output>");
			System.exit(1);
			}
		//System.
		MatrixGen mg = new MatrixGen(args[0],args[1]);
		
	}

}
