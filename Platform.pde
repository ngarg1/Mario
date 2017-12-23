class Platform
{
  PImage platform;
  boolean fallPlat;
  int x;
  int y;
  int yspeed;
  int ht;
  int wd;
  
  public Platform(int _x, int _y, int _ht, int _wd, PImage plat, boolean f)
  {
    x = _x;
    y = _y; 
    ht = _ht;
    wd = _wd;
    yspeed = 0;
    platform = plat;
    fallPlat = f;
    image(platform, x, y, wd, ht);
    platList.add(this);
  }
  
  void scroll(int s)
  {
    y += s;
  }
  void app()
  {
    y += yspeed;
    image(platform,x,y,wd,ht);
  }
  void fall()
  {
    yspeed += fallSpeed;
    //myspeed += fallSpeed;
  }
}