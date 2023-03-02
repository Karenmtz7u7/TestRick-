import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_rym_app/src/views/home.dart';
import 'package:test_rym_app/src/views/profile.dart';


class RoutesPag extends StatelessWidget {
  const RoutesPag({super.key});

  @override

     Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _NavegacionModel(),
      child: Scaffold(
        body: _Paginas(),
        bottomNavigationBar: _Navegacion(),
   ),
    );
  }
}
class _Navegacion extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final navegacionModel = Provider.of<_NavegacionModel>(context);


    return BottomNavigationBar(
      backgroundColor: Colors.green.shade200,
      currentIndex: navegacionModel.paginaActual,
      onTap: (i) => navegacionModel.paginaActual = i,
      items: const [
        BottomNavigationBarItem( icon: Icon( Icons.home_outlined), label: 'Inicio'),
        BottomNavigationBarItem( icon: Icon( Icons.person ), label: 'Perfil'),
      ]
    );
  }
}

class _Paginas extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final navegacionModel = Provider.of<_NavegacionModel>(context);

    return PageView(
      controller: navegacionModel.pageController,
      physics: const NeverScrollableScrollPhysics(),
      children: const <Widget>[

        HomePage(),

        ProfilePage()

      ],
    );
  }
}


class _NavegacionModel with ChangeNotifier{

  int _paginaActual = 0;
  final PageController _pageController = PageController();


  int get paginaActual => _paginaActual;
  
  set paginaActual( int valor ) {
   _paginaActual = valor;

    _pageController.animateToPage(valor, duration: const Duration(milliseconds: 250), curve: Curves.easeOut );

    notifyListeners();
  }

  PageController get pageController => _pageController;

}