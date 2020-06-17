class Floor{
 PVector loc;
 float w,h;
 Floor(float x, float y){
     loc = new PVector(x,y);
     w = width;
     h = 50;
 }
 void display(){
   fill(100);
   rect(loc.x, loc.y, w,h);
   
 }
}
