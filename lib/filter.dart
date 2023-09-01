import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ostello_app/color.dart';

class FilterTile extends StatefulWidget {
  const FilterTile({super.key, required this.name, required this.updateState});
  final String name;
  final Function(String value, bool tapped) updateState;

  @override
  State<FilterTile> createState() => _FilterTileState();
}

class _FilterTileState extends State<FilterTile> {
  bool tapped = false;
  @override
  Widget build(BuildContext context) {
    double height = (MediaQuery.of(context).size.height -
            MediaQuery.of(context).padding.top) /
        900;
    double width = MediaQuery.of(context).size.width / 390;
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 4 * width,
          ),
          child: GestureDetector(
            onTap: () {
              setState(() {
                tapped = !tapped;
              });
              widget.updateState(widget.name, tapped);
            },
            child: Container(
              width: 74 * width,
              height: 29 * height,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                border: Border.all(
                  color: kPurple,
                ),
                color: tapped ? kPurple : kWhite,
              ),
              child: Center(
                child: Text(
                  widget.name[0].toUpperCase()+widget.name.substring(1),
                  style: GoogleFonts.lato(
                    fontSize: 14 * height,
                    fontWeight: FontWeight.w400,
                    color: tapped ? kWhite : kPurple,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
