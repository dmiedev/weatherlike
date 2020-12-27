import 'package:flutter/material.dart';
import 'package:weatherlike/src/ui/constants.dart';

class SelectCityPage extends StatefulWidget {
  static const routeName = '/select';

  @override
  _SelectCityPageState createState() => _SelectCityPageState();
}

class _SelectCityPageState extends State<SelectCityPage> {
  final _cityController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1.0,
        backgroundColor: Colors.white,
        toolbarHeight: 75.0,
        centerTitle: true,
        title: Text(
          'City selection',
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
        leading: IconButton(
          iconSize: 30.0,
          icon: Icon(Icons.keyboard_arrow_left, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(kPagePadding),
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: Center(
                child: Column(
                  children: [
                    Text(
                      'What\'s the weather like in...?',
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 25.0),
                    Form(
                      key: _formKey,
                      child: Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              decoration: InputDecoration(
                                icon: Icon(Icons.location_city),
                                hintText: 'City name',
                              ),
                              controller: _cityController,
                              validator: (value) => value.trim().isEmpty
                                  ? 'Enter a city name'
                                  : null,
                            ),
                          ),
                          IconButton(
                            icon: Icon(Icons.search),
                            onPressed: () =>
                                _onSelectCityButtonPressed(context),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void _onSelectCityButtonPressed(BuildContext context) {
    if (_formKey.currentState.validate()) {
      Navigator.pop(context, _cityController.text);
    }
  }
}
