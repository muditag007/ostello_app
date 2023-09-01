// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ostello_app/color.dart';

class DescTile extends StatelessWidget {
  final String name;
  final String rating;
  final String dist;
  final List topics;
  final String location;
  final String offer;
  final String image;
  const DescTile({
    super.key,
    required this.name,
    required this.rating,
    required this.dist,
    required this.topics,
    required this.location,
    required this.offer,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    double height = (MediaQuery.of(context).size.height -
            MediaQuery.of(context).padding.top) /
        800;
    double width = MediaQuery.of(context).size.width / 390;
    int currentLen1 = 0;
    int currentLen2 = 0;
    List<Widget> row1 = [];
    List<Widget> row2 = [];
    for (String topic in topics) {
      if (currentLen1 + topic.length <= 15 && row1.length != 2) {
        row1.add(
          Padding(
            padding: EdgeInsets.only(right: 5 * width),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5 * height),
                border: Border.all(
                  color: kPurple.withOpacity(0.47),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 10 * width,
                  vertical: 5 * height,
                ),
                child: Center(
                  child: Text(
                    topic.toUpperCase(),
                    style: GoogleFonts.lato(
                      fontSize: 10 * height,
                      color: kPurple,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
        currentLen1 = currentLen1 + topic.length;
      } else if (currentLen2 + topic.length <= 15 && row2.length != 2) {
        row2.add(
          Padding(
            padding: EdgeInsets.only(right: 5 * width),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5 * height),
                border: Border.all(
                  color: kPurple.withOpacity(0.47),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 10 * width,
                  vertical: 5 * height,
                ),
                child: Center(
                  child: Text(
                    topic.toUpperCase(),
                    style: GoogleFonts.lato(
                      fontSize: 10 * height,
                      color: kPurple,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
        currentLen2 = currentLen2 + topic.length;
      } else {
        break;
      }
    }

    return Padding(
      padding: EdgeInsets.only(
        bottom: 21 * height,
        left: 26 * width,
        right: 26 * width,
      ),
      child: Container(
        height: 175 * height,
        width: 338 * width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Color.fromRGBO(246, 239, 254, 1),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 0),
              color: kBlack.withOpacity(0.25),
              blurRadius: 4,
              spreadRadius: 0,
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 12 * width,
            vertical: 12 * height,
          ),
          child: Row(
            children: [
              Expanded(
                child: Stack(
                  children: [
                    Container(
                      width: 157 * width,
                      height: 149 * height,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: NetworkImage(
                            // "https://www.simplilearn.com/ice9/free_resources_article_thumb/what_is_image_Processing.jpg",
                            image,
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                      width: 157 * width,
                      height: 149 * height,
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 5 * height),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.location_on,
                              color: kWhite,
                              size: 10 * height,
                            ),
                            Text(
                              "  $location",
                              style: GoogleFonts.lato(
                                fontSize: 10 * height,
                                fontWeight: FontWeight.w600,
                                color: kWhite,
                              ),
                            ),
                          ],
                        ),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Color(0x00ffffff), Color(0xe57d23e0)],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 12 * width,
              ),
              Expanded(
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        name,
                        maxLines: 2,
                        style: GoogleFonts.lato(
                          fontSize: 16 * height,
                          height: 1,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5 * height,
                    ),
                    Row(
                      children: [
                        Container(
                          height: 14 * height,
                          width: 14 * width,
                          decoration: BoxDecoration(
                            color: kGreen,
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: Center(
                            child: Icon(
                              Icons.star,
                              color: kWhite,
                              size: 10 * height,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 3 * width,
                        ),
                        Text(
                          rating,
                          style: GoogleFonts.lato(
                            fontSize: 12 * height,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(
                          width: 5 * width,
                        ),
                        Text(
                          "•",
                          style: GoogleFonts.lato(
                            fontSize: 12 * height,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(
                          width: 6 * width,
                        ),
                        Text(
                          "$dist kms away",
                          style: GoogleFonts.lato(
                            fontSize: 12 * height,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10 * height,
                    ),
                    Row(
                      children: row1,
                    ),
                    SizedBox(
                      height: 10 * width,
                    ),
                    Row(
                      children: row2,
                    ),
                    SizedBox(
                      height: 9 * height,
                    ),
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: kPurple,
                            borderRadius: BorderRadius.circular(5 * height),
                            border: Border.all(
                              color: kPurple.withOpacity(0.47),
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 10 * width,
                              vertical: 5 * height,
                            ),
                            child: Center(
                              child: Text(
                                "$offer% OFF",
                                style: GoogleFonts.lato(
                                  fontSize: 10 * height,
                                  color: kWhite,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
