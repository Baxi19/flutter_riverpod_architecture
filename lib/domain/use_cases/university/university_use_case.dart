import 'package:flutter_riverpood_architecture/domain/gateway/i_university_gateway.dart';
import 'package:flutter_riverpood_architecture/domain/models/university.dart';

class UniversityUseCase {
  final IUniversityGateway iUniversityGateway;
  UniversityUseCase(this.iUniversityGateway);
  Future<List<UniversityData>> getAllUniversities() => iUniversityGateway.getAllUniversities();
}
