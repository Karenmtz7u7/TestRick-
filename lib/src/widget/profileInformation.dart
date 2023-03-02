import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/services.dart' show rootBundle;

class InfoProfile extends StatelessWidget {
  const InfoProfile({super.key});
  @override
  Widget build(BuildContext context) {
      return Scaffold(
      body: Stack(
        children: [
          _GradientBackground(),
          Center(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 16),
              child: _VerticalLayout(),
              
            ),
          ),
        ],
      ),
    );
  }
}

class _GradientBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:  BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
               Colors.white,
               Colors.green.shade200,
               ],
           ),
        ),
    );
  }
}

class _VerticalLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        _Principal(),

        Divider(
           color: Colors.grey,
           thickness: 1
           ),

        SizedBox(height: 20),
          
        _linkedIn(),

          SizedBox(height: 20),

        _gitHub(),

          SizedBox(height: 20),
        _portafolio(),
       
        SizedBox(height:30),
         _imageGif()
      ],
    );
  }
}

class _Principal extends StatelessWidget {
  const _Principal();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children:  [
        const Icon(Icons.person_2_outlined, size: 100,),
        Expanded(child: Column(
          children: const [
            Text('Karen Martinez Jimenez',
            style: TextStyle(
              fontSize: 15,
              color: Colors.black),
              ),
            Text('Desarrollador de apliaciones moviles'),
            Text('FILUP'),
          ],
        ))
      ],
    );
  }
}


class _linkedIn extends StatelessWidget {
  const _linkedIn();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.add_to_home_screen_outlined),
         Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () => launch('https://www.linkedin.com/in/ana-karen-mart%C3%ADnez-jim%C3%A9nez-30b588253'),
                    child: const Text('LinkedIn'),
                  ),
                ],
              ),
            ),
      ],
    );
  }
}

class _gitHub extends StatelessWidget {
  const _gitHub();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.add_to_home_screen_outlined),
         Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () => launch('https://github.com/Karenmtz7u7'),
                    child: const Text('GitHub'),
                  ),
                ],
              ),
            ),
      ],
    );
  }
}

class _portafolio extends StatelessWidget {
  const _portafolio();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.work_outline),
         Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('Portafolio'),
                ],
              ),
            ),
      ],
    );
  }
}

class _imageGif extends StatelessWidget {
  const _imageGif();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
       Image(
        image: AssetImage('assets/img/desarrollo.gif'),),
      ],
    );
  }
}