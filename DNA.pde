class DNA{
  boolean[] genes;  //Each gene has a true or false, true means jump and false means don't jump
  DNA(){
    genes = new boolean[lifeTime];
    for(int i = 0; i < lifeTime; ++i){
      float r= random(1);
      if(r > random(0.8,0.9)){
        genes[i] = true;
      }
      else{
        genes[i] = false;
      }
    }
  }
  DNA crossover(DNA parentB){
    int mid = int(random(genes.length) );
    DNA child = new DNA();
    for(int i =0 ; i < genes.length; ++i){
      if(i > mid){
        child.genes[i] = genes[i]; 
      }
      else{
        child.genes[i] = parentB.genes[i];
      }
    }
    return child;
  }
  void mutate(float mr){
    for(int i = 0; i< genes.length; ++i){
       float a = random(1);
       if(a < mr){
         float r = random(1);
         if(r > random(0.7,0.9)){
             genes[i] = true;
         }
         else{
           genes[i] = false;
         }
       }
    }
  }
}
