import 'package:flutter/material.dart';
import 'home.dart';
import 'registro_form.dart';
import 'lista_productos.dart';

void main() {
  runApp(const PapeleriaApp());
}

class PapeleriaApp extends StatelessWidget {
  const PapeleriaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Papelería Antigravity',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
        scaffoldBackgroundColor:
            const Color(0xFFFFFDF5), // Fondo amarillo neutral muy claro
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.red,
          foregroundColor: Colors.white,
          elevation: 2,
          centerTitle: true,
          titleTextStyle: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor:
                Colors.amber, // Tono amarillo para botones primarios
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            elevation: 3,
          ),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/registro': (context) => const RegistroFormScreen(),
        '/lista': (context) => const ListaProductosScreen(),
      },
    );
  }
}
