import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherlike/src/blocs/city_selection/city_selection_bloc.dart';
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
                          BlocConsumer<CitySelectionBloc, CitySelectionState>(
                            listener: _citySelectionBlocListener,
                            builder: (context, state) {
                              if (state is CitySelectionLoading) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: CircularProgressIndicator(),
                                );
                              }
                              return IconButton(
                                icon: Icon(Icons.search),
                                onPressed: () =>
                                    _onSelectCityButtonPressed(context),
                              );
                            },
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

  void _citySelectionBlocListener(
    BuildContext context,
    CitySelectionState state,
  ) {
    if (state is CitySelectionFailure) {
      String message = 'Error!';
      if (state.failureType == CitySelectionFailureType.notFound) {
        message = 'City "${state.cityName}" wasn\'t found!';
      } else if (state.failureType == CitySelectionFailureType.noInternet) {
        message = 'Can\'t reach server! Check your Internet connection!';
      }
      Scaffold.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(
          SnackBar(content: Text(message)),
        );
    } else if (state is CitySelectionSuccess) {
      Navigator.pop(context, state.location);
    }
  }

  void _onSelectCityButtonPressed(BuildContext context) {
    if (_formKey.currentState.validate()) {
      BlocProvider.of<CitySelectionBloc>(context).add(
        CitySelectionMade(cityName: _cityController.text),
      );
    }
  }
}
