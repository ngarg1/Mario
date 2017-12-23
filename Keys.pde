void keyPressed()
{
  if(key == CODED)
  {
    if(keyCode == LEFT)
    {
      mleft = true;
    }
    if(keyCode == RIGHT)
    {
      mright = true;
    }
    if(keyCode == UP)
    {
      mjump = true;
    }
  }
  
}
void keyReleased()
{
  if(key == 'r')
  {
    file.stop();
    setup();
  }
  if(key == CODED)
  {
    if(keyCode == LEFT)
    {
      mleft = false;
    }
    if(keyCode == RIGHT)
    {
      mright = false;
    }
    if(keyCode == UP)
    {
      mjump = false;
    }
  }
  
}