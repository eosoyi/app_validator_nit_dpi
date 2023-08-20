import 'package:app_validator_nit_dpi/Utils/TextFormUtils.dart';
import 'package:app_validator_nit_dpi/Utils/ValidatorsUtils.dart';
import 'package:app_validator_nit_dpi/models/Voucher.dart';
import 'package:flutter/material.dart';

class FormNIT extends StatefulWidget {
  FormNIT({Key? key}) : super(key: key);

  @override
  State<FormNIT> createState() => _FormNITState();
}

class _FormNITState extends State<FormNIT> {
  final GlobalKey<FormState> _formNit = GlobalKey<FormState>();
  late TextEditingController _nit = TextEditingController();
  late TextEditingController _montoPagado = TextEditingController();
  late TextEditingController _montoGastado = TextEditingController();
  late TextEditingController _cambio = TextEditingController();
  late TextEditingController _productos = TextEditingController();
  

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

  void validarFormulario(){
    if(_formNit.currentState!.validate()){
      Voucher(
        nit: _nit.text,
        montoPagado: double.parse(_montoPagado.text),
        montoGastado: double.parse(_montoGastado.text),
        cambio: double.parse(_cambio.text),
        productos: _productos.text,
        tipo: 1
      );
    }
  }

    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Validacion de NIT')),
      ),
      body: WillPopScope(
        onWillPop: () async => true,
        child: SingleChildScrollView(
          child: SizedBox(
            width: size.width,
            child: Form(
              key: _formNit,
              child: Column(
                children: <Widget>[
                  const SizedBox(height: 20.0),
                  Hero(
                    tag: 'nit',
                    child: Icon(Icons.password, color: Colors.blue[300], size: 100)
                  ),
                  const SizedBox(height: 50.0),
                  ConstrainedBox(
                    constraints: const BoxConstraints(
                      maxWidth: 350,
                      minWidth: 200
                    ),
                    child: TextFormUtils(
                      enabled: true,
                      color: Colors.white,
                      label: 'Ingrese NIT',
                      controller: _nit,
                      prefixIcon: const Icon(Icons.abc, color: Colors.white),
                      validator: ( value ) {
                        if (value!.isEmpty) return 'El NIT es requerido';
                        if (!isInteger(value)){
                          return 'Ingrese solo numeros enteros';
                        }
                        if(value.length < 8 || value.length > 9){
                          return 'El numero debe tener entre 8  a 9 digitos.';
                        }
                      },
                    ),
                  ),

                  ConstrainedBox(
                    constraints: const BoxConstraints(
                      maxWidth: 350,
                      minWidth: 200
                    ),
                    child: TextFormUtils(
                      enabled: true,
                      color: Colors.white,
                      label: 'Monto pagado',
                      controller: _montoPagado,
                      prefixIcon: const Icon(Icons.numbers, color: Colors.white),
                      tipoTeclado: TextInputType.number,
                      validator: ( value ) {
                        if(value!.isEmpty) return 'El monto pagado es requerido.';
                        if(!isValidPositiveNumber(value.toString())){
                          return 'Debe ingresar solo numeros positivos';
                        }
                      },
                    ),
                  ),
                  ConstrainedBox(
                    constraints: const BoxConstraints(
                      maxWidth: 350,
                      minWidth: 200
                    ),
                    child: TextFormUtils(
                      enabled: true,
                      color: Colors.white,
                      label: 'Monto gastado',
                      controller: _montoGastado,
                      prefixIcon: const Icon(Icons.numbers, color: Colors.white),
                      tipoTeclado: TextInputType.number,
                      validator: ( value ) {
                        if(value!.isEmpty) return 'El monto gastado es requerido.';
                        if(!isValidPositiveNumber(value.toString())){
                          return 'Debe ingresar solo numeros positivos';
                        }
                      },
                    ),
                  ),
                  ConstrainedBox(
                    constraints: const BoxConstraints(
                      maxWidth: 350,
                      minWidth: 200
                    ),
                    child: TextFormUtils(
                      enabled: false,
                      color: Colors.white,
                      label: 'Cambio',
                      controller: _cambio,
                      prefixIcon: const Icon(Icons.numbers, color: Colors.white),
                      tipoTeclado: TextInputType.number,
                    ),
                  ),
                  ConstrainedBox(
                    constraints: const BoxConstraints(
                      maxWidth: 350,
                      minWidth: 200,
                    ),
                    child: TextFormUtils(
                      enabled: true,
                      color: Colors.white,
                      label: 'Productos',
                      controller: _productos,
                      prefixIcon: const Icon(Icons.text_fields, color: Colors.white),
                      tipoTeclado: TextInputType.multiline,
                      validator: ( value ){
                        if( value!.isEmpty ) return 'Debe ingresar al menos un producto.';
                      },
                    ),
                  ),
      
                  GestureDetector(
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(
                      maxWidth: 350,
                      minWidth: 200,
                    ),
                      child: Container(
                        width: size.width * .85,
                        height: 75,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.blue[300],
                      ),
                        child: const Center(
                          child: Text(
                            'Validar', 
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                            ), 
                            textAlign: TextAlign.center
                          ),
                        ),
                      ),
                    ),
                    onTap: () => validarFormulario(),
                  ), 
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}