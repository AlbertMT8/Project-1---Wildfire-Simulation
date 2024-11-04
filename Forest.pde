//Class to create the different Forests
//I am using circles to simulate the forests for now

//FIX THE UPDATE - THE FOREST IS NEVER TELLING THE TREES TO UPDATE, AND THE SIMULATION IS NEVER TELLING THE FOREST TO UPDATE

//NEED TO MAKE THE IMAGINARY RECTANGLE BORDER FOR EACH FOREST TO STAY IN


class Forest {
  float x, y;
  float l, w;
  
  
  int numTrees = (int)random(20,35);

  Tree[] trees = new Tree[numTrees];
  
  Forest(float x, float y, float l, float w) {
    this.x = x;
    this.y = y;
    this.l = l;
    this.w = w;
    
    for (int i=0; i<numTrees; i++) {
      trees[i] = new Tree(random(x,x+w),random(y,y+l),20);
    }
    
    
  }
      
    // draw method where i loop through the array of trees and call the draw method on each tree
  void draw() {
  for (int i=0; i<numTrees; i++) {
    trees[i].draw();
  }
 
  
  }
  
  double distance(Tree t1, Tree t2) {
    return Math.sqrt(Math.pow(t1.x-t2.x,2)+Math.pow(t1.y-t2.y,2));
  }
  
  void update() {
  for (int i=0; i<numTrees; i++) {
    trees[i].update();
    if (trees[i].burning) {
      for (int j=0; j<numTrees; j++) {
        if (distance(trees[i],trees[j])<30) {
          if (humidity<50 && temperature<70) {
            trees[j].catchFire();
          }
          
          else if (humidity>50 || temperature>70) {
            trees[j].catchFireWhenHumidORHot();
          }
          
          else if (humidity>50 && temperature>70) {
            trees[j].catchFireWhenHumidANDHot();
          }
          
          
        }
      }
    }
  }
  
  
}
}
