import 'package:flutter/material.dart';

class TopTitle extends StatelessWidget {
  const TopTitle({
    @required this.primaryText,
    this.secondaryText,
    this.actions,
  }) : assert(primaryText != null);

  final String primaryText;
  final String secondaryText;
  final List<Widget> actions;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildTopBarTitle(),
          Row(children: [...?actions]),
        ],
      ),
    );
  }

  Widget _buildTopBarTitle() {
    if (secondaryText != null) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.baseline,
        children: [
          Text(
            '$primaryText,',
            style: TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            ' $secondaryText',
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.black54,
            ),
          ),
        ],
      );
    }
    return Text(
      primaryText,
      overflow: TextOverflow.fade,
      style: TextStyle(
        fontSize: 25.0,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
