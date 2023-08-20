// Valida que un text sean solo numeros de 0 a 9
bool isInteger(String value){
  final regex = RegExp(r'^[0-9]+$');
  return regex.hasMatch(value);
}

// valida que los numeros sean numeros enteros o decimales positivos
bool isValidPositiveNumber(String value){
  final regex = RegExp(r'^\d+(\.\d+)?$');
  return regex.hasMatch(value);
}