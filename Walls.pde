class Wall{
  PVector loc;
  float gap_h;  //The height of the gap
  float gap_loc;  //The starting point of the gap
  float w;  //The height of the wall for easy reference
  Wall(float gh,float gl){
    loc = new PVector(width-300, c.loc.y+c.h   );
    gap_h = gh;
    gap_loc = gl;
    w = 50;
  }
  void display(){
    fill(100);
    rect(loc.x ,loc.y, w, gap_loc -loc.y);
    rect(loc.x, gap_loc + gap_h, w,f.loc.y -  gap_loc + gap_h );
  }
  void update(){
    loc.x -= 15;
  }
  
}
