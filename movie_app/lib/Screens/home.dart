import 'package:flutter/material.dart';
import 'package:movie_app/modals/movies_model.dart';
import 'package:movie_app/services/api_sevices.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ApiService service = ApiService();
  List<Movie> movies = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
      future: service.getMovies(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          movies = snapshot.data!;
          return GridView.builder(
            itemCount: movies.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 5,
                crossAxisSpacing: 5,
                childAspectRatio: 0.65),
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Container(
                    decoration: const BoxDecoration(color: Colors.grey,image: DecorationImage(image: NetworkImage("https://image.tmdb.org/t/p/w500"))),
                  ),
                ],
              );
            },
          );
        }
        return const Center(child: CircularProgressIndicator());
      },
    ));
  }
}
