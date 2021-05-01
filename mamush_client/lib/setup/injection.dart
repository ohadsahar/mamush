import 'package:get_it/get_it.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:injectable/injectable.dart';

import 'injection.config.dart';

final getIt = GetIt.instance;

@InjectableInit()
Future<void> configureDependencies(
    {String environment = Environment.prod}) async {
  final GlobalConfiguration config = GlobalConfiguration();
  await config.loadFromAsset(environment);
  getIt.registerSingleton(config);
  await $initGetIt(getIt, environment: environment);
}
