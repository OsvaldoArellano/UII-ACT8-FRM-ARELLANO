import 'producto_clase.dart';
import 'inventario_datos.dart';

class GestionInventario {
  static int _siguienteId = 1;

  static void agregarProducto(
      String nombre, String categoria, String descripcion, double precio) {
    int id = _siguienteId++;
    datosProductos[id] = Producto(
      id: id,
      nombre: nombre,
      categoria: categoria,
      descripcion: descripcion,
      precio: precio,
    );
  }

  static List<Producto> obtenerProductos() {
    return datosProductos.values.toList();
  }
}
