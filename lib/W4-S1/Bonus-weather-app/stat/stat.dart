enum Day {
  monday("Monday"),
  tuesday("Tuesday"),
  wednesday("Wednesday"),
  thursday("Thursday"),
  friday("Friday"),
  saturday("Saturday"),
  sunday("Sunday");

  final String displayDay;
  
  const Day(this.displayDay);
}


enum City {
  newYork("New York"),
  losAngeles("Los Angeles"),
  chicago("Chicago"),
  houston("Houston"),
  phoenix("Phoenix"),
  philadelphia("Philadelphia"),
  sanAntonio("San Antonio"),
  sanDiego("San Diego"),
  dallas("Dallas"),
  sanJose("San Jose"),
  austin("Austin"),
  jacksonville("Jacksonville"),
  fortWorth("Fort Worth"),
  columbus("Columbus"),
  sanFrancisco("San Francisco"),
  charlotte("Charlotte"),
  indianapolis("Indianapolis"),
  seattle("Seattle"),
  denver("Denver"),
  washingtonDC("Washington, D.C.");

  final String displayCity;

  const City(this.displayCity);
}
