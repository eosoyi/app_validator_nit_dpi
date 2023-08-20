class Voucher{
  String nit;
  double montoPagado;
  double montoGastado;
  double cambio;
  String productos;
  int tipo;


  Voucher({
    required this.nit,
    required this.montoPagado,
    required this.montoGastado,
    required this.cambio,
    required this.productos,
    required this.tipo
  });
}