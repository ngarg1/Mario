
import processing.sound.*;
SoundFile file;
SoundFile sad;
SoundFile victory;

PImage mario;
PImage marior;
PImage mariol;
PImage bg;
PImage normPlat;
PImage fallPlat;
int mx;
int my;
int finish;
int mxspeed;
int myspeed;
int msize;
int jumpHeight;
int fallSpeed;
boolean sadM;
boolean winM;
boolean mright = false;
boolean mleft = false;
boolean onPlat = false;
boolean mjump = false;
ArrayList<Platform> platList;
int scrollLim;



void setup()
{
  size(800, 800);
  rectMode(CENTER);
  imageMode(CENTER);
  textMode(CENTER);
  textSize(100);
  platList = new ArrayList<Platform>();
  if (winM)
  {
    winM = false;
    victory.stop();
  }
  if (sadM)
  {
    sadM = false;
    sad.stop();
  }
  marior = loadImage("Mario_8Bit.png");
  mariol = loadImage("Mario_8Bitl.png");
  bg = loadImage("clouds.png");
  normPlat = loadImage("platform.png");
  fallPlat = loadImage("platform2.png");
  file = new SoundFile(this, "mariotheme.mp3");
  sad = new SoundFile(this, "sad.mp3");
  victory = new SoundFile(this, "Victory2.mp3");
  mx = 400;
  my = 600;
  finish = -3100;
  msize = 40;
  myspeed = 0;
  mxspeed = 5;
  jumpHeight = 15;
  fallSpeed = 2;
  scrollLim = 400;
  int platSize = 100;
  marior.resize(msize, msize);
  mariol.resize(msize, msize);
  mario = marior;
  bg.resize(800, 800);
  new Platform(width/2, 700, 20, platSize, normPlat, false);
  for (int i = 0; i < 100; i++)
  {
    int y2 = height - i * 40;
    for (int j = 0; j < int(random(1, 5 - i/20 + 1)); j++)
    {
      int x2 = int(random(0, 100))*8;
      if (int(random(0, 5)) == 2)
      {
        new Platform(x2, y2, 20, platSize, fallPlat, true);
      } else
      {
        new Platform(x2, y2, 20, platSize, normPlat, false);
      }
    }
  }


  file.play();
}

void draw()
{
  background(#00B9FF);
  image(mario, mx, my);
  wrap();
  for (Platform p : platList)
  {
    p.app();
  }

  if (my <= scrollLim)
  {
    scrollDown();
  }
  moveMario();
  gravity();
  fill(#13FA00);
  rect(width/2, finish, width, 20);
  if (my <=  finish)
  {
    if (!winM)
    {
      winM = true;
      file.stop();
      victory.play();
    }
    my = finish;
    myspeed = 0;
    fill(#E9FF00);
    textAlign(CENTER);
    text("You win!", 400, 400);
  }
  marioDead();
}

void marioDead()
{
  if (my  > height)
  {
    my = height + 100;
    background(0, 0, 0);
    fill(255, 0, 0);
    textAlign(CENTER);
    text("You lost!", 400, 400);
    if (!sadM)
    {
      file.stop();
      sad.play();
      sadM = true;
    }
  }
}

void moveMario()
{
  if (mright)
  {
    mx += mxspeed;
    mario = marior;
  }
  if (mleft)
  {
    mx -= mxspeed;
    mario = mariol;
  }
  if (mjump && onPlat)
  {
    myspeed = jumpHeight * -1;
    mjump = false;
  }
  my += myspeed;
}