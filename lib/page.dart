// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, unused_field, prefer_final_fields

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ostello_app/color.dart';
import 'package:ostello_app/desc_tile.dart';
import 'package:ostello_app/filter.dart';
import 'package:ostello_app/global.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List filteredData = [];
  List topicsSel = [];
  bool km2 = false;
  String sorting = "relevance";
  TextEditingController _controller = TextEditingController();

  void filterData(String query, String sortBy) {
    setState(() {
      filteredData = data.where((center) {
        final name = center['name'].toString().toLowerCase();
        final topics = center['topics'].cast<String>().join(" ").toLowerCase();
        final location = center['location'].toString().toLowerCase();
        final lowerQuery = query.toLowerCase();

        return name.contains(lowerQuery) ||
            topics.contains(lowerQuery) ||
            location.contains(lowerQuery);
      }).toList();

      if (km2) {
        filteredData =
            filteredData.where((center) => center['distance'] <= 2.0).toList();
      }

      if (topicsSel.isNotEmpty) {
        filteredData = filteredData
            .where((center) =>
                topicsSel.any((topic) => center['topics'].contains(topic)))
            .toList();
      }

      if (sortBy == 'distance') {
        filteredData.sort((a, b) =>
            a['distance'].toDouble().compareTo(b['distance'].toDouble()));
      } else if (sortBy == 'rating') {
        filteredData.sort(
            (a, b) => b['rating'].toDouble().compareTo(a['rating'].toDouble()));
      } else if (sortBy == 'relevance') {
        filteredData.sort((a, b) =>
            b['relevance'].toDouble().compareTo(a['relevance'].toDouble()));
      }
    });
  }

  @override
  void initState() {
    super.initState();
    filterData("", sorting);
  }

  @override
  Widget build(BuildContext context) {
    double height = (MediaQuery.of(context).size.height -
            MediaQuery.of(context).padding.top) /
        900;
    double width = MediaQuery.of(context).size.width / 390;

    return Scaffold(
      backgroundColor: kWhite,
      body: Padding(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top,
        ),
        child: Column(
          children: [
            SizedBox(
              height: 24 * height,
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 26 * width,
                right: 26 * width,
              ),
              child: Row(
                children: [
                  Container(
                    height: 36 * height,
                    width: 36 * height,
                    decoration: BoxDecoration(
                      color: kPurple,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: 5 * width,
                        ),
                        child: Icon(
                          Icons.arrow_back_ios,
                          size: 12,
                          color: kWhite,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 26 * width,
                  ),
                  Text(
                    "For JEE-Mains",
                    style: GoogleFonts.lato(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: kBlack,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 21 * height,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 26 * width),
              child: TextField(
                controller: _controller,
                onChanged: (query) {
                  filterData(query, sorting);
                },
                decoration: InputDecoration(
                  suffixIcon: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Icon(
                        Icons.search,
                      ),
                      SizedBox(
                        width: 9.25 * width,
                      ),
                      Container(
                        width: 1 * width,
                        height: 28 * height,
                        decoration: BoxDecoration(
                          color: kGrey,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      SizedBox(
                        width: 9.25 * width,
                      ),
                      Icon(
                        Icons.mic_none,
                        color: kPurple,
                      ),
                      SizedBox(
                        width: 9 * width,
                      ),
                    ],
                  ),
                  labelStyle: TextStyle(color: kGrey),
                  hintText: 'Search for UPSC Coaching',
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: kGrey, width: 1.0),
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: kGrey, width: 2.0),
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 17 * height,
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 26 * width,
                right: 26 * width,
              ),
              child: Container(
                height: 30 * height,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: filtersValues.length + 2,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 4 * width,
                        ),
                        child: Container(
                          width: 74 * width,
                          height: 29 * height,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(18),
                            border: Border.all(
                              color: kPurple,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              "Filters",
                              style: GoogleFonts.lato(
                                fontSize: 14 * height,
                                fontWeight: FontWeight.w400,
                                color: kPurple,
                              ),
                            ),
                          ),
                        ),
                      );
                    }
                    if (index == 1) {
                      return Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 4 * width,
                        ),
                        child: Container(
                          // width: 150 * width,
                          height: 29 * height,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100.0),
                            border: Border.all(color: kPurple, width: 1.0),
                          ),
                          child: Padding(
                            padding:
                                EdgeInsets.symmetric(horizontal: 5 * width),
                            child: DropdownButton<String>(
                              value: sorting,
                              underline: null,
                              icon: Icon(
                                Icons.keyboard_arrow_down_rounded,
                                color: kPurple,
                              ),
                              items: <DropdownMenuItem<String>>[
                                DropdownMenuItem<String>(
                                  value: 'rating',
                                  child: Text(
                                    'Rating',
                                    style: GoogleFonts.lato(
                                      fontSize: 14 * height,
                                      color: kPurple,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                                DropdownMenuItem<String>(
                                  value: 'distance',
                                  child: Text(
                                    'Distance',
                                    style: GoogleFonts.lato(
                                      fontSize: 14 * height,
                                      color: kPurple,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                                DropdownMenuItem<String>(
                                  value: 'relevance',
                                  child: Text(
                                    'Relevance',
                                    style: GoogleFonts.lato(
                                      fontSize: 14 * height,
                                      color: kPurple,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ],
                              onChanged: (String? newValue) {
                                setState(() {
                                  sorting = newValue.toString();
                                  filterData(
                                    '',
                                    newValue.toString(),
                                  );
                                });
                              },
                            ),
                          ),
                        ),
                      );
                    }
                    return FilterTile(
                      name: filtersValues[index - 2],
                      updateState: (value, tapped) {
                        setState(() {
                          if (tapped) {
                            if (value == '<2km') {
                              km2 = true;
                            } else {
                              topicsSel.add(value);
                            }
                          } else {
                            if (value == '<2km') {
                              km2 = false;
                            } else {
                              topicsSel.remove(value);
                            }
                          }
                        });
                        filterData(_controller.text, sorting);
                      },
                    );
                  },
                ),
              ),
            ),
            SizedBox(
              height: 10 * height,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: filteredData.length,
                itemBuilder: (context, index) {
                  return DescTile(
                    image: filteredData[index]['image'].toString(),
                    name: filteredData[index]['name'],
                    rating: filteredData[index]['rating'].toString(),
                    dist: filteredData[index]['distance'].toString(),
                    topics: filteredData[index]['topics'],
                    location: filteredData[index]['location'],
                    offer: filteredData[index]['offer'].toString(),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
