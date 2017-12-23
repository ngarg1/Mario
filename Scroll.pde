void scrollDown()
{
  finish += 5;
  my += 5;
  for(Platform p: platList)
  {
    p.scroll(5);
  }
}

void wrap()
{
  mx = mx % width;
  if(mx < 0)
  {
    mx = width + mx;
  }
}