import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddNoteScreen extends StatefulWidget {
  const AddNoteScreen({super.key});

  @override
  State<AddNoteScreen> createState() => _AddNoteScreenState();
}

class _AddNoteScreenState extends State<AddNoteScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.sp),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios_new,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.sp),
                child: ListView(
                  children: [
                    TextField(
                      controller: _titleController,
                      style: TextStyle(color: Colors.white70, fontSize: 30.sp),
                      cursorColor: Colors.white70,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Title',
                        hintStyle: TextStyle(
                          color: Colors.white70,
                          fontSize: 30.sp,
                        ),
                      ),
                    ),
                    TextField(
                      controller: _contentController,
                      style: TextStyle(color: Colors.white70, fontSize: 18.sp),
                      cursorColor: Colors.white70,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Type something here...',
                        hintStyle: TextStyle(
                          color: Colors.white70,
                          fontSize: 18.sp,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        elevation: 10,
        backgroundColor: Colors.grey.shade800,
        child: Icon(
          Icons.save,
          color: Colors.white70,
          size: 25.sp,
        ),
      ),
    );
  }
}
