import 'package:flutter/material.dart';
class BottomContainer extends StatelessWidget {

  final String image;
  final String name;

  final VoidCallback onTap;

  BottomContainer({required this. image , required this.name, required this.onTap});
  @override
  Widget build(BuildContext context) {

    return GestureDetector(
 onTap:onTap ,
child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          
          Expanded(
           
           

          child: Container(
            
        height: 270,
        width: 220,
        decoration: BoxDecoration(
            color: Color(0xff3a3e3e), borderRadius: BorderRadius.circular(20)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 60,
              backgroundColor: Colors.grey,
    backgroundImage: image.isNotEmpty
        ? NetworkImage(image)
        : null,
            ),
            ListTile(
              leading: Text(
                name,
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              trailing: Text(
                "test",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12),
              child: Row(
                children: [
                  /* Icon(
                    Icons.star,
                    size: 20,
                    color: Colors.white,
                  ),
                  Icon(
                    Icons.star,
                    size: 20,
                    color: Colors.white,
                  ),
                  Icon(
                    Icons.star,
                    size: 20,
                    color: Colors.white,
                  ),
                  Icon(
                    Icons.star,
                    size: 20,
                    color: Colors.white,
                  ),
                  Icon(
                    Icons.star,
                    size: 20,
                    color: Colors.white,
                  )*/
                ],
              ),
            )
          ],
             )),   ),
         ] ),
    );
  }
}