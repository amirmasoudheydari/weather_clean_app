import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'app_component.config.dart';

final GetIt locator = GetIt.I;

@InjectableInit(
  preferRelativeImports: false,
)
Future<void> initAppComponentLocator() async => locator.init();
