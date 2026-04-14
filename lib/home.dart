import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Papelería Antigravity'),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.shopping_cart,
                size: 120,
                color: Colors.red,
              ),
              const SizedBox(height: 24),
              Text(
                'Bienvenido a la Papelería',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.red[800],
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),
              const Text(
                'Gestiona tus productos de papelería de forma eficiente y rápida.',
                style: TextStyle(fontSize: 16, color: Colors.black87),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 48),
              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pushNamed(context, '/registro');
                  },
                  icon: const Icon(Icons.edit, color: Colors.red),
                  label: const Text('Registrar Nuevo Producto',
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 18,
                          fontWeight: FontWeight.bold)),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pushNamed(context, '/lista');
                  },
                  icon: Icon(Icons.view_list, color: Colors.red[900]),
                  label: Text('Ver Inventario',
                      style: TextStyle(
                          color: Colors.red[900],
                          fontSize: 18,
                          fontWeight: FontWeight.bold)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        Colors.yellow[100], // Tono más claro de amarillo
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
