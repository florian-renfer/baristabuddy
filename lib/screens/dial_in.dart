import 'package:baristabuddy/models/informational_content.dart';
import 'package:baristabuddy/widgets/pop_up_information_entry.dart';
import 'package:flutter/cupertino.dart';

class DialIn extends StatefulWidget {
  const DialIn({super.key});

  @override
  State<DialIn> createState() => _DialInState();
}

// This widget displays stored recipes as a list.
class _DialInState extends State<DialIn> {
  final bool _shouldPaintSurface = false;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.systemGroupedBackground,
      navigationBar: CupertinoNavigationBar(
        middle: const Text('Dial in'),
        backgroundColor: CupertinoColors.systemGroupedBackground,
      ),
      child: SafeArea(
        child: Container(
          color: CupertinoColors.systemGroupedBackground,
          child: CustomScrollView(
            slivers: <Widget>[
              SliverList(
                delegate: SliverChildListDelegate(<Widget>[
                  CupertinoListSection.insetGrouped(
                    footer: Text(
                      'This page provides useful information and resources to efficiently dial in your coffee machine. For now, this app doesn\'t contain any functionality and serves the purpose of playtesting the user interface.',
                      style: CupertinoTheme.of(
                        context,
                      ).textTheme.textStyle.copyWith(
                        fontSize: 12.0,
                        color: CupertinoColors.systemGrey,
                      ),
                    ),
                    children: [
                      for (var informationalContent in informationalContents)
                        CupertinoListTile(
                          title: Text(informationalContent.title),
                          trailing: CupertinoListTileChevron(),
                          onTap:
                              () => _showPopupSurface(
                                context: context,
                                child: PopUpInformationEntry(
                                  informationalContent: informationalContent,
                                ),
                              ),
                        ),
                    ],
                  ),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showPopupSurface({
    required BuildContext context,
    required Widget child,
  }) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) {
        return CupertinoPopupSurface(
          isSurfacePainted: _shouldPaintSurface,
          child: FractionallySizedBox(
            heightFactor: .9,
            child: Container(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      decoration:
                          _shouldPaintSurface
                              ? null
                              : BoxDecoration(
                                color:
                                    CupertinoTheme.of(
                                      context,
                                    ).scaffoldBackgroundColor,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                      child: child,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  SizedBox(
                    width: double.infinity,
                    child: CupertinoButton(
                      color:
                          _shouldPaintSurface
                              ? null
                              : CupertinoTheme.of(
                                context,
                              ).scaffoldBackgroundColor,
                      onPressed: () => Navigator.pop(context),
                      child: const Text(
                        'Close',
                        style: TextStyle(color: CupertinoColors.systemBlue),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
