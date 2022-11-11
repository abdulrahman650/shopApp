import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DefaultFormField extends StatefulWidget {
  final String? labelText;
  final String? hintText;
  final Function? onTap;
  // final Function? onChange;
  final bool isPassword;
  final TextEditingController? controller;
  final FormFieldValidator? validator;
  final ValueChanged<String>? onFieldSubmitted;
  final TextInputType? keyboardType;
  final IconData? prefixIcon;

  const DefaultFormField({
    Key? key,
    this.labelText,
    this.hintText,
    this.onTap,
    // this.onChange,
    this.controller,
    this.validator,
    this.onFieldSubmitted,
    this.isPassword = false,
    this.keyboardType,
    this.prefixIcon,
    // required suffixIcon,
  }) : super(key: key);

  @override
  State<DefaultFormField> createState() => _DefaultFormFieldState();
}

class _DefaultFormFieldState extends State<DefaultFormField> {
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: TextFormField(
        obscureText: widget.isPassword ? _isObscure : false,
        cursorColor: Colors.blue,
        onTap: () {
          widget.onTap!();
        },
        // onChanged: widget.onChange!(),
        controller: widget.controller,
        validator: widget.validator,
        onFieldSubmitted: widget.onFieldSubmitted,
        style: const TextStyle(color: Colors.blue, fontSize: 18, height: 1.5),
        keyboardType: widget.keyboardType,
        decoration: InputDecoration(
          suffixIcon: widget.isPassword
              ? IconButton(
              splashRadius: 20,
              icon: Icon(
                  _isObscure ? Icons.visibility : Icons.visibility_off,
                  color: Colors.blue),
              onPressed: () => setState(() => _isObscure = !_isObscure))
              : null,
          filled: true,
          prefixIcon:
          widget.prefixIcon != null ? Icon(widget.prefixIcon) : null,
          contentPadding:
          const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          fillColor: Colors.white,
          hintText: widget.hintText,
          labelText: widget.labelText,
          labelStyle: const TextStyle(color: Colors.blue, fontSize: 18),
          hintStyle: const TextStyle(color: Colors.blue, fontSize: 18),
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}
