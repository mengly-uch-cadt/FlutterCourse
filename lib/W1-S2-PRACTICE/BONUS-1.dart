// Enum to represent the directions the robot can face.
enum Direction { north, east, south, west }

// Class to represent the robot with position and direction.
class Robot {
  int x, y;
  Direction direction;

  // Constructor to initialize the robot's position and direction.
  Robot(this.x, this.y, this.direction);

  // Method to turn the robot to the right (clockwise).
  void turnRight() {
    direction = Direction.values[(direction.index + 1) % 4];
  }

  // Method to turn the robot to the left (counterclockwise).
  void turnLeft() {
    direction = Direction.values[(direction.index - 1) % 4];
  }

  // Method to advance the robot in the current direction.
  void advance() {
    switch (direction) {
      case Direction.north:
        y++;
        break;
      case Direction.east:
        x++;
        break;
      case Direction.south:
        y--;
        break;
      case Direction.west:
        x--;
        break;
    }
  }

  // Method to execute a list of instructions.
  void executeInstructions(String instructions) {
    for (var instruction in instructions.split('')) {
      switch (instruction) {
        case 'R':
          turnRight();
          break;
        case 'L':
          turnLeft();
          break;
        case 'A':
          advance();
          break;
        default:
          print('Invalid instruction: $instruction');
      }
      print(getPositionAndDirection() + ' after $instruction');

    }
  }

  // Method to get the robot's current position and direction.
  String getPositionAndDirection() {
    return 'Position: {$x, $y}, Facing: ${direction.toString().split('.').last.toUpperCase()}';
  }
}

// Main function to run the program.
void main() {
  // Initialize the robot at position {7, 3} facing north.
  Robot robot = Robot(7, 3, Direction.north);
  String instructions = "RAALAL";
  robot.executeInstructions(instructions);
  // print(robot.getPositionAndDirection());
}
