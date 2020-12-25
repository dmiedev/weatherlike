import 'package:flutter/material.dart';

class WeatherMiniCard extends StatelessWidget {
  final bool emphasized;
  final String icon;
  final String upperLabel;
  final String lowerLabel;

  WeatherMiniCard({
    this.emphasized = false,
    @required this.icon,
    @required this.upperLabel,
    @required this.lowerLabel,
  })  : assert(icon != null),
        assert(upperLabel != null),
        assert(lowerLabel != null);

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: emphasized ? 3.0 : 0.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
        side: !emphasized
            ? BorderSide(
                color: Colors.grey.withOpacity(0.2),
                width: 2.0,
              )
            : BorderSide.none,
      ),
      child: Container(
        width: 60.0,
        color: emphasized ? Theme.of(context).primaryColor : Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(
                upperLabel,
                style: TextStyle(
                  color: emphasized ? Colors.white : Colors.grey,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0, bottom: 12.0),
                child: Image.asset(
                  icon,
                  fit: BoxFit.cover,
                ),
              ),
              Text(
                lowerLabel,
                style: TextStyle(
                  color: emphasized ? Colors.white : Colors.grey,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
