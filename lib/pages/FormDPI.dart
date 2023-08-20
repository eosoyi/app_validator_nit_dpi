import 'package:app_validator_nit_dpi/Utils/TextFormUtils.dart';
import 'package:app_validator_nit_dpi/Utils/ValidatorsUtils.dart';
import 'package:flutter/material.dart';

class FormDPI extends StatefulWidget {
  FormDPI({Key? key}) : super(key: key);

  @override
  State<FormDPI> createState() => _FormDPIState();
}

class _FormDPIState extends State<FormDPI> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late TextEditingController _dpi = TextEditingController();
  late TextEditingController _montoPagado = TextEditingController();
  late TextEditingController _montoGastado = TextEditingController();
  late TextEditingController _cambio = TextEditingController();
  late TextEditingController _productos = TextEditingController();

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    void validarFormulario(){
    if(_formKey.currentState!.validate()){
      
    }
  }
    
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Validacion de DPI')),
      ),
      body: WillPopScope(
        onWillPop: () async => true,
        child: SingleChildScrollView(
          child: SizedBox(
            width: size.width,
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  const SizedBox(height: 20.0),
                  Hero(
                    tag: 'dpi',
                    child: Icon(Icons.person, color: Colors.blue[300], size: 100)
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
                      label: 'Ingrese DPI',
                      controller: _dpi,
                      prefixIcon: const Icon(Icons.abc, color: Colors.white),
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
                    )
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