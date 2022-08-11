import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'auth_feature/1-presentation/1.2-screens/login-screen.dart';
import 'auth_feature/1-presentation/1.3-logic-component/auth-viewModel.dart';
import 'company_profile_feature/1-presentation/1-2-screens/company-profile-screen.dart';
import 'injection-container.dart';



Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final sl = GetIt.instance;
  await init(sl);
  //
  runApp(
      MultiProvider(
          providers: [
            ChangeNotifierProvider<AuthViewModel>(create: (_) {
              debugPrint('resolving provider');
              return sl.call();}),
          ],
          child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
      title: 'Flutter Assessment',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const CompanyProfileScreen(),
    );
  }
}

