//PROJECT 1 - CALIFORNIA WILDFIRE SIMULATION
//September 2024


//determines the number of Forests in the simulation
int numForests = (int)random(6, 9);

int humidity = (int)random(0, 100);
int temperature = (int)random(40, 100);

//a list to store all the Forests in the simulation
Forest[] forests = new Forest[numForests];


void setup() {
  size(1000, 1000);
  frameRate(1);

  background(237, 222, 183);

  textSize(50);
  fill(47, 111, 163);
  text("Albert's Wildfire Simulation", 210, 60);

  textSize(30);
  fill(0);
  text("Humidity:" + " " + humidity + " %", 300, 130);
  text("Temperature:" + " " + temperature + " °F", 500, 130);


  for (int i=0; i<numForests; i++) {
    forests[i] = new Forest(random(0, 1000-5*35), random(185, 1000-5*35), 175, 175);
  }
}

void update() {
  for (int i=0; i<numForests; i++) {
    forests[i].update();
  }
}


void draw() {
  for (int i=0; i<numForests; i++) {
    forests[i].draw();
  }

  update();
}
