// import 'package:flutter/material.dart';

// class AlertDialog extends StatefulWidget {
//   const AlertDialog({super.key});

//   @override
//   State<AlertDialog> createState() => _AlertDialogState();
// }

// class _AlertDialogState extends State<AlertDialog> {
//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }

// void alertDialog() async {
//   var result = await showDialog(
//       barrierDismissible: false, // tapon gray bg -> display
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: const Text("提示信息"),
//           content: const Text("确定要删除么？"),
//           actions: <Widget>[
//             TextButton(
//                 onPressed: () {
//                   print("取消");
//                   Navigator.pop(context, 'cancel');
//                 },
//                 child: const Text("取消")),
//             TextButton(
//                 onPressed: () {
//                   print("确定");
//                   Navigator.pop(context, 'ok');
//                 },
//                 child: const Text("确定"))
//           ],
//         );
//       });
//   print(result);
// }
