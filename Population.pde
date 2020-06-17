class Population{
  Bird[] population;
  ArrayList<Bird>  matingPool;
  Population(){
    matingPool = new ArrayList<Bird>();
    population = new Bird[pSize];
    for(int i = 0; i < pSize; ++i){
      population[i] = new Bird(width/4, height/2,new DNA()  );
    }
  }
  void calcFit(){
    for(Bird b: population){
      b.fitness(  );
    }
  }
  void decide_pool(){
    matingPool = new ArrayList<Bird>(); 
    int flag = 0;
    for(int i =0 ; i < population.length; ++i){
       if(population[i].fitness %2 == 0){
         flag = 1;
         break;
       }
    }
    if(flag == 1){
      for(int i =0 ;i < population.length; ++i){
        int n;
        n = int(population[i].fitness*100);   
        
        for(int j =0 ; j <= n ;++j){
          matingPool.add( population[i]  );
        }
      }
    }
    else{
      for(int i =0 ;i < population.length; ++i){
        int n;
        n = int(pow(10000,population[i].fitness));   
        println("Fitness: " + population[i].fitness + " n is: " + n );
        
        for(int j =0 ; j <= n ;++j){
          matingPool.add( population[i]  );
        }
      }  
    }
  }
  Bird Selection(){
    int p =0;
    p = int(random( matingPool.size() ) );
    return matingPool.get(p);
  }
  
  void reproduction(){
   // println("Fitness 1: " + parent1.fitness + " Fitness 2: "+parent2.fitness);
    Bird parent1,parent2;
    for(int i =0; i < population.length; ++i){
        parent1 = Selection();
        parent2 = Selection();
      population[i] = new Bird(width/4, height/2, parent1.dna.crossover(parent2.dna) );
      population[i].dna.mutate(mutationRate);
    }
  }  
}
