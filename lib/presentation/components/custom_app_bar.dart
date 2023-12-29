import 'package:flutter/material.dart';

AppBar buildCustomAppBar(BuildContext context,
        {required String title, List<Widget>? actions}) =>
    AppBar(
      foregroundColor: Colors.white,
      title: Text(
        title,
      ),
      centerTitle: true,
      backgroundColor: Theme.of(context).colorScheme.primary,
      actions: actions,
    );
