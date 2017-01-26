public int color1 = 0;
public int color2 = 255;

public void setup()
{
	size (600,600);
	draw();
}
public void draw()
{
	background(128);
	int startX = mouseX;
	int startY = mouseY;
	sierpinski(startX,startY,256);
}
public void sierpinski(int x, int y, int len) 
{
	if (len < 1)
		return;
	fill(color1);
	float increment;
	beginShape();
	for (int i = 0; i < 3; i++)
	{
		increment = (float)(2*i*Math.PI/3);
		vertex((float)(x+len*Math.cos(Math.PI/6+increment)),(float)(y+len*Math.sin(Math.PI/6+increment)));
	}
	endShape(CLOSE);
	fill(color2);
	beginShape();
	for (int i = 0; i < 3; i++)
	{
		increment = (float)(2*i*Math.PI/3);
		vertex((float)(x-len*Math.cos(Math.PI/6+increment)/2),(float)(y-len*Math.sin(Math.PI/6+increment)/2));
	}
	endShape(CLOSE);
	for (int i = 0; i < 3; i++)
	{
		increment = (float)(2*i*Math.PI/3);
		sierpinski((int)(x+len*Math.cos(Math.PI/6+increment)/2),(int)(y+len*Math.sin(Math.PI/6+increment)/2),len/2);
	}
}

public void mousePressed()
{
	color1 = (int)(Math.random()*255);
	color2 = (int)(Math.random()*255);
}