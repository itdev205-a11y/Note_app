import 'package:flutter/material.dart';
import 'package:note/models/model.dart';
import '../Widgets/IconButton_Remove.dart';

class TrashScreen extends StatefulWidget {

  final List<Note> restore;

  const TrashScreen({
    super.key,
    required this.restore,
  });

  @override
  State<TrashScreen> createState() => _TrashScreenState();
}


class _TrashScreenState extends State<TrashScreen> {


  void delete(int index) {

    setState(() {

      widget.restore.removeAt(index);

    });

  }



  void deleteAll() {

    setState(() {

      widget.restore.clear();

    });

  }




  void showDeleteAllDialog() {


    if(widget.restore.isEmpty){

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "Trash is empty",
          ),
        ),
      );

      return;

    }



    showDialog(

      context: context,

      builder: (context) {

        return AlertDialog(

          title: const Text(
            "Delete All Notes",
          ),


          content: const Text(
            "Are you sure you want to delete all notes?",
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

                deleteAll();

                Navigator.pop(context);

              },


              child: const Text(
                "Delete All",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),

            ),


          ],

        );

      },

    );

  }





  @override
  Widget build(BuildContext context) {


    return Scaffold(


      appBar: AppBar(

        backgroundColor: Colors.black,

        elevation: 3,

        centerTitle: true,


        title: const Row(

          mainAxisSize: MainAxisSize.min,

          children: [

            Icon(
              Icons.delete_outline,
              color: Colors.white,
            ),


            SizedBox(width: 8),


            Text(
              "Trash",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),

          ],

        ),



        leading: IconButton(

          onPressed: () {

            Navigator.pop(context);

          },

          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),

        ),



        actions: [


          IconButton(

            onPressed: showDeleteAllDialog,


            icon: const Icon(

              Icons.delete_forever,

              color: Colors.red,

            ),


            tooltip: "Delete All",

          ),


        ],


      ),




      body: widget.restore.isEmpty

          ? const Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,

          children: [

            Icon(
              Icons.delete_outline,
              size: 80,
              color: Colors.grey,
            ),


            SizedBox(height: 15),


            Text(
              "Trash is empty",
              style: TextStyle(
                fontSize: 20,
                color: Colors.grey,
              ),
            ),

          ],

        ),

      )



          : ListView.builder(


        itemCount: widget.restore.length,


        itemBuilder: (context,index){


          final note = widget.restore[index];



          return Card(


            margin: const EdgeInsets.all(10),


            child: ListTile(


              leading: const Icon(

                Icons.note,

                color: Colors.grey,

              ),



              title: Text(

                note.title,

                style: const TextStyle(

                  fontWeight: FontWeight.bold,

                ),

              ),



              subtitle: Text(

                note.date,

              ),



              trailing: IconbuttonRemove(

                onDelete: () {

                  delete(index);

                },

              ),


            ),


          );


        },

      ),


    );

  }

}