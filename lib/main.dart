import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:terrific_venture_assessment/auth_feature/2-domain/2.2-use-cases/login-use-case.dart';
import 'package:terrific_venture_assessment/auth_feature/2-domain/2.3-repository/auth-repository.dart';
import 'package:terrific_venture_assessment/auth_feature/3-data/3.1-repository/auth-repository-IMPL.dart';
import 'auth_feature/1-presentation/1.2-screens/login-screen.dart';
import 'auth_feature/1-presentation/1.3-logic-component/auth-viewModel.dart';
import 'injection-container.dart';



Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final sl = GetIt.instance;
  await init(sl);
  //
  runApp(
      MultiProvider(
          providers: [
            ChangeNotifierProvider<AuthViewModel>(create: (_) => sl()),
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
      home: const LoginScreen(),
    );
  }
}

