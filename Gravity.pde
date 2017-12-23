void gravity()
{
  onPlat = false;
  Platform urOn = null;
  for (Platform p : platList)
  {
    if (my + msize/2 >= p.y - p.ht / 2
      && my + msize/2 <= p.y + p.ht / 2
      && mx <= p.x + p.wd / 2
      && mx >= p.x - p.wd / 2)
    {
      onPlat = true;
      urOn = p;
    }
  }
  if (myspeed >= 0 && onPlat)
  {
    myspeed = 0;
    my = urOn.y - urOn.ht/2 -msize/2;
  } else
  {
    myspeed += 1;
  }
  if(onPlat && urOn.fallPlat && myspeed >= 0)
  {
    urOn.fall();
  }
}