import 'package:flutter/material.dart';
import 'package:momrecipes/model/recipe/recipe.response.dart';
import 'package:momrecipes/theme/theme.dart';
import 'package:momrecipes/utils/dimensions.dart';

class TagsGridWidget extends StatefulWidget {
  final List<Tags> tags;
  final Function onPress;
  const TagsGridWidget({
    required this.tags,
    required this.onPress,
  });

  @override
  _TagsGridWidgetState createState() => _TagsGridWidgetState();
}

class _TagsGridWidgetState extends State<TagsGridWidget> {
  final activeColors = [
    const Color(0xff00B460),
    const Color(0xff00D38C),
  ];
  final unActiveColors = [
    Colors.white,
    Colors.white,
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        padding: EdgeInsets.symmetric(
          horizontal: Dimensions.md,
        ),
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: widget.tags.length,
        itemBuilder: (BuildContext context, int index) => Container(
          child: Column(
            children: <Widget>[
              Container(
                width: 200,
                height: 75,
                margin: EdgeInsets.symmetric(
                  horizontal: Dimensions.md,
                ),
                child: InkWell(
                  onTap: () {
                    widget.onPress(widget.tags[index].id);
                    widget.tags[index].isSelected =
                        widget.tags[index].isSelected == true ? false : true;
                    widget.onPress(
                      widget.tags[index].name,
                      widget.tags[index].id,
                    );
                    setState(
                      () {},
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xff0DC93133),
                          blurRadius: 12,
                          spreadRadius: 0,
                          offset: Offset(
                            0,
                            7,
                          ), // Shadow position
                        ),
                      ],
                      gradient: new LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: widget.tags[index].isSelected == true
                            ? activeColors
                            : unActiveColors,
                      ),
                      borderRadius: BorderRadius.circular(
                        Dimensions.xl,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        widget.tags[index].name,
                        style: TextStyle(
                          color: widget.tags[index].isSelected == true
                              ? Colors.white
                              : Color(0xff828282),
                          fontSize: Dimensions.xxl,
                        ),
                        textAlign: TextAlign.center,
                        maxLines: 3,
                        softWrap: true,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
