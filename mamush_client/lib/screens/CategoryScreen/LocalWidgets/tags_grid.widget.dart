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
                child: ElevatedButton(
                  onPressed: () {
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
                  child: Text(
                    widget.tags[index].name,
                    style: appTheme.textTheme.headline6,
                    textAlign: TextAlign.center,
                    maxLines: 3,
                    softWrap: true,
                  ),
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          Dimensions.xl,
                        ),
                      ),
                    ),
                    backgroundColor: MaterialStateProperty.all<Color>(
                      widget.tags[index].isSelected == true
                          ? AppColors.appPrimaryColor
                          : AppColors.inputColor,
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
