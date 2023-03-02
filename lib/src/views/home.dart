import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_rym_app/src/service/ApiService.dart';
import 'package:test_rym_app/src/widget/listPerson.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}



class _HomePageState extends State<HomePage> with AutomaticKeepAliveClientMixin {
  @override
   Widget build(BuildContext context) {

    final personajes = Provider.of<ApiService>(context).charactersList;

    return  const Scaffold(
      body: ListCharacteres(),
   );
  }

   @override
  bool get wantKeepAlive => true;
}