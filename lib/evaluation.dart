import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:training_task/home_screen.dart';

class Rating extends StatefulWidget {
  const Rating({super.key});

  @override
  State<Rating> createState() => _RatingState();
}

class _RatingState extends State<Rating> {
  double rating = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Rating $rating',
              style: TextStyle(fontSize: 40),
            ),
            const SizedBox(
              height: 32,
            ),
            RatingBar.builder(
                minRating: 1,
                itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                itemSize: 46,
                updateOnDrag: true,
                itemPadding: EdgeInsets.symmetric(horizontal: 4),
                onRatingUpdate: (rating) {
                  setState(() {
                    this.rating = rating;
                  });
                }),
            TextButton(
                onPressed: () {
                  showRating() {
                    showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                              title: Text('Rate this App'),
                              content: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    'please leave a star rating',
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  SizedBox(
                                    height: 12,
                                  ),
                                  RatingBar.builder(
                                      minRating: 1,
                                      itemBuilder: (context, _) => Icon(
                                            Icons.star,
                                            color: Colors.amber,
                                          ),
                                      itemSize: 46,
                                      updateOnDrag: true,
                                      itemPadding:
                                          EdgeInsets.symmetric(horizontal: 4),
                                      onRatingUpdate: (rating) {
                                        setState(() {
                                          this.rating = rating;
                                        });
                                      }),
                                  SizedBox(
                                    height: 32,
                                  ),
                                ],
                              ),
                              actions: [
                                TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text(
                                      'ok',
                                      style: TextStyle(fontSize: 20),
                                    ))
                              ],
                            ));
                  }

                  showRating();
                },
                child: Text(
                  'To Rate',
                  style: TextStyle(fontSize: 30),
                )),
            SizedBox(
              height: 20,
            ),
            TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HomePage()),
                  );
                },
                child: Text(
                  'Go Back',
                  style: TextStyle(fontSize: 30),
                ))
          ],
        ),
      ),
    );
  }
}
