class MyDuration {
  final int _milliseconds; // set as private and final 


  // prevent data < 0 then add it into private attribute
  MyDuration._(this._milliseconds){ // set data
    if(_milliseconds<0){ // prevent data < 0
      throw Exception("Duration should not be negative");
    }
  }

  // convert data to standard unit
  factory MyDuration.fromHours(int hours){
    return MyDuration._(hours*60*60*1000);
  }
  factory MyDuration.fromMinutes(int minutes){
    return MyDuration._(minutes*60*1000);
  }
  factory MyDuration.fromSeconds(int seconds){
    return MyDuration._(seconds*1000);
  }

  // getter
  int get inHours => _milliseconds ~/ (60*60*1000);
  int get inMinutes => _milliseconds ~/ (60*1000);
  int get inSeconds => _milliseconds ~/ (1000);
  int get inMiliseconds => _milliseconds;

  // overloading by operator 
  bool operator >(MyDuration other){
    return _milliseconds > other._milliseconds;
  }
  MyDuration operator -(MyDuration other){
    return MyDuration._(_milliseconds - other._milliseconds);
  }
  MyDuration operator +(MyDuration other){
    return MyDuration._(_milliseconds + other._milliseconds);
  }

  // Display the duration in a readable format
  @override
  String toString() {
    int seconds = (_milliseconds / 1000).round();
    int minutes = (seconds / 60).floor();
    seconds = seconds % 60;
    int hours = (minutes / 60).floor();
    minutes = minutes % 60;
    return '$hours hours, $minutes minutes, $seconds seconds';
  }
}

void main() {
  MyDuration duration1 = MyDuration.fromHours(3); // 3 hours
  MyDuration duration2 = MyDuration.fromMinutes(45); // 45 minutes
  print(duration1 + duration2); // 3 hours, 45 minutes, 0 seconds
  print(duration1>duration2); //true

  try {
    print(duration2 - duration1); // This will throw an exception
  } catch (e) {
    print(e); 
  }
}
