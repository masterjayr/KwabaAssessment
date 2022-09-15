import 'package:flutter/material.dart';
import 'package:kwaba_test/core/constants/app_colors.dart';
import 'package:kwaba_test/core/utils.dart';
import 'package:kwaba_test/core/widgets/button.dart';
import 'package:kwaba_test/features/savings_plan/controller/savings_controller.dart';
import 'package:kwaba_test/features/savings_plan/data/savings_model.dart';
import 'package:kwaba_test/features/savings_plan/presentation/add_buddy.dart';
import 'package:kwaba_test/features/savings_plan/presentation/widgets/top_header.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';

class SavingsInfo4 extends StatefulWidget {
  const SavingsInfo4({Key? key}) : super(key: key);

  @override
  State<SavingsInfo4> createState() => _SavingsInfo4State();
}

class _SavingsInfo4State extends State<SavingsInfo4> {
  SavingsController savingsController = Get.find();
  TextEditingController noIn12MonthsController = TextEditingController();
  int? selected;
  String? startDateValue;
  String? endDateValue;
  String? howLong;
  String? selectedRelationship = "Select Option";

  selectDate(BuildContext context, String whichValue) {
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
          if (whichValue == 'startDateValue') {
            startDateValue = df.format(selectedDate);
          } else {
            endDateValue = df.format(selectedDate);
          }
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
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
                    "What is your saving frequency?",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 14),
                  ),
                  RadioListTile(
                    title: Text("3 Months"),
                    contentPadding: EdgeInsets.zero,
                    dense: true,
                    value: "3 Months",
                    groupValue: howLong,
                    onChanged: (value) {
                      setState(() {
                        howLong = value.toString();
                      });
                    },
                  ),
                  RadioListTile(
                    title: Text("6 Weeks"),
                    contentPadding: EdgeInsets.zero,
                    dense: true,
                    value: "6 Weeks",
                    groupValue: howLong,
                    onChanged: (value) {
                      setState(() {
                        howLong = value.toString();
                      });
                    },
                  ),
                  RadioListTile(
                    title: Text("1 Year"),
                    contentPadding: EdgeInsets.zero,
                    dense: true,
                    value: "1 Year",
                    groupValue: howLong,
                    onChanged: (value) {
                      setState(() {
                        howLong = value.toString();
                      });
                    },
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Start Date",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 14),
                          ),
                          SizedBox(height: 5),
                          InkWell(
                            onTap: () {
                              selectDate(context, "startDateValue");
                            },
                            child: Container(
                                height: size.height / 20,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(5),
                                  border:
                                      Border.all(color: Colors.grey, width: 1),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                          startDateValue == null
                                              ? "08/12/2022 "
                                              : startDateValue!,
                                          style: TextStyle(
                                              color: startDateValue == null
                                                  ? Colors.grey[300]
                                                  : Colors.black,
                                              fontSize: 12)),
                                      Icon(Icons.calendar_month,
                                          color: primaryColor, size: 20)
                                    ],
                                  ),
                                )),
                          ),
                        ],
                      ),
                      SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "End Date",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 14),
                          ),
                          SizedBox(height: 5),
                          InkWell(
                            onTap: () {
                              selectDate(context, "endDateValue");
                            },
                            child: Container(
                                height: size.height / 20,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(5),
                                  border:
                                      Border.all(color: Colors.grey, width: 1),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                          endDateValue == null
                                              ? "08/12/2022 "
                                              : endDateValue!,
                                          style: TextStyle(
                                              color: endDateValue == null
                                                  ? Colors.grey[300]
                                                  : Colors.black,
                                              fontSize: 12)),
                                      Icon(Icons.calendar_month,
                                          color: primaryColor, size: 18)
                                    ],
                                  ),
                                )),
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Relationship with buddies",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 14),
                  ),
                  SizedBox(height: 5),
                  Container(
                    width: height / 2,
                    height: height * 0.07,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Colors.grey, width: 1),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        // borderRadius: BorderRadius.circular(25),
                        value: selectedRelationship,
                        hint: Text("Select Option",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 13,
                            )),
                        items: <String>[
                          'Select Option',
                          'Brother',
                          'Sister',
                          'Father',
                          'Mother',
                          'Cousin',
                          'Others'
                        ].map((String item) {
                          return DropdownMenuItem<String>(
                            value: item,
                            child: Text(
                              item,
                              style: const TextStyle(
                                  fontSize: 15, color: Colors.grey),
                            ),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedRelationship = value!;
                          });
                        },
                      ),
                    ),
                  ),

                  SizedBox(height: 60),
                  // Expanded(child: Container()),
                  Button(
                    buttonText: 'Next',
                    textColor: Colors.white,
                    buttonColor: primaryColor,
                    borderRadius: 5,
                    onPressed: () {
                      if (howLong != null &&
                          startDateValue != null &&
                          endDateValue != null &&
                          selectedRelationship != 'Select Option' &&
                          selectedRelationship != null) {
                        savingsController.howLongToSaveWithBuddies.value =
                            howLong!;
                        savingsController.startDate.value = startDateValue!;
                        savingsController.endDate.value = endDateValue!;
                        savingsController.relationshipWithBuddies.value =
                            selectedRelationship!;

                        var newBuddyInfo = SavingsModel(
                          buddySavingTitle:
                              savingsController.buddySavingTitle.value,
                          noOfBuddiesSaving:
                              savingsController.noOfBuddiesSaving.value,
                          buddiesHaveTargetYesNo:
                              savingsController.buddiesHaveTargetYesNo.value,
                          howDoYouWantToSave:
                              savingsController.howDoYouWantToSave.value,
                          savingFrequency:
                              savingsController.savingFrequency.value,
                          whenToStartSaving:
                              savingsController.whenToStartSaving.value,
                          howMuchToSaveIn12Months:
                              savingsController.howMuchToSaveIn12Months.value,
                          whenToStartSaving2:
                              savingsController.whenToStartSaving2.value,
                          howLongToSaveWithBuddies:
                              savingsController.howLongToSaveWithBuddies.value,
                          startDate: savingsController.startDate.value,
                          endDate: savingsController.endDate.value,
                          relationshipWithBuddies:
                              savingsController.relationshipWithBuddies.value,
                        );
                        savingsController.savingsBuddiesList.add(newBuddyInfo);
                        Get.to(() => AddBuddy());
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
}
