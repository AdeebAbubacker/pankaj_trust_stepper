import 'package:custom_stepper/package/core/constants.dart';
import 'package:custom_stepper/package/widget/connector.dart';
import 'package:custom_stepper/package/widget/myAppbar.dart';
import 'package:custom_stepper/package/widget/statusChecker.dart';
import 'package:custom_stepper/package/widget/toggle_button.dart';
import 'package:flutter/material.dart';

class CustomStepper extends StatefulWidget {
  final List<AddStep> steps;

  /// Default page that is to be shown when the page loads.
  int currentPage;
  final EdgeInsets margin;
  final EdgeInsets padding;

  final Map<String, Map<String, double>> uiConfig;
  // final List uiConfig;

  CustomStepper(
      {Key? key,
      required this.steps,
      this.currentPage = 1,
      this.padding = const EdgeInsets.only(left: 0, right: 0),
      this.margin = const EdgeInsets.only(left: 0, right: 0),
      this.uiConfig = const {
        "head": {
          "marginLeft": 15,
          "marginRight": 49,
          "marginTop": 0,
          "marginBottom": 0,
          "paddingLeft": 0,
          "paddingRight": 0,
          "paddingTop": 0,
          "paddingBottom": 0,
        },
        "body": {
          "marginLeft": 0,
          "marginRight": 0,
          "marginTop": 0,
          "marginBottom": 0,
          "paddingLeft": 0,
          "paddingRight": 0,
          "paddingTop": 0,
          "paddingBottom": 0,
        },
      }})
      : super(key: key);

  @override
  State<CustomStepper> createState() => _CustomStepperState();
}

class _CustomStepperState extends State<CustomStepper> {
  @override
  Widget build(BuildContext context) {
    List<bool> toggleStates = [];
    double singleCtrLgt = 10;
    int pageLength = widget.steps.length;
    int pageLengthIndex = pageLength - 1;
    toggleStates =
        List.generate(pageLength, (index) => index == widget.currentPage);

    /// we generate +1 as index 0 is never used , we use only from 1
    void onToggleClicked(int page) {
      setState(() {
        widget.currentPage = page;
        for (var i = 0; i < toggleStates.length; i++) {
          toggleStates[i] = i == page;
        }
      });
    }

    void continueStep() {
      if (widget.currentPage < pageLengthIndex) {
        onToggleClicked(widget.currentPage + 1);
      }
    }

    void cancelStep() {
      if (widget.currentPage > 0) {
        onToggleClicked(widget.currentPage - 1);
      }
    }

    ///
    /// This function is used to generate Toggle Buttons & Connectors
    ///
    List<Widget> generateUI() {
      List<Widget> widgets = [];
      List myIcons = [
        const Icon(Icons.info, color: KwhiteColor),
        const Icon(Icons.family_restroom, color: KwhiteColor),
        const Icon(Icons.school_rounded, color: KwhiteColor),
        const Icon(Icons.home, color: KwhiteColor),
      ];

      for (int index = 0; index <= pageLengthIndex; index++) {
        widgets.add(
          ToggleBtn(
            onToggle: () => onToggleClicked(index),
            isActive: toggleStates[index],
            currentStep: myIcons[index],
          ),
        );

        if (index < pageLengthIndex) {
          widgets.add(Connector(
            width: singleCtrLgt,
            myColor: const Color.fromARGB(255, 99, 230, 66),
          ));
        }
      }

      return widgets;
    }

    var deviceWidth = MediaQuery.of(context).size.width;
    var devicePaddingLeft = 15;
    var devicePaddingRight = 59;
    var tgBtnTotalWidth = 36;
    var tgBtnTotalArea = tgBtnTotalWidth * pageLength;
    var ctrLgt = deviceWidth -
        devicePaddingLeft -
        devicePaddingRight -
        tgBtnTotalArea -
        19;
    singleCtrLgt = ctrLgt / pageLengthIndex;

    var uiConfig = widget.uiConfig;
    var headUi = uiConfig["head"];
    var bodyUi = uiConfig["body"];
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(56.0), // Adjust the height as needed
        child: myAppBar(),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 10),
              Container(
                width: deviceWidth * 0.96,
                height: 119,
                decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 245, 242, 242),
                    borderRadius: BorderRadius.all(Radius.circular(
                      4,
                    ))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          left: headUi!["marginLeft"] as double,
                          right: headUi["marginRight"] as double,
                          top: headUi["marginTop"] as double,
                          bottom: headUi["marginBottom"] as double),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: generateUI()),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      child: Row(children: [
                        const StatusChecker(
                            status: 'completed',
                            statusColor: statusCompletedText,
                            Step: 'Step 1',
                            title: 'Info'),
                        Spacer(),
                        const StatusChecker(
                            status: 'completed',
                            statusColor: statusCompletedText,
                            Step: 'Step 2',
                            title: 'Family'),
                        Spacer(),
                        const StatusChecker(
                            status: 'In progress',
                            statusColor: statusInprogressText,
                            Step: 'Step 3',
                            title: 'Academics'),
                        Spacer(),
                        const StatusChecker(
                            status: 'To do',
                            statusColor: statusTodoText,
                            Step: 'Step 4',
                            title: 'Home'),
                      ]),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              Column(
                children: List.generate(pageLength, (index) {
                  return Visibility(
                    visible: widget.currentPage == index,
                    child: Padding(
                      padding: widget.padding,
                      child: Container(
                        margin: widget.margin,
                        child: widget.steps[index].content,
                      ),
                    ),
                  );
                }),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      cancelStep();
                    },
                    child: const Text('Cancel'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      continueStep();
                    },
                    child: const Text('Continue'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AddStep {
  final String title;
  final Widget content;

  AddStep({
    required this.title,
    required this.content,
  });
}
