
class User
{
  String uid;
  User({this.uid});
}
class UserData
{
  final String uid;
  final String name;
  final String age;
  final String gender;
  final String weight;
  final String height;
  final String goalweight;
   final double bmi;
  final String status;
  final double bmr;
  UserData({this.uid,this.name,this.age,this.gender,this.height,this.weight,this.goalweight,this.bmi,this.status,this.bmr});
}