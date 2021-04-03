library custom_text_form_filed;

import 'package:flutter/material.dart';

class CustomTextFormField extends FormField<dynamic> {
  final String titleText;
  final String hintText;
  final dynamic value;
  final int maxLines;

  CustomTextFormField({
    FormFieldSetter<dynamic>? onSaved,
    FormFieldValidator<dynamic>? validator,
    this.titleText = '',
    this.hintText = '',
    this.value,
    this.maxLines = 1,
  }) : super(
          builder: (state) {
            return Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  InputDecorator(
                    decoration: InputDecoration(
                      labelText: titleText,
                      fillColor: Colors.white,
                      border: InputBorder.none,
                    ),
                    child: TextFormField(
                      initialValue: value,
                      decoration: InputDecoration(
                        hintText: hintText,
                      ),
                      onSaved: onSaved,
                      validator: validator,
                      maxLines: maxLines,
                    ),
                  )
                ],
              ),
            );
          },
        );
}
