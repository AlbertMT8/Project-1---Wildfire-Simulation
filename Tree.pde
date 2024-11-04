class Tree {
  float x, y;    // Position
  float r;       // Size (radius)
  boolean healthy, burning, dead;  // healthy, burning, or dead
  int burning_time;  // Time to burn before dying
  int death_time = 13;  // Arbitrary burn time


  
  Tree(float tempX, float tempY, float tempR) {
    x = tempX;
    y = tempY;
    r = tempR;
    burning_time = 0;
    
    //make it so a forest has 10% chance of being burning intially 
    //eventually see if I can make it so that only one forest initially is on fire
    burning = random(0, 10) <=1;
    
    
    //making it so no tree is initially dead
    dead = false;
    
  }
  
  //updates the status of this tree
    void update() { 
        //don't do anything if this tree is dead
        if (dead) {  
            return;
        }
       
        if (burning) {
            burning_time++;
            
            if (burning_time > 7 && burning_time < 10) {
                if (random(2) < 1) {
                    burning = false;
                    //burning_time = 0;
                }
            }
            
            if (burning_time > 10) {
                if (random(4) < 3) {
                    burning = false;
                    //burning_time = 0;
                }
            }
        }   
        else {
          if (burning_time > 0) {
            burning_time--;
          }
          
        
        } 
       
        
        if (burning_time > death_time) {
                dead = true;
            
        }
        
  }

    void catchFire() {
      if (!dead) {
        if (random(2) <1) {
          burning = true;

        }
      }
    }
    
    void catchFireWhenHumidORHot() {
      if (!dead) {
        if (random(3) > 1) {
           burning = true;
      }
      }
    
    }
    
    void catchFireWhenHumidANDHot() {
      if (!dead) {
        if (random(5) > 1) {
           burning = true;
      }
      }
    
    }
    
    
    void draw() {
          //set color based on the tree's status
          
        ellipse(x,y,r,r);
        if (dead) {
            fill(0);
        } 
        
        //GOAL: MAKE THIS ACTUALLY THE FLAME ANIMATION FROM THECODINGTRAIN
        else if (burning) {
            fill(255, 0, 0);
        }
        else {
            fill(0,255,0);
        }
}
}
