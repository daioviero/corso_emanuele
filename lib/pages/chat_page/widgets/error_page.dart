import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../router/route_names.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key, required this.error});

  final String error;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(error),
          ElevatedButton(
            onPressed: () => context.goNamed(RouteNames.chatList),
            child: const Text('Torna alla home'),
          ),
        ],
      ),
    );
  }
}