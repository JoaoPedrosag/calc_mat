import 'package:flutter_modular/flutter_modular.dart';
import 'package:matapp/src/modules/calc/calc_view.dart';
import 'package:matapp/src/modules/splash/splash_page.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, args) => const SplashPage()),
        ChildRoute(
          '/home',
          child: (_, args) => const HomePage(),
          transition: TransitionType.downToUp,
          duration: const Duration(milliseconds: 800),
        ),
      ];
}
