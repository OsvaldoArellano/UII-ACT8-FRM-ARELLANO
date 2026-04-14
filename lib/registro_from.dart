import 'package:flutter/material.dart';
import 'gestion_inventario.dart';

class RegistroFormScreen extends StatefulWidget {
  const RegistroFormScreen({super.key});

  @override
  State<RegistroFormScreen> createState() => _RegistroFormScreenState();
}

class _RegistroFormScreenState extends State<RegistroFormScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nombreCtrl = TextEditingController();
  final TextEditingController _categoriaCtrl = TextEditingController();
  final TextEditingController _descripcionCtrl = TextEditingController();
  final TextEditingController _precioCtrl = TextEditingController();

  void _guardarProducto() {
    if (_formKey.currentState!.validate()) {
      GestionInventario.agregarProducto(
        _nombreCtrl.text,
        _categoriaCtrl.text,
        _descripcionCtrl.text,
        double.parse(_precioCtrl.text),
      );
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Producto guardado correctamente en el inventario',
              style: TextStyle(fontWeight: FontWeight.bold)),
          backgroundColor: Colors.green,
        ),
      );
      Navigator.pop(context); // Volver al inicio después de guardar
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Captura de Producto'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Icon(Icons.create_rounded, size: 60, color: Colors.amber),
              const SizedBox(height: 24),
              TextFormField(
                controller: _nombreCtrl,
                decoration: const InputDecoration(
                  labelText: 'Nombre del Producto',
                  prefixIcon: Icon(Icons.book, color: Colors.red),
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.white,
                ),
                validator: (value) =>
                    value == null || value.isEmpty ? 'Campo requerido' : null,
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _categoriaCtrl,
                decoration: const InputDecoration(
                  labelText: 'Categoría',
                  prefixIcon: Icon(Icons.category, color: Colors.red),
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.white,
                ),
                validator: (value) =>
                    value == null || value.isEmpty ? 'Campo requerido' : null,
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _descripcionCtrl,
                decoration: const InputDecoration(
                  labelText: 'Descripción',
                  prefixIcon: Icon(Icons.description, color: Colors.red),
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.white,
                ),
                maxLines: 3,
                validator: (value) =>
                    value == null || value.isEmpty ? 'Campo requerido' : null,
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _precioCtrl,
                decoration: const InputDecoration(
                  labelText: 'Precio',
                  prefixIcon: Icon(Icons.attach_money, color: Colors.red),
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.white,
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) return 'Campo requerido';
                  if (double.tryParse(value) == null)
                    return 'Ingrese un precio válido';
                  return null;
                },
              ),
              const SizedBox(height: 40),
              SizedBox(
                height: 55,
                child: ElevatedButton.icon(
                  onPressed: _guardarProducto,
                  icon: const Icon(Icons.save, color: Colors.red),
                  label: const Text('Guardar Producto',
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 18,
                          fontWeight: FontWeight.bold)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
