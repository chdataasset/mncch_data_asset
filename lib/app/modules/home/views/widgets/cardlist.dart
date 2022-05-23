//  children: [
//                                   Container(
//                                     alignment: Alignment.topCenter,
//                                     height: 0.25,
//                                     width: width,
//                                     color: Colors.red,
//                                   ),
//                                   Container(
//                                     width: width,
//                                     height: height * 0.50,
//                                     color: Colors.amber,
//                                     child: GridView.builder(
//                                       itemCount: controller.allList.length,
//                                       gridDelegate:
//                                           SliverGridDelegateWithFixedCrossAxisCount(
//                                         crossAxisCount: 3,
//                                         crossAxisSpacing: 2,
//                                         mainAxisSpacing: 2,
//                                         // mainAxisExtent: 5,
//                                         childAspectRatio: 1 / 1,
//                                       ),
//                                       itemBuilder: (context, index) {
//                                         //   Text("${listBody.judul}"),
//                                         TableListHome listBody =
//                                             controller.allList[index];
//                                         return Padding(
//                                           padding: const EdgeInsets.all(8.0),
//                                           child: LayoutBuilder(
//                                             builder: ((context, constraints) {
//                                               return Column(
//                                                 children: [
//                                                   Container(
//                                                     width: constraints.maxWidth,
//                                                     height:
//                                                         constraints.maxHeight *
//                                                             0.85,
//                                                     decoration: BoxDecoration(
//                                                       image:
//                                                           new DecorationImage(
//                                                         image: AssetImage(
//                                                             "${listBody.icon}"),
//                                                         fit: BoxFit.fill,
//                                                       ),
//                                                     ),
//                                                   ),
//                                                   // Text("${listBody.judul}"),
//                                                 ],
//                                               );
//                                             }),
//                                           ),
//                                         );
//                                       },
//                                     ),
//                                   )
//                                 ],