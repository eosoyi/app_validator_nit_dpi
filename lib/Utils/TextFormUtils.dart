import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFormUtils extends StatefulWidget {
  final String label;
  final String? Function(String?)? validator;
  final bool isPassword;
  final TextInputType tipoTeclado;
  final ValueChanged<String>? onChange;
  final TextEditingController? controller;
  final TextInputAction textInputAction;
  final ValueChanged<String>? onFieldSubmitted;
  final InputDecoration? decoration;
  final Color color;
  final double? paddinInterno;
  final Widget? prefixIcon;
  final Widget? sufixIcon;
  final bool? enabled;
  final FocusNode? focusNode;
  final List<TextInputFormatter>? inputFormatter;
  final String? initialValue;

  TextFormUtils({
    Key? key,
    required this.label,
    this.validator,
    this.isPassword = false,
    this.onChange,
    this.controller,
    this.tipoTeclado = TextInputType.text,
    this.textInputAction = TextInputAction.next,
    this.onFieldSubmitted,
    this.decoration,
    this.color = Colors.black,
    this.prefixIcon,
    this.sufixIcon,
    this.paddinInterno,
    this.enabled,
    this.inputFormatter,
    this.focusNode,
    this.initialValue
  }) : super(key: key);

  @override
  State<TextFormUtils> createState() => _TextFormUtilsState();
}

class _TextFormUtilsState extends State<TextFormUtils> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      height: 70,
      child: TextFormField(
        initialValue: widget.initialValue,
        focusNode: widget.focusNode,
        enabled: widget.enabled,
        keyboardType: widget.tipoTeclado,
        obscureText: widget.isPassword,
        validator: widget.validator,
        inputFormatters: widget.inputFormatter,
        cursorColor: widget.color,
        style: TextStyle(
          color: widget.color,
          decoration: TextDecoration.none,
        ),
        decoration: InputDecoration(
          labelText: widget.label,
          prefixIcon: widget.prefixIcon,
          suffix: widget.sufixIcon,
          fillColor: Colors.blue[300],
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15)
          ),
          prefixStyle: TextStyle(
            color: widget.color
          ),
          contentPadding: EdgeInsets.only(
            left: widget.paddinInterno ?? 20,
            right: widget.paddinInterno ?? 20,
          ),
          labelStyle: TextStyle(
            color: widget.color,
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: widget.color)
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: widget.color)
          ),
        ),
        onChanged: widget.onChange,
        controller: widget.controller,
        maxLength: null,
        textInputAction: widget.textInputAction,
        onFieldSubmitted: widget.onFieldSubmitted ?? 
        (action) => FocusScope.of(context).nextFocus(),
      ),
    );
  }
}