import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:subspace_assignment/blocs/fetch_cubit/fetch_cubit.dart';
import 'package:subspace_assignment/blocs/fetch_cubit/fetch_state.dart';
import 'package:subspace_assignment/constants/colors.dart';
import 'package:subspace_assignment/models/blog_model.dart';
import 'package:subspace_assignment/views/widgets/blogCards.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: subspaceblack,
      appBar: AppBar(
        leadingWidth: 0,
        centerTitle: false,
        backgroundColor: subspacebackground,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
                height: 150,
                width: 180,
                child: Image.asset("assets/subspaceLogo.png")),
            Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.menu,
                  color: subspacebackground,
                ),
              ),
            )
          ],
        ),
      ),
      body: SafeArea(
        child: BlocBuilder<FetchCubit, Fetch>(builder: (context, state) {
          BlogList blog;
          if (state is FetchLoading) {
            return Center(
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            );
          }
          if (state is FetchLoaded) {
            return ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return BlogCard(
                      height: height,
                      width: width,
                      url: state.blogs.BlogsList![index].imageUrl!,
                      text: state.blogs.BlogsList![index].title!);
                });
          }
          return Text("Error");
        }),
      ),
    );
  }
}
