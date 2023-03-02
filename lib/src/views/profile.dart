import 'package:flutter/material.dart';
import 'package:test_rym_app/src/widget/profileInformation.dart';


class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> with AutomaticKeepAliveClientMixin {
  @override
   Widget build(BuildContext context) {

    return  const Scaffold(
      body: InfoProfile(),
   );
  }

   @override
  bool get wantKeepAlive => true;
}


 