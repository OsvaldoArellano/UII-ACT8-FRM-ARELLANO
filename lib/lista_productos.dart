import 'package:flutter/material.dart';
import 'gestion_inventario.dart';
import 'producto_clase.dart';

class ListaProductosScreen extends StatefulWidget {
  const ListaProductosScreen({super.key});

  @override
  State<ListaProductosScreen> createState() => _ListaProductosScreenState();
}

class _ListaProductosScreenState extends State<ListaProductosScreen> {
  List<Producto> productos = [];

  @override
  void initState() {
    super.initState();
    _cargarProductos();
  }

  void _cargarProductos() {
    setState(() {
      productos = GestionInventario.obtenerProductos();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inventario de Productos'),
      ),
      body: productos.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.inventory_2_outlined,
                      size: 80, color: Colors.grey),
                  SizedBox(height: 16),
                  Text(
                    'No hay productos registrados.',
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.red,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: productos.length,
              itemBuilder: (context, index) {
                final prod = productos[index];
                return Card(
                  color: Colors.white,
                  elevation: 3,
                  margin: const EdgeInsets.only(bottom: 16),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.amber.shade400, width: 1.5),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(12),
                    leading: CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.red[100],
                      child: Icon(Icons.edit,
                          color: Colors.red[800]), // Icono de lápiz (papelería)
                    ),
                    title: Text(
                      prod.nombre,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.red),
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Categoría: ${prod.categoria}',
                              style:
                                  const TextStyle(fontWeight: FontWeight.w600)),
                          const SizedBox(height: 4),
                          Text(prod.descripcion),
                        ],
                      ),
                    ),
                    trailing: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 6),
                      decoration: BoxDecoration(
                        color: Colors.amber[100],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        '\$${prod.precio.toStringAsFixed(2)}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.red[900],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
