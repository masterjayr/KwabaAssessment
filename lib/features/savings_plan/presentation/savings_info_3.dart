import 'package:flutter/material.dart';
import 'package:kwaba_test/core/constants/app_colors.dart';
import 'package:kwaba_test/core/utils.dart';
import 'package:kwaba_test/core/widgets/button.dart';
import 'package:kwaba_test/core/widgets/input_field.dart';
import 'package:kwaba_test/features/savings_plan/controller/savings_controller.dart';
import 'package:kwaba_test/features/savings_plan/presentation/savings_info_4.dart';
import 'package:kwaba_test/features/savings_plan/presentation/widgets/top_header.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class SavingsInfo3 extends StatefulWidget {
  const SavingsInfo3({Key? key}) : super(key: key);

  @override
  State<SavingsInfo3> createState() => _SavingsInfo3State();
}

class _SavingsInfo3State extends State<SavingsInfo3> {
  SavingsController savingsController = Get.find();
  TextEditingController noIn12MonthsController = TextEditingController();
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
                    "How much do you want to save in 12 months?",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 14),
                  ),
                  SizedBox(height: 5),
                  InputField(
                      hintText: '',
                      errorMessage: "Field Cannot be Empty",
                      prefixText: "₦  ",
                      keyboardType: TextInputType.number,
                      controller: noIn12MonthsController),
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

                  SizedBox(height: 60),
                  // Expanded(child: Container()),
                  Button(
                    buttonText: 'Next',
                    textColor: Colors.white,
                    buttonColor: primaryColor,
                    borderRadius: 5,
                    onPressed: () {
                      if (noIn12MonthsController.text.isNotEmpty &&
                          dateValue != null) {
                        savingsController.howMuchToSaveIn12Months.value =
                            noIn12MonthsController.text.trim();
                        savingsController.whenToStartSaving2.value = dateValue!;
                        Get.to(() => SavingsInfo4());
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
