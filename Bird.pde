class Bird{
  DNA dna;
  int geneC;
  PVector loc;
  PVector v;
  PVector acc;
  float fitness;
  int score;
  float r;
  boolean gameOver;
  Bird(float x, float y ,DNA d){
    loc = new PVector(x,y);
    v  = new PVector();
    acc = new PVector();
    r = 10;
    score =0;
    dna = d;
    gameOver = false;
    geneC =0;
  }
  void fitness(){
      fitness = pow(2,score);
      if(abs(loc.y - gaps_y[wc]) > gaps_h[wc]){
        float x = gaps_h[wc]/abs(loc.y - gaps_y[wc]); 
        fitness = x;
      }
  }
  void check_hit(){  //Check if it hit the wall
    //PVector loc = PVector.add(this.loc, v);
    if(loc.x+r > w.loc.x && loc.x+r < w.loc.x+w.w){
      if(loc.y - r > w.loc.y && loc.y -r < w.gap_loc){
        gameOver = true;
        left--;
      }  
      if(loc.y + r > w.gap_loc + w.gap_h){
        gameOver = true;
        left--;  
      }
      
    }
  }
  void applyForce(PVector f){
    acc.add(f);
  }
  void checkOnFloor(){
    PVector loc = PVector.add(this.loc, v);
    if(loc.y +r > f.loc.y || loc.y -r < c.loc.y + c.h){
       v.y =0;
    }
   
  }
  void update(){
    v.add(this.acc);
    v.limit(10);
    checkOnFloor();
     if(dna.genes[geneC] == true){
       v.y = -vertiSpeed;
     }
    loc.add(this.v);
    check_hit();
    acc.mult(0);
    geneC++;
  }
  void display(){
    fill(255,0,0, map(geneC, lifeTime, 0, 0,255) );
    ellipse(loc.x, loc.y, r*2, r*2);
  }
}
