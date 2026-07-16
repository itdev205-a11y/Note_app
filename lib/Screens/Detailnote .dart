import 'package:flutter/material.dart';

import '../models/model.dart';


class Detailnote extends StatelessWidget {

  final Note note;


  const Detailnote({
    super.key,
    required this.note,
  });


  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text(
          'Note Details',
        ),
        centerTitle: true,
      ),


      body: Padding(

        padding: const EdgeInsets.all(20),

        child: Column(

          crossAxisAlignment: CrossAxisAlignment.start,

          children: [


            Text(
              note.title,

              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),

            ),


            const SizedBox(height: 15),


            Text(
              note.date,

              style: const TextStyle(
                color: Colors.grey,
              ),

            ),


          ],

        ),

      ),

    );
  }
}