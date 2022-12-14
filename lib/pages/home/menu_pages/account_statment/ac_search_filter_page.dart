import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:intl/intl.dart';
import 'package:safqa/controllers/signup_controller.dart';
import 'package:safqa/pages/create_invoice/customer_info_page.dart';
import 'package:sizer/sizer.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:textfield_datepicker/textfield_datepicker.dart';

class AccountStatmentSearchFilterPage extends StatefulWidget {
  const AccountStatmentSearchFilterPage({super.key});

  @override
  State<AccountStatmentSearchFilterPage> createState() =>
      AccountStatmenttSearchFilterPageState();
}

class AccountStatmenttSearchFilterPageState
    extends State<AccountStatmentSearchFilterPage> {
  SignUpController _signUpController = Get.find();
  int entryMethod = 0;
  int price = 0;
  int dateCreated = 0;
  SfRangeValues _values = SfRangeValues(0, 100);
  double sMin = 0;
  double sMax = 100;
  double sInterval = 20;
  TextEditingController maxController = TextEditingController();
  TextEditingController minController = TextEditingController();
  TextEditingController fixedDateController = TextEditingController();
  TextEditingController startDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: Color(0xffFBFBFB),
        elevation: 0,
      ),
      backgroundColor: Color(0xffFBFBFB),
      body: ExpandableNotifier(
        child: ListView(
          primary: false,
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: Icon(
                    Icons.close,
                    size: 25.0.sp,
                  ),
                ),
                Text(
                  "Clear",
                  style: TextStyle(
                    fontSize: 16.0.sp,
                    color: Color(0xff00A7B3),
                    decoration: TextDecoration.underline,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            ExpandablePanel(
              controller: ExpandableController(initialExpanded: true),
              collapsed: Container(),
              theme: ExpandableThemeData(hasIcon: false),
              expanded: Container(
                margin: EdgeInsets.only(top: 10),
                child: Column(
                  children: [
                    buildRadioButton(
                        0,
                        "All",
                        entryMethod,
                        (p0) => setState(
                              () {
                                entryMethod = p0;
                              },
                            )),
                    buildRadioButton(
                        1,
                        "Debit",
                        entryMethod,
                        (p0) => setState(
                              () {
                                entryMethod = p0;
                              },
                            )),
                    buildRadioButton(
                        2,
                        "Credit",
                        entryMethod,
                        (p0) => setState(
                              () {
                                entryMethod = p0;
                              },
                            )),
                  ],
                ),
              ),
              header: Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Colors.grey, width: 0.5),
                  ),
                ),
                child:
                    blackText("Entry Method", 15, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ExpandablePanel(
              controller: ExpandableController(initialExpanded: true),
              collapsed: Container(),
              theme: ExpandableThemeData(hasIcon: false),
              expanded: Container(
                margin: EdgeInsets.only(top: 10),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          width: 0.4 * w,
                          child: TextfieldDatePicker(
                            decoration: InputDecoration(
                              hintText: 'From',
                              fillColor: Colors.white,
                              filled: true,
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide(
                                  color: Colors.grey.shade300,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide(
                                  color: Colors.grey.shade300,
                                ),
                              ),
                            ),
                            textfieldDatePickerController: startDateController,
                            materialDatePickerFirstDate: DateTime(2000),
                            materialDatePickerLastDate: DateTime(2050),
                            materialDatePickerInitialDate: DateTime.now(),
                            preferredDateFormat: DateFormat('dd/MM/yyyy'),
                            cupertinoDatePickerMaximumDate: DateTime(2050),
                            cupertinoDatePickerMinimumDate: DateTime(2000),
                            cupertinoDatePickerBackgroundColor:
                                Theme.of(context).primaryColor,
                            cupertinoDatePickerMaximumYear: 2050,
                            cupertinoDateInitialDateTime:
                                DateTime(DateTime.now().year),
                          ),
                        ),
                        SizedBox(
                          width: 0.4 * w,
                          child: TextfieldDatePicker(
                            decoration: InputDecoration(
                              hintText: 'To',
                              fillColor: Colors.white,
                              filled: true,
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide(
                                  color: Colors.grey.shade300,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide(
                                  color: Colors.grey.shade300,
                                ),
                              ),
                            ),
                            textfieldDatePickerController: endDateController,
                            materialDatePickerFirstDate: DateTime(2000),
                            materialDatePickerLastDate: DateTime(2050),
                            materialDatePickerInitialDate: DateTime.now(),
                            preferredDateFormat: DateFormat('dd/MM/yyyy'),
                            cupertinoDatePickerMaximumDate: DateTime(2050),
                            cupertinoDatePickerMinimumDate: DateTime(2000),
                            cupertinoDatePickerBackgroundColor:
                                Theme.of(context).primaryColor,
                            cupertinoDatePickerMaximumYear: 2050,
                            cupertinoDateInitialDateTime:
                                DateTime(DateTime.now().year),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              header: Container(
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Colors.grey, width: 0.5),
                  ),
                ),
                child: blackText("Date", 15, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ExpandablePanel(
              controller: ExpandableController(initialExpanded: true),
              collapsed: Container(),
              theme: ExpandableThemeData(hasIcon: false),
              expanded: buildCustomNameTextfield(),
              header: Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Colors.grey, width: 0.5),
                  ),
                ),
                child:
                    blackText("Description", 15, fontWeight: FontWeight.bold),
              ),
            ),
            Align(
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 30),
                width: 0.7 * w,
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xff1BAFB2)),
                child: Center(child: whiteText("Apply", 15)),
              ),
            )
          ],
        ),
      ),
    );
  }

  Container buildpriceFixedTextfield() {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(
          color: Colors.grey.shade300,
        ),
      ),
      child: TextFormField(
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          hintText: "Invoice value ...",
          fillColor: Colors.white,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  Widget buildRadioButton(
      int value, String text, int groupValue, void Function(int)? onChanged) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 7),
            child: GFRadio(
              activeBorderColor: Colors.transparent,
              inactiveBorderColor: Colors.transparent,
              inactiveBgColor: Colors.transparent,
              activeBgColor: Colors.transparent,
              radioColor: Color(0xff66B4D2),
              inactiveIcon: Icon(
                Icons.circle_outlined,
                color: Colors.grey.shade300,
              ),
              size: GFSize.SMALL,
              value: value,
              groupValue: groupValue,
              onChanged: onChanged,
            ),
          ),
          SizedBox(
            width: 15,
          ),
          groupValue == value ? blackText(text, 15) : greyText(text, 15),
        ],
      ),
    );
  }
}

Widget buildCustomNameTextfield({String? hint}) {
  return Container(
    margin: EdgeInsets.only(top: 20),
    height: 50,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10.0),
      border: Border.all(
        color: Colors.grey.shade300,
      ),
    ),
    child: TextFormField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        hintText: hint,
        fillColor: Colors.white,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide.none,
        ),
      ),
    ),
  );
}
