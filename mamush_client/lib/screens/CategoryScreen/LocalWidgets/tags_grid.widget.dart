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
  var listOfColors = [
    const Color(0xff000000),
    const Color(0xff000000).withOpacity(0.1),
  ];
  var listOfColorsActive = [
    const Color(0xff000123),
    const Color(0xff000456).withOpacity(0.1),
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
                      border: Border.all(
                        color: AppColors.appPrimaryColor,
                      ),
                      // boxShadow: [
                      //   BoxShadow(
                      //     color: Colors.grey.withOpacity(
                      //       0.3,
                      //     ),
                      //     blurRadius: 20,
                      //     offset: Offset(8, 12), // Shadow position
                      //   ),
                      // ],
                      color: widget.tags[index].isSelected == true
                          ? AppColors.activeTag
                          : Colors.white,
                      borderRadius: BorderRadius.circular(
                        Dimensions.xl,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        widget.tags[index].name,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: Dimensions.sxl,
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
