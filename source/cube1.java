import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.MouseEvent;
import java.awt.event.MouseListener;
import java.awt.geom.*;

import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.Timer;
import java.io.*;
import java.util.*;
import java.lang.*;


public class cube1
    extends JFrame implements ActionListener {
	int mX=0,mY=0;
	int X=60,Y=100;
	int dX=1,dY=1;
	int myrast[][]=new int[256][256];

	public String hextobin(String hex)
	{
		   
		    int i = Integer.parseInt(hex,16);
		    
		    String by = Integer.toBinaryString(i);
		    int limit=by.length();
		//    System.out.print(by+":"+by.length()+":");
		    for(int j=0;j<16-limit;j++)
		    {
		    	by="0"+by;
		    }
	//	    System.out.println(i+ " "+by);
		  return by;
	} 	
	
	
  public static void main(String[] args) {
	  cube1 f = new cube1("");
 //   f.setTitle("Rasterizer demos");
    f.setSize(535, 555);
   // f.center();
    f.setVisible(true);
    

  

  }
  
  public cube1(String argc)
  {
	  setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

	  String parts[] = new String[2];
	  int xp,yp, temp, rowmod, ind;
	  String bin;
	  try
	  {
	   // BufferedReader bf = new BufferedReader(new InputStreamReader(System.in));
	    String filename = "meocube1.txt";//bf.readLine();
	 //  String filename= argc;
	        BufferedReader in = new BufferedReader(new FileReader(filename));
	        String str;
	        in.readLine();
	        while ((str = in.readLine()) != null) 
	        {
	        	
	          parts=str.split(":");
	          parts[1]=parts[1].substring(0, 4);
	          temp=Integer.parseInt(parts[0]);
	          yp=temp/16;
	          rowmod=temp%16;
	          bin=hextobin(parts[1]);
	      //    System.out.println(bin+ " "+bin.length());
	          
	          for(int i=0; i<bin.length();i++)
	          {
	        	  
	        	if(bin.charAt(i)=='1')  
	        	{
	        	ind=15-i;  
	          xp=16*rowmod+ind;
	          myrast[xp][yp]=1;
	       //   System.out.println(xp + " "+yp);
	        	}
	          }
	        	  
	        }
	        repaint();
	        in.close();
	    

	  }
	  catch(Exception e)
	  {
		  System.out.println("Fail "+ e);
	  }
	//  rasterize(0,0,5,10);
	  
	//    Timer timer = new Timer(50, this);

  }
  
  void drawPoint(Graphics2D g2,int x,int y)
  {
	//  g2.drawOval(x+10,y+30,1,1);
	  g2.drawLine(x, y, x, y);
  }
  
  public void paint(Graphics g) {
	
    Graphics2D g2 = (Graphics2D)g;
    g2.setPaint(Color.black);
    g2.fillRect(0, 0, 550, 580);

    drawRast(g2,myrast);


  }
  public int[][] rasterize(int x_0,int y_0,int x_1,int y_1)
  {
	int[][] rast = new int[256][256];  
	
    int		x=x_0,y=y_0,
    dx,		//deltas
    dy,
    dx2,	//scaled deltas
    dy2,
    ix=1,		//increase rate on the x axis
    iy=1,		//increase rate on the y axis
    err,	//the error term
    i;		//looping variable

    //System.out.println(X+","+Y+":");

// identify the first pixel
//ushort *ptr_vid = lpscreen + x1 + (y1 * (pitch >> 1));

// difference between starting and ending points
dx = x_1 - x_0;
dy = y_1 - y_0;

// calculate direction of the vector and store in ix and iy
if (dx >= 0)
ix = 1;

if (dx < 0)
{
ix = -1;
dx = Math.abs(dx);
}

if (dy >= 0)
iy = (1);

if (dy < 0)
{
iy = -(1);
dy = Math.abs(dy);
}

// scale deltas and store in dx2 and dy2
dx = dx * 2;
dy = dy * 2;

int steep=0;
if (dx < dy)	// dx is the major axis
{
int temp=dy;
dy=dx;
dx=temp;

temp=x;
x=y;
y=temp;

temp=ix;
ix=iy;
iy=temp;

steep=1;	
}
//	System.out.println("less than 1");
// initialize the error term
err = dy - (dx/2);
//System.out.println("init error: "+err+"dy: "+dy+ " dx "+ dx);
int maxerr=err;
for (i = 0; i <= dx/2; i++)
//while(x-x_0< dx/2)
{
	if(Math.abs(err)>Math.abs(maxerr)) maxerr=err;
	if(steep==1){
		System.out.println(y + " "+ x + " " +err);
		 rast[y][x]=1;
	}
	else
	{
		System.out.println(x + " " + y + " " + err);
		 rast[x][y]=1;
	}
    if (err >= 0)
    {
        err -= dx;
        y += iy;
    }
    err += dy;
    x += ix;

}


System.out.println(maxerr);
	return rast;
  }
  
  
  
  public void mouseMoved(MouseEvent me) {
	/*    mX = (int) me.getPoint().getX();
	    mY = (int) me.getPoint().getY();
	    System.out.println(mX+" "+mY);
	    repaint();*/
	  }
  
  public void drawRast(Graphics2D r, int[][] data)
  {
	   
	 
	    r.setPaint(Color.blue);
	    r.setStroke(new BasicStroke(2));
	    r.drawRect(10, 30, 512, 512);
	  for(int i=0;i<256;i++)
	  {
		  for(int j=0;j<256;j++)
		  {
			  if(data[i][j]==1)
			  drawPoint(r,2*i+10,2*j+30);
		  }
	  }
	  
  }

@Override
public void actionPerformed(ActionEvent arg0) {
	
    if(Y>240||Y<10) dY*=-1;
    Y+=dY;
	repaint();
	
}



  
}
