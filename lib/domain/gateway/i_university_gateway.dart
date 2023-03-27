import '../models/university.dart';

abstract class IUniversityGateway {
  Future<List<UniversityData>> getAllUniversities();
}
