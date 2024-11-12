# California Wildfire Simulation

This project simulates the spread of wildfires across multiple forests in a virtual California environment. Each forest contains trees that can be in various states: healthy, burning, or dead. Factors such as temperature and humidity influence the spread of the fire.

## Project Overview

This Processing simulation creates multiple forests with randomly positioned trees. Each tree has a chance to catch fire based on environmental conditions, and the simulation models the fire’s spread between neighboring trees. 

### Key Features

- **Environmental Variables**: Humidity and temperature affect fire spread dynamics.
- **Tree States**: Trees can be healthy, burning, or dead, each represented by different colors.
- **Randomized Setup**: Each run generates a random number of forests and trees with initial states.
- **Visual Display**: The simulation includes a title, and each forest and tree is visually represented on the canvas.

## Code Structure

### Global Variables

- `numForests`: Number of forests in the simulation (randomly between 6 and 9).
- `humidity` and `temperature`: Environmental conditions affecting fire spread.
- `forests[]`: Array to store `Forest` objects.

### Classes

#### `Forest`

- **Attributes**: 
  - `x`, `y`: Position of the forest on the canvas.
  - `l`, `w`: Dimensions of the forest.
  - `numTrees`: Number of trees within the forest (randomly between 20 and 35).
  - `trees[]`: Array storing `Tree` objects.

- **Methods**:
  - `draw()`: Draws each tree in the forest.
  - `update()`: Updates the state of each tree, checking for fire spread to neighboring trees.
  - `distance(Tree t1, Tree t2)`: Calculates the distance between two trees.

#### `Tree`

- **Attributes**:
  - `x`, `y`: Position of the tree.
  - `r`: Radius of the tree.
  - `healthy`, `burning`, `dead`: Status flags indicating the tree’s state.
  - `burning_time`: Tracks how long the tree has been burning.
  - `death_time`: Duration a tree can burn before becoming dead.

- **Methods**:
  - `update()`: Updates the tree’s burning status and time, setting the tree to dead if it burns for too long.
  - `catchFire()`, `catchFireWhenHumidORHot()`, `catchFireWhenHumidANDHot()`: Methods for setting a tree on fire based on environmental conditions.
  - `draw()`: Draws the tree in different colors based on its state (green for healthy, red for burning, black for dead).

### Main Simulation Functions

- **setup()**: Initializes the canvas, sets the environmental conditions, creates the forests, and displays initial information (title, humidity, temperature).
- **update()**: Calls the update method on each forest to progress the simulation.
- **draw()**: Draws all forests and updates the simulation frame by frame.

## Code Example

The following snippet shows how trees catch fire based on the distance to neighboring trees and environmental conditions:

```java
void update() {
  for (int i = 0; i < numTrees; i++) {
    trees[i].update();
    if (trees[i].burning) {
      for (int j = 0; j < numTrees; j++) {
        if (distance(trees[i], trees[j]) < 30) {
          if (humidity < 50 && temperature < 70) {
            trees[j].catchFire();
          } else if (humidity > 50 || temperature > 70) {
            trees[j].catchFireWhenHumidORHot();
          } else if (humidity > 50 && temperature > 70) {
            trees[j].catchFireWhenHumidANDHot();
          }
        }
      }
    }
  }
}
