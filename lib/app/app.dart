import 'package:ecommerce_app/sevices/counter_service.dart';
import 'package:ecommerce_app/views/screens/main/homeview.dart';
import 'package:ecommerce_app/views/screens/loginandregister/login.dart';
import 'package:ecommerce_app/views/screens/loginandregister/signup.dart';
import 'package:ecommerce_app/views/screens/starting/onboarding.dart';
import 'package:ecommerce_app/views/screens/starting/splashview.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

@StackedApp(
  routes: [
    MaterialRoute(page: SplashScreen),
    MaterialRoute(page: OnboardingPage),
    MaterialRoute(page: LoginView),
    MaterialRoute(page: SignupView),
    MaterialRoute(page: HomeView),
  ],
  dependencies: [
    Singleton(classType: NavigationService),
    LazySingleton(classType: CounterService)
  ],
)
class AppSetup {}
