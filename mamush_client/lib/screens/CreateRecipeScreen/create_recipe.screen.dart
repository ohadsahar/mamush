import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';
import 'package:momrecipes/theme/theme.dart';
import 'package:momrecipes/utils/dimensions.dart';
import 'package:momrecipes/widgets/app.screen.dart';
import 'package:momrecipes/widgets/column_scroll_view.widget.dart';

class CreateRecipeScreen extends StatefulWidget {
  @override
  CreateRecipeScreenState createState() => CreateRecipeScreenState();
}

class CreateRecipeScreenState extends State<CreateRecipeScreen> {
  final _formKey = GlobalKey<FormBuilderState>();
  final options = ['Hamburger', 'Krembo', 'Disney'];

  @override
  Widget build(BuildContext context) {
    final name =
        (ModalRoute.of(context)!.settings.arguments as Map)["categoryName"]
            .toString();
    return AppScreen(
      child: ColumnScrollView(
        child: Column(
          children: <Widget>[
            Text(
              name,
              style: appTheme.textTheme.headline4,
            ),
            FormBuilder(
              key: _formKey,
              onChanged: () => print('changed'),
              autovalidateMode: AutovalidateMode.onUserInteraction,
              initialValue: {'phoneNumber': ''},
              child: Column(
                children: <Widget>[
                  FormBuilderTextField(
                    validator: (value) {
                      if (value != 'yes') {
                        return 'Must be yes';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          const Radius.circular(Dimensions.md),
                        ),
                      ),
                      filled: true,
                      fillColor: Colors.white70,
                    ),
                    name: 'phoneNumber',
                    style: TextStyle(color: Colors.black),
                  ),
                  FormBuilderCheckbox(
                    name: 'kosher',
                    title: Text('Kosher'),
                    initialValue: false,
                  ),
                  FormBuilderCheckboxGroup(
                    name: 'properties',
                    options: [
                      FormBuilderFieldOption(
                        value: 'Garden',
                        child: Text('Garden'),
                      ),
                      FormBuilderFieldOption(
                        value: 'Sea',
                        child: Text('Garden'),
                      ),
                      FormBuilderFieldOption(
                        value: 'Sun',
                        child: Text('Garden'),
                      ),
                    ],
                  ),
                  FormBuilderChoiceChip(
                    name: 'food_select',
                    decoration:
                        InputDecoration(labelText: 'What SHOULD YOU TAKE?'),
                    options: [
                      FormBuilderFieldOption(
                        value: 'hamburger',
                        child: Text('Hamburger'),
                      ),
                      FormBuilderFieldOption(
                        value: 'Chips',
                        child: Text('Chips'),
                      ),
                      FormBuilderFieldOption(
                        value: 'Salad',
                        child: Text('Salad'),
                      ),
                    ],
                  ),
                  FormBuilderDateTimePicker(
                    name: 'date',
                  ),
                  FormBuilderDateRangePicker(
                    name: 'range',
                    firstDate: DateTime(2019),
                    lastDate: DateTime(2023),
                    format: DateFormat(
                      'DD-MM-YYYY',
                    ),
                  ),
                  FormBuilderField(
                    name: 'custom_field',
                    builder: (FormFieldState<dynamic> field) {
                      return InputDecorator(
                        decoration: InputDecoration(
                          labelText: 'Select Your Option',
                        ),
                        child: Container(
                          height: 200,
                          child: CupertinoPicker(
                            itemExtent: 30,
                            children: options.map((c) => Text(c)).toList(),
                            onSelectedItemChanged: (index) {
                              field.didChange(options[index]);
                            },
                          ),
                        ),
                      );
                    },
                  ),
                  ElevatedButton(
                    onPressed: () {
                      final formData = _formKey.currentState!.value;
                      _showSnackbar(context, formData);
                      _formKey.currentState!.reset();
                      FocusScope.of(context).unfocus();
                    },
                    child: Text('Submit'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      final validate = _formKey.currentState!.saveAndValidate();
                      if (validate) {
                        _formKey.currentState!.save();
                        final formData = _formKey.currentState!.value;
                        FocusScope.of(context).unfocus();
                        _showSnackbar(context, formData);
                      } else {
                        print('not valid');
                      }
                    },
                    child: Text('Read From Data'),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      // final id =
      //     (ModalRoute.of(context)!.settings.arguments as Map)["id"].toString();
      // print(id);
    });
  }

  _showSnackbar(BuildContext context, formData) {
    print(formData);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('A SnackBar has been shown.'),
      ),
    );
    // Scaffold.of(context).showSnackBar(
    //   SnackBar(
    //     content: Text(
    //       '$formData',
    //       textScaleFactor: 1.5,
    //     ),
    //   ),
    // );
  }
}
