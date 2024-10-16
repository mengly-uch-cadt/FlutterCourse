enum Position {left, center, right}
enum Material {wood, metal, glass}
enum RoofShape {flat, gable, hip, gambrel, mansard, shed}

class Color{
  int red;
  int green;
  int blue;
  
  Color (this.red, this.green, this.blue);
  @override
  String toString() {
    return 'Color{red: $red, green: $green, blue: $blue}';
  }
}

class Door{
  Material material;
  Color color;
  Position position;

  Door(this.material, this.color, this.position);

  @override
  String toString() {
    return 'Door{material: $material, color: $color, position: $position}';
  }
}

class Window{
  Material material;
  Color color;
  Position position;
  int floor;

  Window(this.material, this.color, this.position, this.floor);

  @override
  String toString() {
    return 'Window{material: $material, color: $color, position: $position, floor: $floor}';
  }
}

class Roof{
  Material material;
  Color color;
  RoofShape shape;
  
  Roof(this.material, this.color, this.shape);

  @override
  String toString() {
    return 'Roof{material: $material, color: $color, shape: $shape}';
  }
}

class Chimney{
  Material material;
  Color color;
  Position position;

  Chimney(this.material, this.color, this.position);

  @override
  String toString() {
    return 'Chimney{material: $material, color: $color, position: $position}';
  }
}
// Class Tree
class Tree {
  String type;
  double height;

  Tree(this.type, this.height);

  @override
  String toString() {
    return 'Tree{type: $type, height: $height}';
  }
}

// Class House
class House {
  String address;
  List<Tree> trees = [];  // by default empty
  List<Door> doors = [];
  List<Window> windows = [];
  Roof? roof;
  Chimney? chimney;

  House(this.address);
  void addDoor(Door newDoor){
    this.doors.add(newDoor);
  }
  void addWindow(Window newWindow){
    this.windows.add(newWindow);
  }
  void setRoof(Roof newRoof){ // use set cuz home can have only one roof
    this.roof = newRoof;
  }
  void setChimney(Chimney newChimney){ // use set cuz home can have only one chimney
    this.chimney = newChimney;
  }
  void addTree(Tree newTree){
    this.trees.add(newTree);
  }

  @override
  String toString() {
    return 'House{address: $address, trees: $trees, doors: $doors, windows: $windows, roof: $roof, chimney: $chimney}';
  }
}


void main(){
  House house = House("1234 Main St");
  Door door = Door(Material.wood, Color(255, 0, 0), Position.center);
  Window window = Window(Material.glass, Color(0, 255, 0), Position.left, 1);
  Roof roof = Roof(Material.metal, Color(0, 0, 255), RoofShape.flat);
  Chimney chimney = Chimney(Material.glass, Color(0, 255, 0), Position.right);
  Tree tree = Tree("Pine", 10.0);
  house.addDoor(door);
  house.addWindow(window);
  house.setRoof(roof);
  house.setChimney(chimney);
  house.addTree(tree);

  print(house);

}
