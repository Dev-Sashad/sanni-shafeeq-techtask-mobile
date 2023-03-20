import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:intl/intl.dart';

String? isEmpty(value) {
  if (value.isEmpty) {
    return 'Field cannot be empty';
  }
  return null;
}

String capitalize(val) {
  return "${val[0].toUpperCase()}${val.substring(1)}";
}

numberFormat(String amount) {
  return NumberFormat.decimalPattern()
      .format(double.parse(amount.replaceAll(",", "")));
}

currencyFormater(String value, {String symbol = "NGN "}) {
  return NumberFormat.currency(name: symbol)
      .format(double.parse(value.toString().replaceAll(",", "")));
}

Future<bool> checkInternet() async {
  var connectivityResult = await (Connectivity().checkConnectivity());
  if (connectivityResult == ConnectivityResult.mobile) {
    return true;
  } else if (connectivityResult == ConnectivityResult.wifi) {
    return true;
  } else {
    return false;
  }
}

Future<bool> delaySession() async {
  await Future.delayed(const Duration(milliseconds: 2000), () {});
  return true;
}
