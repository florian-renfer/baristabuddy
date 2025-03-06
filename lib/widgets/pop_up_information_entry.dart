import 'package:baristabuddy/models/informational_content.dart';
import 'package:flutter/cupertino.dart';

// This class represents the contents of a informational pop up.
class PopUpInformationEntry extends StatelessWidget {
  final InformationalContent informationalContent;

  const PopUpInformationEntry({super.key, required this.informationalContent});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: CupertinoColors.secondarySystemBackground,
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                informationalContent.title,
                style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          Expanded(
            flex: 1,
            child: Container(
              width: double.infinity,
              margin: EdgeInsets.only(top: 16),
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: CupertinoColors.systemBackground,
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
              child: Text(informationalContent.description),
            ),
          ),
        ],
      ),
    );
  }
}
