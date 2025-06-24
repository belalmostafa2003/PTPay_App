import 'package:go_router/go_router.dart';
import 'package:ptpayapp/feature/auth/presentation/view/ChooseLocationFirst.dart';
import 'package:ptpayapp/feature/auth/presentation/view/ChooseLocationSecond.dart';
import 'package:ptpayapp/feature/auth/presentation/view/ConfirmCreationNewPassword.dart';
import 'package:ptpayapp/feature/auth/presentation/view/Confirmaccountcreation.dart';
import 'package:ptpayapp/feature/auth/presentation/view/Driver_signup.dart';
import 'package:ptpayapp/feature/auth/presentation/view/LoginPageDriver.dart';
import 'package:ptpayapp/feature/auth/presentation/view/LoginPageRider.dart';
import 'package:ptpayapp/feature/auth/presentation/view/Rider_signup1.dart';
import 'package:ptpayapp/feature/auth/presentation/view/enterphone.dart';
import 'package:ptpayapp/feature/auth/presentation/view/forgetpassword_page.dart';
import 'package:ptpayapp/feature/auth/presentation/view/resetpassword.dart';
import 'package:ptpayapp/feature/auth/presentation/view/start_login_page.dart';
import 'package:ptpayapp/feature/auth/presentation/view/suresecurity.dart';
import 'package:ptpayapp/feature/home/presentation/view/Invoice_details.dart';
import 'package:ptpayapp/feature/home/presentation/view/Invoice_list_screen.dart';
import 'package:ptpayapp/feature/home/presentation/view/MoneyTransfer.dart';
import 'package:ptpayapp/feature/home/presentation/view/PaymentDetailsPage.dart';
import 'package:ptpayapp/feature/home/presentation/view/PaymentSuccessPage.dart';
import 'package:ptpayapp/feature/home/presentation/view/QR_canner.dart';
import 'package:ptpayapp/feature/home/presentation/view/TripDetailsPage.dart';
import 'package:ptpayapp/feature/home/presentation/view/homepage.dart';
import 'package:ptpayapp/feature/home/presentation/view/invoice.dart';
import 'package:ptpayapp/feature/home/presentation/view/more_passenger.dart';
import 'package:ptpayapp/feature/home/presentation/view/notifications_screen.dart';
import 'package:ptpayapp/feature/home/presentation/view/offers.dart';
import 'package:ptpayapp/feature/home/presentation/view/passenger_account.dart';
import 'package:ptpayapp/feature/home/presentation/view/problem.dart';
import 'package:ptpayapp/feature/home/presentation/view/recharge.dart';
import 'package:ptpayapp/feature/home/presentation/view/support_screen.dart';
import 'package:ptpayapp/feature/home/presentation/view/wallet.dart';
import 'package:ptpayapp/feature/home_driver/presentation/view/InvoiceList_driver.dart';
import 'package:ptpayapp/feature/home_driver/presentation/view/More_driver.dart';
import 'package:ptpayapp/feature/home_driver/presentation/view/NFC_payment.dart';
import 'package:ptpayapp/feature/home_driver/presentation/view/driver_account.dart';
import 'package:ptpayapp/feature/home_driver/presentation/view/driver_notifications.dart';
import 'package:ptpayapp/feature/home_driver/presentation/view/driver_statistics.dart';
import 'package:ptpayapp/feature/home_driver/presentation/view/home_driver.dart';
import 'package:ptpayapp/feature/home_driver/presentation/view/widget/home_driver/QR_canner.dart';
import 'package:ptpayapp/feature/splash/presentation/view/wellcome_page.dart';
import 'package:ptpayapp/feature/splash/presentation/view/widget/on_boarding.dart';
import 'package:ptpayapp/feature/splash/presentation/view/widget/start.dart';

