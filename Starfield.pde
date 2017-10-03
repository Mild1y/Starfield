Particle[] aBunch;
void setup()
{
	size(500,500);
	aBunch = new Particle[1000];
	for (int i = 0; i < aBunch.length; i++)
	{
		aBunch[i] = new NormalParticle();
	}
	aBunch[1] = new JumboParticle();
	aBunch[0] = new OddballParticle();
	
}
void draw()
{
	background(0);
	for (int i = 0; i < aBunch.length; i++)
	{
		aBunch[i].move();
		aBunch[i].show();
	}
}
class NormalParticle implements Particle
{
	float npX, npY, npSpeed, npAngle;
	int npColor;
	NormalParticle()
	{
		npColor = (int)(Math.random()*255);
		npX = 250;
		npY = 250;
		npSpeed = (float)(Math.random()*5);	
		npAngle = (float)(Math.random()*20);
	}
	public void move()
	{
		npX = npX + (float)(Math.cos(npAngle)) * npSpeed;
		npY = npY + (float)(Math.sin(npAngle)) * npSpeed;
	}
	public void show()
	{
		fill(npColor, npColor,0);
		ellipse(npX,npY,5,5);
	}
}
interface Particle
{
	public void move();
	public void show();
}
class OddballParticle implements Particle
{
	int opX, opY;
	OddballParticle()
	{
		opX = 250;
		opY = 400;
	}
	public void move()
	{
		opX = opX + (int)(Math.random()*11)-5;
	}
	public void show()
	{
		fill(220);
		ellipse(opX,opY,70,30);
		ellipse(opX,opY-15,30,30);
		fill(135,206,235);
		ellipse(opX+7,opY-15,5,8);
		ellipse(opX,opY-15,5,8);
		ellipse(opX-7,opY-15,5,8);
	}
}
class JumboParticle extends NormalParticle
{
	public void show()
	{
		fill(135,206,235);
		ellipse(npX,npY,25,25);
	}
}

