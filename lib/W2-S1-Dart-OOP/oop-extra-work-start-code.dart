enum Position {left, center, right}
enum Material {wood, metal, glass}
enum RoofShape {flat, gable, hip, gambrel, mansard, shed}
enum Country {Cambodia, Thailand, Vietnam, Singapore, Malaysia}
class Color{
  int red;
  int green;
  int blue;
  
  Color ({required this.red, required this.green, required this.blue});
  @override
  String toString() {
    return 'Color{red: $red, green: $green, blue: $blue}';
  }
}

class Door{
  Material material;
  Color color;
  Position position;

  Door({required this.material, required this.color, required this.position});

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

  Window({required this.material, required this.color, required this.position, required this.floor});

  @override
  String toString() {
    return 'Window{material: $material, color: $color, position: $position, floor: $floor}';
  }
}

class Roof{
  Material material;
  Color color;
  RoofShape shape;
  
  Roof({required this.material, required this.color, required this.shape});

  @override
  String toString() {
    return 'Roof{material: $material, color: $color, shape: $shape}';
  }
}

class Chimney{
  Material material;
  Color color;
  Position position;

  Chimney({ required this.material,required this.color,required this.position});

  @override
  String toString() {
    return 'Chimney{material: $material, color: $color, position: $position}';
  }
}
// Class Tree
class Tree {
  String type;
  double height;

  Tree({required this.type, required this.height});

  @override
  String toString() {
    return 'Tree{type: $type, height: $height}';
  }
}

class Address{
  Country country;
  String city;
  String street;

  Address({required this.country, required this.city, required this.street}) ;

  @override
  String toString(){
    return "Country{ country: $country, city: $city, street: $street}";
  }
}
// Class House
class House {
  Address address;
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
  House house = House(Address(country: Country.Cambodia, city: "Phnom penh", street: "238"));
  Door door = Door(material:Material.wood, color:Color(red:255, green:0, blue:0), position:Position.center);
  Window window = Window(material:Material.glass, color:Color(red:255, green:0, blue:0), position:Position.left, floor:1);
  Window window2 = Window(material:Material.glass, color:Color(red:255, green:0, blue:0), position:Position.right, floor:0);
  Roof roof = Roof(material:Material.metal, color:Color(red:255, green:0, blue:0), shape:RoofShape.flat);
  Chimney chimney = Chimney(material: Material.glass, color:Color(red:255, green:0, blue:0),position:Position.right);
  Tree tree = Tree(type:"Pine",height: 10.0);
  house.addDoor(door);
  house.addWindow(window);
  house.addWindow(window2);
  house.setRoof(roof);
  house.setChimney(chimney);
  house.addTree(tree);

  print(house);

  // print(house.windows.length);

}
