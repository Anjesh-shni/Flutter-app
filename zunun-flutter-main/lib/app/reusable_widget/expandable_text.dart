import 'package:flutter/material.dart';
import '../widgets/small_text.dart';

class ExpandbleText extends StatefulWidget {
  final String text;
  const ExpandbleText({Key? key, required this.text}) : super(key: key);

  @override
  _ExpandbleTextState createState() => _ExpandbleTextState();
}

class _ExpandbleTextState extends State<ExpandbleText> {
  late String firstHalf;
  late String secondHalf;

  bool hiddenText = true;
  double textHeight = 50;

  @override
  void initState() {
    super.initState();
    if (widget.text.length > textHeight) {
      firstHalf = widget.text.substring(0, textHeight.toInt());
      secondHalf =
          widget.text.substring(textHeight.toInt() + 1, widget.text.length);
    } else {
      firstHalf = widget.text;
      secondHalf = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: secondHalf.isEmpty
          ? SmallTxt(
              text: firstHalf,
              size: 16,
              color: Colors.black,
            )
          : Column(
              children: [
                SmallTxt(
                  height:0.5,
                  text: hiddenText
                      ? (firstHalf + "...")
                      : (firstHalf + secondHalf),
                  size: 16,
                  color: Colors.black,
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      hiddenText = !hiddenText;
                    });
                  },
                  child: Row(
                    children: [
                      SmallTxt(
                        text: hiddenText ? "Show More" : "Show less",
                        color: Colors.blue,
                      ),
                      Icon(
                        hiddenText
                            ? Icons.arrow_drop_down
                            : Icons.arrow_drop_up,
                        color: Colors.blue,
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
