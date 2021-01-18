// // import 'package:flutter/cupertino.dart';
// // import 'package:flutter/material.dart';
// // import 'package:sfero/constants.dart';
// // import 'package:sfero/models/blocks.dart';
// // import 'package:sfero/screens/home/components/counter.dart';

// // class ItemCard extends StatefulWidget {
// //   final Block block;
// //   final Function press;
// //   const ItemCard({Key key, this.block, this.press}) : super(key: key);

// //   @override
// //   _ItemCardState createState() => _ItemCardState();
// // }

// // class _ItemCardState extends State<ItemCard> {
// //   @override
// //   Widget build(BuildContext context) {
// //     // return GestureDetector(
// //     //   onTap: widget.press,
// //     //   child: Card(
// //     //     elevation: 4,
// //     //     margin: EdgeInsets.all(10),
// //     //     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
// //     //     child: Column(
// //     //       mainAxisAlignment: MainAxisAlignment.start,
// //     //       children: [
// //     //         Padding(
// //     //           padding: EdgeInsets.symmetric(vertical: kDefaultPaddin),
// //     //           child: Text(
// //     //             widget.block.desire,
// //     //             style: kDefaultFontStyle,
// //     //           ),
// //     //         ),
// //     //         KCounter(),
// //     //       ],
// //     //     ),
// //     //   ),
// //     // );
// //   }
// // }

// import 'dart:math';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:sfero/constants.dart';
// import 'package:sfero/services/record.dart';

// class BuildListItem {
//   Widget buildListItem(BuildContext context, DocumentSnapshot data) {
//     Record record = Record.fromSnapshot(data);

//     return Column(
//       children: [
//         Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
//           child: Container(
//             child: Card(
//               elevation: 4,
//               margin: EdgeInsets.all(10),
//               color:
//                   Colors.primaries[Random().nextInt(Colors.primaries.length)],
//               shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(10)),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   Padding(
//                     padding: EdgeInsets.symmetric(vertical: kDefaultPaddin),
//                     child: Text(
//                       record.name,
//                       style: kDefaultFontStyle,
//                     ),
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceAround,
//                     children: <Widget>[
//                       IconButton(
//                         icon: Icon(Icons.add),
//                         iconSize: 20,
//                         onPressed: () => {
//                           if (record.counter > 0)
//                             {
//                               record.reference
//                                   .update({'counter': FieldValue.increment(1)}),
//                             }
//                         },
//                       ),
//                       Text(
//                         record.counter.toString(),
//                         style: TextStyle(
//                             fontSize: 25,
//                             fontWeight: FontWeight.bold,
//                             color: kTextWhiteColor),
//                       ),
//                       IconButton(
//                         icon: Icon(Icons.minimize),
//                         iconSize: 20,
//                         onPressed: () => {
//                           if (record.counter > 0)
//                             {
//                               record.reference.update(
//                                   {'counter': FieldValue.increment(-1)}),
//                             }
//                         },
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
