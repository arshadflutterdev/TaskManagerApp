import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:task_manager/app/Presentation/TaksScreens/add_task.dart';
import 'package:task_manager/app/Presentation/TaksScreens/deatils_screen.dart';
import 'package:task_manager/app/Presentation/TaksScreens/update_task.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        child: Icon(CupertinoIcons.add_circled, size: 40, color: Colors.amber),

        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddTask()),
          );
        },
      ),
      appBar: AppBar(
        title: Text("To-Do-List"),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return Card(
            color: Colors.white,
            elevation: 2,
            child: ListTile(
              title: Text(
                "Appointment",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
              ),
              subtitle: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Time to do this activity"),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DeatilsScreen(),
                        ),
                      );
                    },
                    child: Row(
                      children: [
                        Icon(Icons.arrow_forward_ios, size: 15),
                        Gap(2),
                        Text("details", style: TextStyle(fontSize: 16)),
                      ],
                    ),
                  ),
                ],
              ),
              trailing: SizedBox(
                width: 100,

                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => UpdateTask()),
                        );
                      },
                      icon: Icon(Icons.edit),
                    ),

                    Icon(CupertinoIcons.timer, color: Colors.green, size: 30),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