abstract class AppRouter {
  static const KStartScreen               = "/StartScreen";
  static const KOnBoardingScreen          = "/OnBoardingScreen";
  static const KStartLoginPage            = "/StartLoginPage";
  static const KChooseLocationFirst       = "/ChooseLocationFirst";
  static const KLoginPageRider            = "/LoginPageRider";
  static const KLoginPageDriver           = "/LoginPageDriver";
  static const KChooseLocationSecond      = "/ChooseLocationSecond";
  static const KSignUpPageDriver          = "/SignUpPageDriver";
  static const KSignUpPageRider           = "/SignUpPageRider";
  static const KConfirmAccountCreation    = "/ConfirmAccountCreation";
  static const KSureSecurity              = "/SureSecurity";
  static const KEnterPhone                = "/EnterPhone";
  static const KForgetpassword            = "/Forgetpassword";
  static const KResetPassword             = "/ResetPassword";
  static const KConfirmCreationNewPassword= "/ConfirmCreationNewPassword";
  static const KHomepage                  = "/Homepage";
  static const KMoneyTransfer             = "/MoneyTransfer";
  static const KInvoice                   = "/Invoice";
  static const KHomepageDriver            = "/HomeDriver";
  static const KDriverAccount             = "/DriverAccount";
  static const KDriverNotificationsScreen = "/DriverNotificationsScreen";
  static const KDriverStatisticsScreen    = "/DriverStatisticsScreen";
  static const KInvoicelistDriver         = "/InvoicelistDriver";
  static const KMoreDriver                = "/MoreDriver";
  static const KNFCPaymentScreen          = "/NFCPaymentScreen";
  static const KQRScanPageRider           = "/QRScanPageRider";
  static const KQRScanPageDriver          = "/QRScanPageDriver";
  static const KPaymentDetailsPage        = "/PaymentDetailsPage";
  static const KPaymentSuccessPage        = "/PaymentSuccessPage";
  static const KTripDetailsPage           = "/TripDetailsPage";
  static const KProfileScreen           = "/ProfileScreen";
  static const KOffersScreen           = "/OffersScreen";
  static const KInvoiceDetailsPage           = "/InvoiceDetailsPage";
  static const KInvoiceListScreen           = "/InvoiceListScreen";
  static const KNotificationsScreen           = "/NotificationsScreen";
  static const KMyAccountScreen           = "/MyAccountScreen";
  static const KPaymentDetails           = "/PaymentDetails";
  static const KPaymentSuccess           = "/PaymentSuccess";
  static const KWalletTopUpPage           = "/WalletTopUpPage";
  static const KSupportScreen           = "/SupportScreen";
  static const KWalletPage          = "/WalletPage";
  static const KReportProblemPage          = "/ReportProblemPage";

