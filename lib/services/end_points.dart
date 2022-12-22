class EndPoints {
  static const String _baseURL = "https://api.safqapay.com/api";
  // static const String _baseURL = "xx.yy.zz";
  static String get baseURL => _baseURL;

  static String get loginEndPoint => "/login";
  static String get meEndPoint => "/me";
  static String get registerEndPoint => "/register";
  static String get globalData => "/globalData";
  static String get createInvoice => "/invoice/store";
  static String editInvoice(int id) => "$_baseURL/invoice/update/$id";
  static String get getInvoices => "$_baseURL/invoices";
  static String get getPaymentLinks => "$_baseURL/payments";
  static String get createQuickInvoice => "/invoice/quick/store";
  static String get createProduct => "/product/store";
  static String get updateProduct => "/product/update/";
  static String get getProducts => "/products";
  static String get createProductCategory => "/product/category/store";
  static String get getProductCategories => "/product/categories";
  static String get deleteProductCategory =>
      "$_baseURL/product/category/delete/";
  static String get editProductCategory => "$_baseURL/product/category/update/";
  static String get getMyCustomers => "$_baseURL/customers";
  static String get createCustomer => "$_baseURL/customer/store";
  static String get deleteCustomer => "$_baseURL/customer/delete/";
  static String get updateCustomer => "$_baseURL/customer/update/";
  static String get getBanks => "https://api.safqapay.com/api/banks";
  static String get getCountries => "https://api.safqapay.com/api/countries";
  static String get getCities => "https://api.safqapay.com/api/cities";
  static String get getAreas => "https://api.safqapay.com/api/areas";
  static String get getAdressTypes =>
      "https://api.safqapay.com/api/address_type";
  static String get getRoles => "$_baseURL/roles";
  static String get getSendOptions => "$_baseURL/send_invoice_options";
  static String get getManageUsers => "$_baseURL/manage_users";
  static String get createManageUser => "$_baseURL/manage_user/store";
  static String get editManageUser => "$_baseURL/manage_user/update/";
  static String get createAddress => "$_baseURL/addresse/store";
  static String get createPaymentLink => "$_baseURL/payment/store";
  static String get getAddresses => "$_baseURL/addresses";
  static String get editAddresses => "$_baseURL/addresse/update/";
  static String deleteAddresses(int id) => "$_baseURL/addresse/delete/$id";
  static String editPayment(int id) => "$_baseURL/payment/update/$id";
  static String deletePayment(int id) => "$_baseURL/payment/delete/$id";
  static String get forgetPassword => "$_baseURL/forget-password";
  static String get changePassword => "$_baseURL/changePassword";
  static String get storeMessage =>
      "https://api.safqapay.com/admin/message/store";
  static String get getContactUsMessage =>
      "https://api.safqapay.com/api/contacts";
  static String get getContactUsPhones =>
      "https://api.safqapay.com/admin/contactphones";
}
