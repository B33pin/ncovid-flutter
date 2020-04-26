import 'networking.dart';
class DataModel {
  Future <dynamic> getcountrydata() async {
    NetworkingData networkingData = NetworkingData(
        url: 'https://nirjal.herokuapp.com/services/api/corona/country=nepal&apikey=lololo');
    var weatherData = await networkingData.getdata();
    return weatherData;
  }

  Future <dynamic> getspecificcountrydata(String cityname) async {
    NetworkingData networkingData = NetworkingData(
        url: 'https://nirjal.herokuapp.com/services/api/corona/country=$cityname&apikey=lololo');
    var weatherData = await networkingData.getdata();
    return weatherData;
  }
}