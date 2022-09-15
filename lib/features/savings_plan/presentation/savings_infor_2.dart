import 'package:flutter/material.dart';
import 'package:kwaba_test/core/constants/app_colors.dart';
import 'package:kwaba_test/core/utils.dart';
import 'package:kwaba_test/core/widgets/button.dart';
import 'package:kwaba_test/features/savings_plan/controller/savings_controller.dart';
import 'package:kwaba_test/features/savings_plan/presentation/savings_info_3.dart';
import 'package:kwaba_test/features/savings_plan/presentation/widgets/top_header.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';

class SavingsInfo2 extends StatefulWidget {
  const SavingsInfo2({Key? key}) : super(key: key);

  @override
  State<SavingsInfo2> createState() => _SavingsInfo2State();
}

class _SavingsInfo2State extends State<SavingsInfo2> {
  SavingsController savingsController = Get.find();
  String? frequency;
  int? selected;
  String? dateValue;

  selectDate(BuildContext context) {
    return showDatePicker(
        context: context,
        initialDate: DateTime(2015, 1),
        firstDate: DateTime(1900, 1),
        lastDate: DateTime(2030, 1),
        builder: (BuildContext context, Widget? picker) {
          return Theme(
            data: ThemeData.dark().copyWith(
              colorScheme: ColorScheme.dark(
                primary: primaryColor,
                onPrimary: Colors.white,
                surface: primaryColor,
                onSurface: Colors.black,
              ),
              dialogBackgroundColor: Colors.white,
            ),
            child: picker!,
          );
        }).then((selectedDate) {
      if (selectedDate != null) {
        var df = DateFormat("yyyy/MM/dd");
        setState(() {
          dateValue = df.format(selectedDate);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
            title: Text("Buddy Savings",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold)),
            centerTitle: true,
            elevation: 0.0,
            leading: InkWell(
                onTap: () => Get.back(),
                child:
                    Icon(Icons.arrow_back_ios, color: Colors.black, size: 20)),
            backgroundColor: backgroundColor),
        body: Container(
          height: size.height,
          decoration: BoxDecoration(),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TopHeader(),
                  SizedBox(height: 20),
                  Text(
                    "How do you want to save? ",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 14),
                  ),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      Expanded(
                          child: InkWell(
                              onTap: () {
                                setState(() {
                                  selected = 0;
                                });
                              },
                              child: wantToSaveContainer(0))),
                      SizedBox(width: 10),
                      Expanded(
                          child: InkWell(
                              onTap: () {
                                setState(() {
                                  selected = 1;
                                });
                              },
                              child: wantToSaveContainer(1))),
                    ],
                  ),

                  SizedBox(height: 20),
                  Text(
                    "What is your saving frequency?",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 14),
                  ),
                  RadioListTile(
                    title: Text("Daily"),
                    contentPadding: EdgeInsets.zero,
                    dense: true,
                    value: "Daily",
                    groupValue: frequency,
                    onChanged: (value) {
                      setState(() {
                        frequency = value.toString();
                      });
                    },
                  ),
                  RadioListTile(
                    title: Text("Weekly"),
                    contentPadding: EdgeInsets.zero,
                    dense: true,
                    value: "Weekly",
                    groupValue: frequency,
                    onChanged: (value) {
                      setState(() {
                        frequency = value.toString();
                      });
                    },
                  ),
                  RadioListTile(
                    title: Text("Monthly"),
                    contentPadding: EdgeInsets.zero,
                    dense: true,
                    value: "Monthly",
                    groupValue: frequency,
                    onChanged: (value) {
                      setState(() {
                        frequency = value.toString();
                      });
                    },
                  ),
                  SizedBox(height: 20),
                  Text(
                    "When do you want to start saving?",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 14),
                  ),
                  SizedBox(height: 5),
                  InkWell(
                    onTap: () {
                      selectDate(context);
                    },
                    child: Container(
                        height: size.height / 15,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: Colors.grey, width: 1),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                  dateValue == null ? "08/12/2022" : dateValue!,
                                  style: TextStyle(
                                      color: dateValue == null
                                          ? Colors.grey[300]
                                          : Colors.black,
                                      fontSize: 12)),
                              Icon(Icons.calendar_month, color: Colors.grey)
                            ],
                          ),
                        )),
                  ),
                  SizedBox(height: 40),
                  // Expanded(child: Container()),
                  Button(
                    buttonText: 'Next',
                    textColor: Colors.white,
                    buttonColor: primaryColor,
                    borderRadius: 5,
                    onPressed: () {
                      if (frequency != null &&
                          dateValue != null &&
                          selected != null) {
                        savingsController.howDoYouWantToSave.value =
                            "Automatic";
                        savingsController.savingFrequency.value = frequency!;
                        savingsController.whenToStartSaving.value = dateValue!;
                        Get.to(() => SavingsInfo3());
                      } else {
                        showGetSnackBar(
                            title: "Error", message: "Enter All Fields");
                      }
                    },
                  ),
                  // Expanded(child: Container()),
                ],
              ),
            ),
          ),
        ));
  }

  Widget wantToSaveContainer(int value) {
    return Container(
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
            color: selected == value ? primaryColor : Colors.grey,
            width: selected == value ? 2 : 1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text("Automatic",
              style: TextStyle(
                  color: Colors.black54,
                  fontWeight: FontWeight.bold,
                  fontSize: 14)),
          SizedBox(height: 2),
          Text("I will like to be\ndebited automatically",
              style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.w200,
                  fontSize: 10))
        ],
      ),
    );
  }
}
