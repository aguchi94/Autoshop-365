import 'dart:ffi';

class Person {
  String nombre;
  String direccion;
  String correo;
  int saldo;

  Person(this.nombre, this.direccion, this.correo, this.saldo) {
    this.nombre = nombre;
    this.direccion = direccion;
    this.correo = correo;
    this.saldo = saldo;
  }
}

class Producto {
  String codigo;
  String nombre;
  int precio;

  Producto(this.codigo, this.nombre, this.precio) {
    this.nombre = nombre;
    this.codigo = codigo;
    this.precio = precio;
  }
}
