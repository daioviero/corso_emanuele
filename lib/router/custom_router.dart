import 'package:corso_emanuele/router/route_names.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../pages/chat_list/chat_list.dart';
import '../pages/chat_page/chat_page.dart';
import '../repositories/chat_repository.dart';

class CustomRouter {
  CustomRouter();

  // Inserisco le rotte
  final GoRouter _router = GoRouter(
    routes: <RouteBase>[
      ShellRoute(
        builder: (BuildContext context, GoRouterState state, Widget child) =>
            RepositoryProvider(
              create: (context) => ChatRepository(),
              child: child,
            ),
        routes: [
          GoRoute(
            name: RouteNames.chatList,
            path: '/',
            builder: (BuildContext context, GoRouterState state) => ChatList(),
          ),
          GoRoute(
            name: RouteNames.chat,
            // path: '/chat',
            path: '/chat/:chatId',
            builder: (BuildContext context, GoRouterState state) =>
                ChatPage(chatId: state.pathParameters['chatId']!),
          ),
        ],
      ),
    ],
  );

  GoRouter getRouter() {
    return _router;
  }
}
