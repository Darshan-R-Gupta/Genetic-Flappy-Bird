Floor f;
Population population;
int lifeTime = 1200,gen=0;
int lifeC = 0;
float[] gaps_y;  //The gaps' y position  
float[] gaps_h;  //The gaps' height 
Floor c;  //Ceiling
float vertiSpeed = 2.1;
int wc= 0;  //The current wall counter
float avgFitness =0 ;
int pSize = 50;  //The population Size
float mutationRate = 0.02;
int left= pSize;
Wall w;
void setup(){
   fullScreen();
   gaps_h = new float[100];
   gaps_y = new float[100];
   f = new Floor( 0, height-50 );
  c = new Floor(0,0);
  for(int i= 0;i < 20; ++i){
    gaps_h[i] = random(130,170);
    if(i !=0 ){
      while(abs(gaps_y[i-1] - gaps_y[i]) > 120){
        gaps_y[i] = random(c.loc.y, f.loc.y-gaps_h[i]-10  );
      }
    }
    else{
        gaps_y[i] = random(c.loc.y, f.loc.y-gaps_h[i]-10  );
    }
  }
  w = new Wall(gaps_h[0], gaps_y[0] );
  population = new Population();  
  noStroke();
  textSize(25);
}
void display_world(){

  w.display();
  f.display();
  c.display();
  for(Bird b: population.population){
    if(!b.gameOver){
      b.display();
    }
  }
}
void destroy_wall(){  //and create a new one

   for(Bird b: population.population){
     if(w.loc.x +w.w< b.loc.x-b.r){
       if(!b.gameOver){
         b.score++;
       }
     }
   }
   Bird b= population.population[0];  //Since all the birds lie on the same x
   if(w.loc.x +w.w< b.loc.x-b.r){   
     wc++;
     println(wc);
     w = new Wall(gaps_h[wc], gaps_y[wc] );
    
   }
  
}
void update_world(){
  w.update();
  for(int i= population.population.length-1; i >= 0 ;--i){
     Bird b = population.population[i];
    if(!b.gameOver){
      b.applyForce(new PVector(0,0.35) );  
      b.update();
    }
  }
  destroy_wall();
}

void draw(){
  
  background(255);
  if(lifeC < lifeTime && left > 0){
    update_world();
    display_world();
    lifeC++;
    fill(255,0,0);
    text("LifeTime left: "+ (lifeTime - lifeC), 30, 200);
  }
  else
  {
    population.calcFit();
    for(int i = 0; i < population.population.length; ++i){
      avgFitness += population.population[i].fitness;
    }
    avgFitness /= population.population.length;
   // if(keyPressed){
      lifeC  =0;
      left =pSize;
      
      population.decide_pool();
      population.reproduction();
      wc =0;
      w = new Wall(gaps_h[wc], gaps_y[wc] );
     gen++;
    //} 
  }
  fill(255,0,0);
  text("Wall no: "+wc, 30,160);
  text("Population left: "+ left, 30,120);
  text("Generations: " + (gen+1), 30, 80);
  text("Average Score: " + nf(avgFitness,0,2), 30,240);
}
/*void keyPressed(){ 
  if(b.v.y >0 ){
    b.v.y = -10;
  }
}*/
