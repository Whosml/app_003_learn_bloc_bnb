import 'package:app_003_learn_bloc_bnb/bloc/landing_page_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

List<BottomNavigationBarItem> bottomNavigationBarItems = const <BottomNavigationBarItem>[
  BottomNavigationBarItem(icon: Icon(Icons.home_outlined),         label: 'Inicio'),
  BottomNavigationBarItem(icon: Icon(Icons.grid_3x3),              label: 'Categorias'),
  BottomNavigationBarItem(icon: Icon(Icons.search),                label: 'Buscar'),
  BottomNavigationBarItem(icon: Icon(Icons.favorite_outline),      label: 'Favorito'),
  BottomNavigationBarItem(icon: Icon(Icons.shopping_bag_outlined), label: 'Carro'),
];

const List<Widget> bottomNavigationScreen = <Widget>[
  Text('Index 0: Inicio'),
  Text('Index 1: Categorias'),
  Text('Index 2: Buscar'),
  Text('Index 3: Favorito'),
  Text('Index 4: Carro'),
];

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LandingPageBloc, LandingPageState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: Center(child: bottomNavigationScreen.elementAt(state.tabIndex)),
          bottomNavigationBar: BottomNavigationBar(
            items: bottomNavigationBarItems,
            currentIndex: state.tabIndex,
            selectedItemColor: Theme.of(context).colorScheme.primary,
            unselectedItemColor: Theme.of(context).colorScheme.secondary,
            onTap: (index) {
              BlocProvider.of<LandingPageBloc>(context).add(TabChange(tabIndex: index));
            },
          ),          
        );
      },
    );
  }
}