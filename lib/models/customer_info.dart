class CustomerInfo {
  String? customerName;
  int? customerSendBy = 1;
  String? customerMobileNumbr;
  String? customerMobileNumbrCode;
  String? customerRefrence;

  CustomerInfo({
    this.customerName,
    this.customerMobileNumbr,
    this.customerMobileNumbrCode,
    this.customerRefrence,
    this.customerSendBy,
  });

  // CustomerInfo.fromJson(
  //   Map<String, dynamic> json,
  // ) {}

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["customer_name"] = customerName;
    data["send_invoice_option_id"] = customerSendBy;
    data["customer_mobile"] = customerMobileNumbr;
    data["customer_mobile_code"] = customerMobileNumbrCode;
    data["customer_reference"] = customerRefrence;

    return data;
  }
}