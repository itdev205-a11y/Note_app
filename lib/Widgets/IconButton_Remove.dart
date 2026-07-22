import 'package:flutter/material.dart';

class IconbuttonRemove extends StatelessWidget {

  final VoidCallback onDelete;

  const IconbuttonRemove({
    super.key,
    required this.onDelete,
  });


  @override
  Widget build(BuildContext context) {

    return IconButton(

      onPressed: () {

        showDialog(

          context: context,

          builder: (context) {

            return AlertDialog(

              title: const Text(
                "Delete Note",
              ),

              content: const Text(
                "Are you sure you want to delete this note?",
              ),


              actions: [

                TextButton(

                  onPressed: () {

                    Navigator.pop(context);

                  },

                  child: const Text(
                    "Cancel",
                  ),

                ),



                ElevatedButton(

                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                  ),


                  onPressed: () {

                    onDelete();

                    Navigator.pop(context);

                  },


                  child: const Text(
                    "Delete",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),

                ),


              ],

            );

          },

        );

      },


      icon: Container(

        padding: const EdgeInsets.all(8),

        decoration: BoxDecoration(

          color: Colors.red.withOpacity(0.1),

          shape: BoxShape.circle,

        ),


        child: const Icon(
          Icons.delete_outline,
          color: Colors.red,
          size: 22,
        ),

      ),

    );

  }
}