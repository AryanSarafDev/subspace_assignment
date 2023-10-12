import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:subspace_assignment/constants/colors.dart';
class BlogView extends StatelessWidget {
  final String url;
  final String text;
  const BlogView({super.key, required this.url, required this.text});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(backgroundColor: subspaceblack,
      appBar: AppBar(

        centerTitle: false,
        backgroundColor: subspacebackground,
        title: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(width:width*0.6,child: Text(text)),
            IconButton(onPressed: (){}, icon: Icon(Icons.favorite_border))
          ],
        ),

      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50)),
                    height: height * 0.25,
                    width: width*0.95,
                    child: Image.network(
                      url,
                      fit: BoxFit.fill,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 8),
                child: Text(text,
                    style: GoogleFonts.roboto(
                        textStyle: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 25))),
              )
            ],
          ),
        ),
      ),
    );
  }
}
