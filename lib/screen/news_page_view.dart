// ignore_for_file: library_private_types_in_public_api

import 'package:bmi_calculator/screen/news_page.dart';
import 'package:flutter/material.dart';
import 'news_data.dart';

class NewsPageView extends StatefulWidget {
  const NewsPageView({Key? key}) : super(key: key);

  @override
  _NewsPageViewState createState() => _NewsPageViewState();
}

class _NewsPageViewState extends State<NewsPageView> {
  late PageController _pageController;
  int _currentPage = 0;
  late Future<List<dynamic>> _newsData;

  @override
  void initState() {
    super.initState();
    _newsData = NewsData.loadNewsData();
    _pageController = PageController(initialPage: _currentPage);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<dynamic>>(
      future: _newsData,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else {
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return PageView.builder(
              scrollDirection: Axis.vertical,
              controller: _pageController,
              itemCount: snapshot.data!.length,
              onPageChanged: (int page) {
                setState(() {
                  _currentPage = page;
                });
              },
              itemBuilder: (context, index) {
                var news = snapshot.data![index];
                return Container(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Image.network(
                        news['image_url'],
                        height: 400,
                        width: MediaQuery.of(context).size.width,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        news['title'],
                        style: const TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      Text(
                        news['subtitle'],
                        style: TextStyle(
                            fontSize: 18.0, color: Colors.grey.shade700),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      const Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(
                            height: 50,
                            width: 200,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromARGB(255, 175, 213, 232),
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => NewsDetailsScreen(
                                      newsData: news,
                                    ),
                                  ),
                                );
                              },
                              child: const Text(
                                "Read More",
                                style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      )
                    ],
                  ),
                );
              },
            );
          }
        }
      },
    );
  }
}