  static final router = GoRouter(
    routes: [
      GoRoute(path: '/',                               builder: (c, s) => WellcomePage()),
      GoRoute(path: KStartScreen,                      builder: (c, s) => StartScreen()),
      GoRoute(path: KOnBoardingScreen,                 builder: (c, s) => OnBoardingScreen()),
      GoRoute(path: KStartLoginPage,                   builder: (c, s) => StartLoginPage()),
      GoRoute(path: KChooseLocationFirst,              builder: (c, s) => ChooseLocationFirst()),
      GoRoute(path: KLoginPageRider,                   builder: (c, s) => LoginPageRider()),
      GoRoute(path: KLoginPageDriver,                  builder: (c, s) => LoginPageDriver()),
      GoRoute(path: KChooseLocationSecond,             builder: (c, s) => ChooseLocationSecond()),
      GoRoute(path: KSignUpPageDriver,                 builder: (c, s) => SignUpPageDriver()),
      GoRoute(path: KSignUpPageRider,                  builder: (c, s) => SignUpPageRider()),
      GoRoute(path: KConfirmAccountCreation,           builder: (c, s) => ConfirmAccountCreation()),
      GoRoute(path: KSureSecurity,                     builder: (c, s) => SureSecurity()),
      GoRoute(path: KEnterPhone,                       builder: (c, s) => EnterPhone()),
      GoRoute(path: KForgetpassword,                   builder: (c, s) => Forgetpassword()),
      GoRoute(path: KResetPassword,                    builder: (c, s) => ResetPassword()),
      GoRoute(path: KConfirmCreationNewPassword,       builder: (c, s) => ConfirmCreationNewPassword()),
      GoRoute(path: KHomepage,                         builder: (c, s) => Homepage()),
      GoRoute(path: KMoneyTransfer,                    builder: (c, s) => MoneyTransfer()),
      GoRoute(path: KInvoice,                          builder: (c, s) => Invoice()),
      GoRoute(
        path: KHomepageDriver,
        builder: (c, s) {
          final e = s.extra as Map<String, dynamic>? ?? {};
          return HomeDriver(
            name:             e['name']             as String? ?? '',
            driverId:         e['driverId']         as String? ?? '',
            token:            e['token']            as String? ?? '',
            initialVehicleId: e['initialVehicleId'] as int?,
            initialRouteId:   e['initialRouteId']   as int?,
            initialRouteName: e['initialRouteName'] as String? ?? '',
            initialBalance:   e['initialBalance']   as double? ?? 0.0,
            initialPending:   e['initialPending']   as double? ?? 0.0,
          );
        },
      ),
      GoRoute(
        path: KDriverAccount,
        builder: (context, state) => DriverAccount(),
      ),
      GoRoute(path: KSupportScreen, builder: (c, s) => SupportScreen()),
      GoRoute(path: KWalletTopUpPage, builder: (c, s) => WalletTopUpPage()),
      GoRoute(path: KProfileScreen, builder: (c, s) => ProfileScreen()),
      GoRoute(path: KOffersScreen, builder: (c, s) => OffersScreen()),
      GoRoute(path: KInvoiceListScreen, builder: (c, s) => InvoiceListScreen()),
      GoRoute(path: KInvoiceDetailsPage, builder: (c, s) => InvoiceDetailsPage(invoice: {},)),
      GoRoute(path: KDriverNotificationsScreen, builder: (c, s) => DriverNotificationsScreen()),
      GoRoute(path: KDriverStatisticsScreen,    builder: (c, s) => DriverStatisticsScreen()),
      GoRoute(path: KInvoicelistDriver,         builder: (c, s) => InvoicelistDriver()),
      GoRoute(
        path: AppRouter.KMoreDriver,
        builder: (context, state) {
          final extra = state.extra as Map<String, dynamic>? ?? {};
          return MoreDriver(
              driverId: extra['driverId'] as String? ?? '',
              token:    extra['token']    as String? ?? '',
              );
          },
      ),
      GoRoute(path: KNFCPaymentScreen,          builder: (c, s) => NFCPaymentScreen()),
      GoRoute(path: KQRScanPageRider,           builder: (c, s) => QRScanPageRider()),
      GoRoute(path: KQRScanPageDriver,          builder: (c, s) => QRScanPageDriver()),
      GoRoute(path: KMyAccountScreen,          builder: (c, s) => MyAccountScreen()),
      GoRoute(path: KNotificationsScreen,          builder: (c, s) => NotificationsScreen()),
      GoRoute(path: KWalletPage,          builder: (c, s) => WalletPage()),
      GoRoute(path: KReportProblemPage,          builder: (c, s) => ReportProblemPage()),
      GoRoute(
        path: KTripDetailsPage,
        builder: (c, s) {
          final e = s.extra as Map<String, dynamic>? ?? {};
          return TripDetailsPage(
            tripNumber:    e['tripNumber']    as int?    ?? 0,
            from:          e['from']          as String? ?? '',
            to:            e['to']            as String? ?? '',
            dateTime:      e['dateTime']      as String? ?? '',
            price:         e['price']         as double? ?? 0.0,
            vehicleNumber: e['vehicleNumber'] as String? ?? '',
            balance:       e['balance']       as double? ?? 0.0,
            token:         e['token']         as String? ?? '',
          );
        },
      ),
      GoRoute(
        path: KPaymentDetailsPage,
        builder: (c, s) {
          final e = s.extra as Map<String, dynamic>? ?? {};
          return PaymentDetailsPage(
            amount:     e['price']      as double? ?? 0.0,
            fee:        e['fee']        as double? ?? 2.0,
            total:      e['total']      as double? ?? 0.0,
            tripNumber: e['tripNumber'] as int?    ?? 0,
            token:      e['token']      as String? ?? '',
          );
        },
      ),
      GoRoute(
        path: KPaymentSuccessPage,
        builder: (c, s) {
          final e = s.extra as Map<String, dynamic>? ?? {};
          return PaymentSuccessPage(
            tripNumber: e['tripNumber'] as int?    ?? 0,
            amount:     e['amount']     as double? ?? 0.0,
            newBalance :    e['balance']    as double? ?? 0.0,
            dateTime:   e['dateTime']   as String? ?? '',
          );
        },
      ),
    ],
  );
}