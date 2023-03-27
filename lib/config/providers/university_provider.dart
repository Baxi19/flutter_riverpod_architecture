import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/use_cases/university/university_use_case.dart';
import '../../data/repositories/university_repository.dart';

final universityProvider = Provider<UniversityUseCase>(
  ((ref) => UniversityUseCase(UniversityRepository())),
);
