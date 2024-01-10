import 'package:flutter/material.dart';
import 'package:flutter_application_1/page5.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class Page4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Acaa\'s Gorgeus lookin\' Photos'),
      ),
      body: MasonryGridView.builder(
        itemCount: 13,
        gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
        ),
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.all(6.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black54,
                  offset: Offset(2.0, 5.5),
                  blurRadius: 2.5,
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                'assets/lucukk/aca${index + 1}.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Page5()),
          );
        },
        label: Text('Masyaallah lucu! LANJUT!'),
        icon: Icon(Icons.arrow_forward),
      ),
    );
  }
}
