import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:subspace_assignment/views/BlogView/blog_view.dart';

class BlogCard extends StatelessWidget {
  final double height;
  final double width;
  final String url;
  final String text;
  const BlogCard(
      {super.key,
      required this.height,
      required this.width,
      required this.url,
      required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => BlogView(url: url, text: text),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(50)),
                height: height * 0.25,
                width: width,
                child: Image.network(
                  url,
                  fit: BoxFit.fill,
                )),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(text,
                  style: GoogleFonts.roboto(
                      textStyle: TextStyle(
                          fontWeight: FontWeight.w500, fontSize: 18))),
            )
          ],
        ),
      ),
    );
  }
}
