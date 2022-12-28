class Item {
  final int id;
  final String nombre;

  Item({required this.id, required this.nombre});

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(id: json['Id'], nombre: json['Nombre']);
  }
}
