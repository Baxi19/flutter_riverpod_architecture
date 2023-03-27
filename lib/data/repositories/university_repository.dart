import 'package:flutter_riverpood_architecture/domain/gateway/i_university_gateway.dart';
import 'package:flutter_riverpood_architecture/domain/models/university.dart';
import 'package:flutter_riverpood_architecture/config/api/url.dart' as url;
import 'package:http/http.dart' as http;

class UniversityRepository extends IUniversityGateway {
  @override
  Future<List<UniversityData>> getAllUniversities() async {
    Uri uri = Uri.parse(url.baseURL);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final List<UniversityData> universityData = universityDataFromMap(
        response.body,
      );
      return universityData;
    } else {
      print("Error calling get universities: $response");
      List<UniversityData> emptyResponse = [];
      return emptyResponse;
    }
  }
}
