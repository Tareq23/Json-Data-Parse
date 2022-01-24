class PersonModel{
  String? name;
  int? age;
  List<String>? favGame;

  PersonModel({this.name,this.age,this.favGame});

  PersonModel.fromJson(Map<String,dynamic>parsedJson)
  {
    var gamesJson = parsedJson['favorite-sports'];
    name = parsedJson['name'];
    age = parsedJson['age'];
    favGame =  List<String>.from(gamesJson);
  }

}