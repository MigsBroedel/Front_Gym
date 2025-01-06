import 'package:flutter/material.dart';
import '../Config/MainConfig.dart';


class Config extends StatefulWidget {
  const Config({super.key});

  @override
  State<Config> createState() => _ConfigState();
}

class _ConfigState extends State<Config> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 60,
        height: 60,

        child:
        ElevatedButton(onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => Mainconfig())),
        child: CircleAvatar(child: Icon(Icons.construction), backgroundColor: Colors.white,),
          style: ElevatedButton.styleFrom(
            elevation: 0,
              backgroundColor: Colors.white
          )
        ),
    );

  }
}



