import 'package:flutter/material.dart';

class MealTriat extends StatelessWidget {
  const MealTriat({super.key,required this.icon,required this.label});
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon,
        size: 16,
        color: Colors.white,

          
        ),
        SizedBox(width: 6,),
        Text(label, 
        style: TextStyle(
          color: Colors.white,
                   
        ),


        )
      ],

    );

  }
}