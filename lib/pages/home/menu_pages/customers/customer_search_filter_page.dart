import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:safqa/pages/create_invoice/customer_info_page.dart';
import 'package:safqa/pages/home/menu_pages/customers/controller/customers_controller.dart';
import 'package:safqa/pages/home/menu_pages/products/product_search_filter_page.dart';
import 'package:sizer/sizer.dart';

class CustomerSearchFilterPage extends StatefulWidget {
  const CustomerSearchFilterPage({super.key});

  @override
  State<CustomerSearchFilterPage> createState() =>
      _CustomertSearchFilterPageState();
}

class _CustomertSearchFilterPageState extends State<CustomerSearchFilterPage> {
  TextEditingController customerPhoneNumberControler = TextEditingController();
  CustomersController _customersController = Get.find();

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
                ClearFilterBTN(
                  onTap: () {
                    _customersController.clearCustomerFilter();
                    Get.back();
                  },
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            ExpandablePanel(
              controller: ExpandableController(initialExpanded: true),
              collapsed: Container(),
              theme: ExpandableThemeData(hasIcon: false),
              expanded: buildCustomNameTextfield(
                initialValue: _customersController.customerFilter.name,
                onChanged: (p0) {
                  _customersController.customerFilter.name = p0;
                },
              ),
              header: Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Colors.grey, width: 0.5),
                  ),
                ),
                child: blackText("Customer Name", 15),
              ),
            ),
            SizedBox(height: 30),
            ExpandablePanel(
              controller: ExpandableController(initialExpanded: true),
              collapsed: Container(),
              theme: ExpandableThemeData(hasIcon: false),
              expanded: Container(
                margin: EdgeInsets.only(top: 20),
                child: IntlPhoneField(
                  initialValue:
                      _customersController.customerFilter.mobileNumber,
                  flagsButtonPadding: EdgeInsets.symmetric(horizontal: 20),
                  dropdownIconPosition: IconPosition.trailing,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(10.0),
                        borderSide: BorderSide(color: Colors.grey, width: 0.5)
                        // borderSide: BorderSide,
                        ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(10.0),
                        borderSide: BorderSide(color: Colors.grey, width: 0.5)
                        // borderSide: BorderSide,
                        ),
                    errorBorder: OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(10.0),
                        borderSide: BorderSide(color: Colors.grey, width: 0.5)
                        // borderSide: BorderSide,
                        ),
                    focusedErrorBorder: OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(10.0),
                        borderSide: BorderSide(color: Colors.grey, width: 0.5)
                        // borderSide: BorderSide,
                        ),
                  ),
                  initialCountryCode: 'IN',
                  onChanged: (phone) {
                    _customersController.customerFilter.mobileNumber =
                        phone.number;
                  },
                  onCountryChanged: (value) {},

                  // controller: customerPhoneNumberControler,
                ),
              ),
              header: Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Colors.grey, width: 0.5),
                  ),
                ),
                child: blackText("Mobile Number", 15),
              ),
            ),
            SizedBox(height: 30),
            ExpandablePanel(
              controller: ExpandableController(initialExpanded: true),
              collapsed: Container(),
              theme: ExpandableThemeData(hasIcon: false),
              expanded: buildCustomNameTextfield(
                initialValue:
                    _customersController.customerFilter.customerRefrence,
                onChanged: (p0) {
                  _customersController.customerFilter.customerRefrence = p0;
                },
              ),
              header: Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Colors.grey, width: 0.5),
                  ),
                ),
                child: blackText("Customer Refrence", 15),
              ),
            ),
            ApplyFilterBTN(
              width: 0.7 * w,
              onTap: () {
                _customersController.activeCustomerFilter();
                Get.back();
              },
            ),
            // Align(
            //   child: Container(
            //     margin: EdgeInsets.symmetric(vertical: 30),
            //     width: 0.7 * w,
            //     padding: EdgeInsets.all(15),
            //     decoration: BoxDecoration(
            //         borderRadius: BorderRadius.circular(10),
            //         color: Color(0xff1BAFB2)),
            //     child: Center(child: whiteText("Apply", 15)),
            //   ),
            // )
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
