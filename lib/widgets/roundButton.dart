import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  final String title;   //since used everywhere
  final VoidCallback onTap;
  final bool loading;

  const RoundButton({Key? key,
      required this.title,
      required this.onTap,
      this.loading = false,  // to show loading circle while loading initially should be false
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell (
      onTap: onTap,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
            color: Colors.deepPurple,
            borderRadius: BorderRadius.circular(10)
        ),

      child: Center(child: loading ? CircularProgressIndicator(strokeWidth: 3, color: Colors.white):
        Text(title,style: TextStyle(color: Colors.white),),),
      //to show loading circle if child is loading thn show icon else display text->Title
      ),
    );
  }
}
