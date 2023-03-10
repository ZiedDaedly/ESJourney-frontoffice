import 'package:esjourney/presentation/screens/curriculum/games/slide/consts/Colors/colors.dart';
import 'package:esjourney/presentation/screens/curriculum/games/slide/consts/Textstyles/text_styles.dart';
import 'package:esjourney/presentation/screens/curriculum/games/slide/enums/stage.dart';
import 'package:esjourney/presentation/screens/curriculum/games/slide/services/dialogs.dart';
import 'package:esjourney/presentation/screens/curriculum/games/slide/tools/board_controller.dart';
import 'package:esjourney/presentation/screens/curriculum/games/slide/tools/navigation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class PuzzleTypeButton extends StatefulWidget {
  final Stage stage;
  const PuzzleTypeButton({
    Key? key,
    required this.stage,
  }) : super(key: key);

  @override
  _PuzzleTypeButtonState createState() => _PuzzleTypeButtonState();
}

class _PuzzleTypeButtonState extends State<PuzzleTypeButton> {
  void onPressed(var value) {}

  @override
  Widget build(BuildContext context) {
    return Consumer<Navigation>(builder: (context, value, child) {
      return TextButton(
          onPressed: () {
            if (!Provider.of<BoardController>(context, listen: false).busy &&
                widget.stage != value.game) {
              if (Provider.of<BoardController>(context, listen: false)
                  .shouldShowResetDialog) {
                PuzzleDialog().gameRest(
                    context: context,
                    confirm: () {
                      if (widget.stage == Stage.Advanced) {
                        value.switchStage(Stage.Advanced, () {
                          Provider.of<BoardController>(context, listen: false)
                              .changeBoardToImage();
                          Provider.of<BoardController>(context, listen: false)
                              .resetGame();
                        });
                      } else {
                        value.switchStage(widget.stage, () {
                          Provider.of<BoardController>(context, listen: false)
                              .changeImageToBoard();
                        });
                      }
                    });
              } else {
                if (widget.stage == Stage.Advanced) {
                  value.switchStage(Stage.Advanced, () {
                    Provider.of<BoardController>(context, listen: false)
                        .changeBoardToImage();
                    Provider.of<BoardController>(context, listen: false)
                        .resetGame();
                  });
                } else {
                  value.switchStage(widget.stage, () {
                    Provider.of<BoardController>(context, listen: false)
                        .changeImageToBoard();
                  });
                }
              }
            }
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.stage.name,
                style: value.game == widget.stage
                    ? SlideTextStyle.appbarEnabled
                    : SlideTextStyle.appbarDisabled,
              ),
              AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                height: 5,
                decoration: BoxDecoration(
                    color: SlideColors.primary1,
                    borderRadius: BorderRadius.circular(15)),
                width: value.game == widget.stage
                    ? MediaQuery.of(context).size.width * 0.05
                    : 0,
              )
            ],
          ));
    });
  }
}
