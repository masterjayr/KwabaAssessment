import 'package:flutter/material.dart';
import 'package:kwaba_test/core/constants/app_colors.dart';
import 'package:kwaba_test/features/savings_plan/controller/savings_controller.dart';
import 'package:kwaba_test/features/savings_plan/presentation/savings_info_1.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:get/get.dart';

class AddBuddy extends StatefulWidget {
  const AddBuddy({Key? key}) : super(key: key);

  @override
  State<AddBuddy> createState() => _AddBuddyState();
}

class _AddBuddyState extends State<AddBuddy> {
  SavingsController savingsController = Get.find();
  bool isSwitched = false;
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
              child: Icon(Icons.arrow_back_ios, color: Colors.black, size: 20)),
          backgroundColor: backgroundColor),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Invite your buddy",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
            SizedBox(height: 10),
            Text(
              "An invite will be sent to any  of your buddy\nadd to this saving plan",
              style: TextStyle(
                  color: Colors.black26,
                  fontWeight: FontWeight.w300,
                  fontSize: 14),
            ),
            SizedBox(height: 10),
            Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(25)),
                child: Column(
                  children: [
                    Text("Target Amount",
                        style: TextStyle(color: Colors.white54, fontSize: 10)),
                    SizedBox(height: 10),
                    Text("₦${savingsController.howMuchToSaveIn12Months}",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold)),
                    Container(
                        width: size.width / 1.5,
                        decoration: BoxDecoration(
                          color: Colors.purple[900],
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Text("  You are saving with",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold)),
                                SizedBox(width: 2),
                                Text(
                                    "${savingsController.savingsBuddiesList.length} buddies",
                                    style: TextStyle(
                                        color: primaryColor,
                                        fontWeight: FontWeight.bold)),
                              ],
                            ))),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Your Target",
                                  style: TextStyle(
                                      color: Colors.white54,
                                      fontWeight: FontWeight.w300)),
                              SizedBox(width: 2),
                              Text(
                                  "₦${savingsController.howMuchToSaveIn12Months}",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14)),
                            ]),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text("Other buddies target",
                                  style: TextStyle(
                                      color: Colors.white54,
                                      fontWeight: FontWeight.w300)),
                              SizedBox(width: 2),
                              Text("₦625, 000",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14)),
                            ]),
                      ],
                    ),
                    SizedBox(height: 10),
                    LinearPercentIndicator(
                        width: size.width / 1.2,
                        lineHeight: 7.0,
                        percent: 0.5,
                        barRadius: Radius.circular(10),
                        backgroundColor: Colors.white,
                        progressColor: Colors.purple[900]),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Frequency",
                                  style: TextStyle(
                                      color: Colors.white54,
                                      fontWeight: FontWeight.w300)),
                              SizedBox(width: 2),
                              Text("${savingsController.savingFrequency}",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14)),
                            ]),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Start Date",
                                  style: TextStyle(
                                      color: Colors.white54,
                                      fontWeight: FontWeight.w300)),
                              SizedBox(width: 2),
                              Text("${savingsController.startDate}",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14)),
                            ]),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text("Interest",
                                  style: TextStyle(
                                      color: Colors.white54,
                                      fontWeight: FontWeight.w300)),
                              SizedBox(width: 2),
                              Text("2.5% P.A",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14)),
                            ]),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("End Date",
                                  style: TextStyle(
                                      color: Colors.white54,
                                      fontWeight: FontWeight.w300)),
                              SizedBox(width: 2),
                              Text("${savingsController.endDate}",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14)),
                            ]),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("Lock\nsaving?",
                            style: TextStyle(
                                color: Colors.white54,
                                fontWeight: FontWeight.w300)),
                        Switch(
                          value: isSwitched,
                          onChanged: (value) {
                            setState(() {
                              isSwitched = value;
                            });
                          },
                          activeTrackColor: Colors.purple,
                          activeColor: Colors.purple[900],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                        width: size.width / 1.5,
                        decoration: BoxDecoration(
                          color: Colors.purple[900],
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                              "  You can't withdraw your savings till you set maturity   date",
                              style: TextStyle(
                                  color: Colors.yellow[800],
                                  fontSize: 9,
                                  fontWeight: FontWeight.w100)),
                        )),
                  ],
                )),
            SizedBox(
              height: 20,
            ),
            Center(
              child: TextButton(
                  onPressed: () {
                    Get.offAll(() => SavingsInfo1());
                  },
                  child: Text(
                    "+ Add a buddy",
                    style: TextStyle(
                        color: primaryColor,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
