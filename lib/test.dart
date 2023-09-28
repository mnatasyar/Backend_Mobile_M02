// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:flutter_spinbox/flutter_spinbox.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class MyBio extends StatefulWidget {
//   const MyBio({super.key});

//   @override
//   State<MyBio> createState() => _MyBioState();
// }

// class _MyBioState extends State<MyBio> {
//   String? _image;
//   double _score = 0;
//   final ImagePicker _picker = ImagePicker();
//   final String _keyScore = 'score';
//   final String _keyImage = 'image';
//   late SharedPreferences prefs;

//   void loadData() async {
//     prefs = await SharedPreferences.getInstance();
//     setState(() {
//       _score = (prefs.getDouble(_keyScore) ?? 0);
//       _image = prefs.getString(_keyImage);
//     });
//   }

//   @override
//   void iniState() {
//     super.initState();
//     loadData();
//   }
  
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("My Bio")),
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Center(
//           child: Column(children: [
//             Container(
//               width: 200,
//               height: 200,
//               decoration: BoxDecoration(color: Colors.red[200]),
//               child: _image != null
//                   ? Image.file(
//                     File(_image!),
//                     width: 200.0,
//                     height: 200.0,
//                     fit: BoxFit.fitHeight,
//                   )
//                   : Container(
//                     decoration: BoxDecoration(
//                       color: Color.fromARGB(225, 198, 198, 198)),
//                     width: 200,
//                     height: 200,
//                     child: Icon(
//                       Icons.camera_alt,
//                       color: Colors.grey[800],
//                     ),
//                   ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: ElevatedButton(
//                 onPressed: () async {
//                   XFile? image =
//                       await _picker.pickImage(source: ImageSource.gallery);
//                   _setImage(image?.path);
//                 },
//                 child: Text("Take Image")),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: SpinBox(
//                 max: 10.0,
//                 min: 0.0,
//                 value: _score,
//                 decimals: 1,
//                 step: 0.1,
//                 decoration: InputDecoration(labelText: 'Decimals'),
//                 onChanged: _setScore,
//               ),
//             )
//           ],)
//         ),
//       ),
//     );
//   }
//   Future<void> _setScore(double value) async {
//     prefs = await SharedPreferences.getInstance();
//     setState(() {
//       prefs.setDouble(_keyScore, value);
//       _score = ((prefs.getDouble(_keyScore) ?? 0));
//     });
//   }
//   Future<void> _setImage(String? value) async {
//     prefs = await SharedPreferences.getInstance();
//     if (value != null)
//       setState(() {
//         prefs.setString(_keyImage, value);
//         _image = prefs.getString(_keyImage);
//       });
//   }
// }