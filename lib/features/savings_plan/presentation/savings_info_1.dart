import 'package:flutter/material.dart';
import 'package:kwaba_test/core/constants/app_colors.dart';
import 'package:kwaba_test/core/utils.dart';
import 'package:kwaba_test/core/widgets/button.dart';
import 'package:kwaba_test/core/widgets/input_field.dart';
import 'package:kwaba_test/features/savings_plan/controller/savings_controller.dart';
import 'package:kwaba_test/features/savings_plan/presentation/savings_infor_2.dart';
import 'package:kwaba_test/features/savings_plan/presentation/widgets/top_header.dart';
import 'package:get/get.dart';

class SavingsInfo1 extends StatefulWidget {
  const SavingsInfo1({Key? key}) : super(key: key);

  @override
  State<SavingsInfo1> createState() => _SavingsInfo1State();
}

class _SavingsInfo1State extends State<SavingsInfo1> {
  final savingsController = Get.put(SavingsController());
  TextEditingController titleController = TextEditingController();
  TextEditingController noOfBuddiesController = TextEditingController();
  String? yesOrNo = "No";
  final formKey = GlobalKey<FormState>();

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
        body: Form(
          key: formKey,
          child: Container(
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
                      "Give your buddy saving a title",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 14),
                    ),
                    SizedBox(height: 5),
                    InputField(
                        hintText: 'Give your buddy saving a title',
                        errorMessage: "Field Cannot be Empty",
                        controller: titleController),
                    SizedBox(height: 20),
                    Text(
                      "How many buddies will be saving with?",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 14),
                    ),
                    SizedBox(height: 5),
                    InputField(
                        hintText: 'How many buddies will be saving with?',
                        errorMessage: "Field Cannot be Empty",
                        keyboardType: TextInputType.number,
                        controller: noOfBuddiesController),
                    SizedBox(height: 20),
                    Text(
                      "Do you and your buddies have a target",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 14),
                    ),
                    RadioListTile(
                      title: Text("Yes"),
                      contentPadding: EdgeInsets.zero,
                      dense: true,
                      value: "Yes",
                      groupValue: yesOrNo,
                      onChanged: (value) {
                        setState(() {
                          yesOrNo = value.toString();
                        });
                      },
                    ),
                    RadioListTile(
                      title: Text("No"),
                      contentPadding: EdgeInsets.zero,
                      dense: true,
                      value: "No",
                      groupValue: yesOrNo,
                      onChanged: (value) {
                        setState(() {
                          yesOrNo = value.toString();
                        });
                      },
                    ),
                    SizedBox(height: 40),
                    // Expanded(child: Container()),
                    Button(
                      buttonText: 'Next',
                      textColor: Colors.white,
                      buttonColor: primaryColor,
                      borderRadius: 5,
                      onPressed: () {
                        if (noOfBuddiesController.text.isNotEmpty &&
                            titleController.text.isNotEmpty) {
                          savingsController.buddySavingTitle.value =
                              titleController.text.trim();
                          savingsController.noOfBuddiesSaving.value =
                              noOfBuddiesController.text.trim();
                          savingsController.buddiesHaveTargetYesNo.value =
                              yesOrNo!;
                          Get.to(() => SavingsInfo2());
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
          ),
        ));
  }
}
