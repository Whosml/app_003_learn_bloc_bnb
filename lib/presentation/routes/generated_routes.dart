import 'package:app_003_learn_bloc_bnb/bloc/landing_page_bloc.dart';
import 'package:app_003_learn_bloc_bnb/presentation/screens/landing_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/src/bloc_provider.dart';

class RouteGenerator {
  final LandingPageBloc landingPageBloc = LandingPageBloc();
  Route<dynamic> generateRoute(RouteSettings settings){
    final args = settings.arguments;
    switch (settings.name) {
      case '/' : return MaterialPageRoute(builder: (_) => BlocProvider<LandingPageBloc>.value(
        value: landingPageBloc,
        child: const LandingPage(),
      ));

      default: return _errorRoute();
    }
  }
  
  static Route _errorRoute() {
    return MaterialPageRoute(builder: (_){
      return Scaffold(
        appBar: AppBar(title: const Text('Error')),
        body: const Center(child: Text('ERROR')),
      );
    });
  }
} 