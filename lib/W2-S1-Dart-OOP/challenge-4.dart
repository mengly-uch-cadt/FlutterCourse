class Distance{
  // private property , get entered many units, set only cms cuz every unit can be converted to cms before calculate
  final double _cms;

  // named constructor
  factory Distance.kms(double kilometers){
    return Distance._(kilometers * 100000); // convert meters to centimeters private property
  }

  factory Distance.meters(double meters){
    return Distance._(meters * 100);
  }

  factory Distance.cms(double centimeters){
    return Distance._(centimeters);
  }

  // private constructor
  const Distance._(this._cms); // get the value of cms and asign it into private property

  // getter 
  double get kms => _cms / 100000;
  double get meters => _cms / 100;
  double get cms => _cms;

  // Overloading // Calculate the sum of two or more distances 
  Distance operator +(Distance other){
    return Distance._(this._cms + other._cms);
  }

}

void main(){

  Distance distance1 = Distance.kms(2);
  Distance distance2 = Distance.meters(300);

  print(distance1.kms);
  print(distance2.meters);

// call the operator + to calculate the sum of two distances (overloading)
  Distance distance3 = distance1 + distance2 ;
  print(distance3.cms);
  print(distance3.meters);
}