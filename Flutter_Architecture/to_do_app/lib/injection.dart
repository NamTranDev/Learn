import 'package:get_it/get_it.dart';
import 'package:to_do_app/data/db/db_dao.dart';
import 'package:to_do_app/data/interator/todo_use_case.dart';
import 'package:to_do_app/data/local/preference.dart';

final inject = GetIt.instance;

Future<void> configureInjection() async {
  inject.registerSingleton(DbDAO());
  inject.registerLazySingleton<IPref>(() => Preference());
  inject.registerFactory<ITodoUseCase>(() => TodoUseCase());
}
