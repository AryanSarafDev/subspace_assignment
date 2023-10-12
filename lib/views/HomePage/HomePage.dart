import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:subspace_assignment/blocs/fetch_cubit/fetch_cubit.dart';
import 'package:subspace_assignment/blocs/fetch_cubit/fetch_state.dart';
import 'package:subspace_assignment/constants/colors.dart';
import 'package:subspace_assignment/models/blog_model.dart';

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
      appBar: AppBar(
        leadingWidth: 0,
        centerTitle: false,
        backgroundColor: subspaceblack,
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
                  color: subspaceblack,
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
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50)),
                            height: height * 0.25,
                            width: width,
                            child: Image.network(
                              state.blogs.BlogsList![index].imageUrl!,
                              fit: BoxFit.fill,
                            )),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("${state.blogs.BlogsList![index].title}",style: TextStyle(fontSize: 16),),
                        )
                      ],
                    ),
                  );
                });
          }
          return Text("Error");
        }),
      ),
    );
  }
}
