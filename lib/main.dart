import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:test_rym_app/src/service/ApiService.dart';
import 'package:test_rym_app/src/views/routespage.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
   
 SystemChrome.setSystemUIOverlayStyle( SystemUiOverlayStyle.light );

    
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=> ApiService() ),
      ],
      child: const MaterialApp(
        title: 'Material App',
        debugShowCheckedModeBanner: false,
        home: RoutesPag()
      ),
    );
  }
}