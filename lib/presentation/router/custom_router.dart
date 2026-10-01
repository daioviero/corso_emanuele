import 'package:corso_emanuele/presentation/router/route_names.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../data/repositories/chat_repository.dart';
import '../pages/chat_list/chat_list.dart';
import '../pages/chat_page/chat_page.dart';

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
              // Così duplico i dati statici che già ho in chat_list
              // final data = state.extra as Map<String, String>;

            /* Con chatId io gestisco solo un identificativo e non passo
            * fisicamente tutti i parametri, inoltre è più semplice recuperare
            * le informazioni se ad esempio voglio aprire chat/2 dalle notifiche
            */
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
