import 'package:get_it/get_it.dart';
import 'package:gencare/presentation/blocs/auth/auth_bloc.dart';
import 'package:gencare/domain/usecases/auth_usecase.dart';
import 'package:gencare/domain/repositories/i_auth_repository.dart';
import 'package:gencare/data/repositories/auth_repository.dart';

final sl = GetIt.instance;

void init() {
  // Blocs
  sl.registerFactory(() => AuthBloc(sl<AuthUseCase>()));
  
  // UseCases
  sl.registerLazySingleton(() => AuthUseCase(sl()));
  
  // Repositories
  sl.registerLazySingleton<IAuthRepository>(() => AuthRepository());
} 