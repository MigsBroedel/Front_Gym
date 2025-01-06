import 'package:flutter/material.dart';
import 'package:gym/Auth/AuthPage.dart';
import 'package:gym/Treinos/TreinoProvider.dart';
import 'package:gym/User/UserConfig.dart';
import 'package:provider/provider.dart';
import '../Home/HomePage.dart';
import '../Treinos/TreinosPage.dart';
import '../User/UserPage.dart';

void main() async {
  runApp(
    MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => UserProvider()),
          ChangeNotifierProvider(create: (_) => TreinoProvider()),
        ],
      child: MyApp(),
    )
  );
}

class MyApp extends StatefulWidget {

  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedIndex = 0;

  List<Widget> _pages = [
    Userpage(),
    Homepage(),
    Treinospage(),
  ];

  @override
  void initState() {
    super.initState();
  }

  // Função para carregar o status de autenticação

  void _changePage(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Consumer<UserProvider>(
        builder: (context, userProvider, _) {
          return userProvider.isAuthenticated ? Scaffold(
            body: _pages[_selectedIndex],
            bottomNavigationBar: BottomNavigationBar(
              fixedColor: Colors.white70,
              elevation: 0,
              backgroundColor: Colors.black,
              currentIndex: _selectedIndex,
              onTap: _changePage,
              items: const [
                BottomNavigationBarItem(
                  backgroundColor: Colors.black,
                  icon: Icon(Icons.account_circle),
                  label: 'Users',
                ),
                BottomNavigationBarItem(
                  backgroundColor: Colors.black,
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                    backgroundColor: Colors.black,
                  icon: Icon(Icons.explore),
                  label: 'Treinos',)
              ],
            ),
          ) : Authpage();
        },
      )
    );
  }
}
