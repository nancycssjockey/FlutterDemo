
class ResturantModel{
  String name;
  String model;

  ResturantModel.fromJson(Map jsonMap){
    name = jsonMap['name'];
    model = jsonMap['model'];
  }
}