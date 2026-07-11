import 'package:flutter/material.dart';

import '../models/model.dart';
import 'Detailnote .dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}


class _HomeScreenState extends State<HomeScreen> {

  final TextEditingController noteController =
  TextEditingController();


  final List<Note> notes = [];


  bool showNoteField = false;


  @override
  void dispose() {
    noteController.dispose();
    super.dispose();
  }



  void addNote(){

    final text = noteController.text.trim();

    if(text.isEmpty) return;


    setState(() {

      notes.add(
        Note(
          title: text,
          date: DateTime.now().toString(),
        ),
      );


      noteController.clear();
      showNoteField = false;

    });

  }



  void deleteNote(int index){

    setState(() {

      notes.removeAt(index);

    });

  }



  void openDetail(Note note){

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => Detailnote(
          note: note,
        ),
      ),
    );

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: const Color(0xffF5F5F5),


      appBar: AppBar(
        backgroundColor: Colors.black,

        title: const Text(
          "My Notes",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white
          ),
        ),

        centerTitle: true,

        actions: [IconButton(onPressed: (){}, icon: Icon(Icons.notifications,
          color: Colors.white,
        ))],

      ),



      body: Padding(

        padding: const EdgeInsets.all(16),

        child: Column(

          children: [

            if(showNoteField)

              Padding(
                padding: const EdgeInsets.only(top:20),
                child: TextField(
                  controller: noteController,
                  decoration: InputDecoration(
                    hintText: "Write your note",
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.send),
                      onPressed: addNote,
                    ),
                    border: OutlineInputBorder(

                      borderRadius:
                      BorderRadius.circular(15),

                    ),
                  ),
                ),
              ),

            const SizedBox(height:20),



            Expanded(

              child: ListView.builder(

                itemCount: notes.length,


                itemBuilder: (context,index){


                  final note = notes[index];


                  return Card(

                    child: ListTile(


                      title: Text(
                        note.title,
                      ),


                      subtitle: Text(
                        note.date,
                      ),



                      onTap: (){
                        openDetail(note);
                      },



                      trailing: IconButton(

                        icon:
                        const Icon(Icons.delete),


                        onPressed: (){

                          deleteNote(index);

                        },

                      ),

                    ),

                  );

                },

              ),

            ),


          ],

        ),

      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            showNoteField = !showNoteField;
          });
        },

        child: Icon(
          showNoteField ? Icons.close : Icons.add,
        ),
      ),

    );

  }
}