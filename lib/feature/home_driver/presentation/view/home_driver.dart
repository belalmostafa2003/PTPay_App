import 'dart:async';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:go_router/go_router.dart';
import 'package:ptpayapp/core/utils/gorouter.dart';
import 'package:ptpayapp/core/widget/logo.dart';
import 'package:ptpayapp/feature/home_driver/presentation/view/widget/home_driver/collectedamount.dart';
import 'package:ptpayapp/feature/home_driver/presentation/view/widget/home_driver/informationcar.dart';
import 'package:ptpayapp/feature/home_driver/presentation/view/widget/home_driver/dashboard.dart';
import 'package:ptpayapp/feature/home_driver/presentation/view/widget/home_driver/detailsprice.dart';
import 'package:ptpayapp/feature/home_driver/presentation/view/widget/home_driver/bottomvavigatordriver.dart';

class HomeDriver extends StatefulWidget {
  final String name, driverId, token;
  final int? initialVehicleId, initialRouteId;
  final String? initialRouteName;
  final double initialBalance, initialPending;

  const HomeDriver({
    super.key,
    required this.name,
    required this.driverId,
    required this.token,
    this.initialVehicleId,
    this.initialRouteId,
    this.initialRouteName,
    required this.initialBalance,
    required this.initialPending,
  });

  @override
  State<HomeDriver> createState() => _HomeDriverState();
}

class _HomeDriverState extends State<HomeDriver> {
  late double balance, pendingBalance;
  int? assignedVehicleId, assignedRouteId;
  String? assignedRouteName;
  int _selectedIndex = 4;
  int? activeTripId;
  int? activeSequence;
  String? activeRouteName, activeStartTime;
  bool isTripActive = false, isTripLoading = false, inZone = false;

  List<dynamic> payments = [];
  late final Dio _dio;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _dio = Dio(BaseOptions(
      baseUrl: 'https://ahmed80800.pythonanywhere.com/api/',
      headers: {
        'Authorization': 'Bearer ${widget.token}',
        'Content-Type': 'application/json',
      },
      validateStatus: (s) => s != null && s < 500,
    ));

    balance = widget.initialBalance;
    pendingBalance = widget.initialPending;
    assignedVehicleId = widget.initialVehicleId;
    assignedRouteId = widget.initialRouteId;
    assignedRouteName = widget.initialRouteName;

    fetchDriverInfo();
    fetchWalletData();
    fetchActiveTrip();

    _timer = Timer.periodic(const Duration(seconds: 3), (_) async {
      if (!mounted) return;
      await fetchDriverInfo();
      await fetchWalletData();
      await fetchActiveTrip(); // تستدعى داخلياً fetchTripPayments
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  // ------------ Networking helpers ------------

  Future<void> fetchDriverInfo() async {
    final resp = await _dio.get('driver/${widget.driverId}/');
    if (resp.statusCode == 200) {
      final d = resp.data as Map<String, dynamic>;
      final vehicles = d['vehicles'] as List<dynamic>;
      setState(() {
        assignedVehicleId = vehicles.isNotEmpty ? vehicles.first as int : null;
        assignedRouteId   = d['assigned_route'] as int?;
        assignedRouteName = d['assigned_route_name'] as String?;
      });
    }
  }

  Future<void> fetchWalletData() async {
    final resp =
    await _dio.get('wallets/drivers/?driver_id=${widget.driverId}');
    if (resp.statusCode == 200) {
      final list = (resp.data as List).cast<Map<String, dynamic>>();
      final w = list.isNotEmpty ? list.first : null;
      setState(() {
        balance        = w != null ? double.parse(w['balance'].toString()) : balance;
        pendingBalance = w != null ? double.parse(w['pending_balance'].toString()) : pendingBalance;
      });
    }
  }

  Future<void> fetchActiveTrip() async {
    final resp = await _dio.get('trips/active/');
    if (resp.statusCode == 200) {
      final d = resp.data as Map<String, dynamic>;
      setState(() {
        isTripActive   = true;
        activeTripId   = d['id'] as int?;
        activeSequence = d['sequence_number'] as int?;
        activeRouteName= d['route_name'] as String?;
        activeStartTime= d['start_time'] as String?;
        inZone         = d['in_zone'] == true || d['in_zone'] == 1;
      });
      await fetchTripPayments();
      if (inZone) await stopTrip();
    } else if (resp.statusCode == 404) {
      setState(() {
        isTripActive   = false;
        activeTripId   = null;
        activeSequence = null;
        inZone         = false;
        payments       = [];
      });
    }
  }

  Future<void> fetchTripPayments() async {
    if (activeTripId == null) return;
    final resp = await _dio.get('payments/trip/?trip_id=$activeTripId');
    if (resp.statusCode == 200) {
      setState(() => payments = resp.data as List);
    }
  }

  Future<void> startTrip() async {
    setState(() => isTripLoading = true);
    final resp = await _dio.post('trips/start/', data: {
      'vehicle_id': assignedVehicleId,
      'route_id': assignedRouteId,
    });
    if (resp.statusCode == 201) {
      final data = resp.data as Map<String, dynamic>;
      setState(() {
        isTripActive   = true;
        activeTripId   = data['id'] as int?;
        activeSequence = data['sequence_number'] as int?;
        activeRouteName= data['route_name'] as String?;
        activeStartTime= data['start_time'] as String?;
      });
      await fetchTripPayments();
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('بدأت الرحلة')));
    } else {
      debugPrint('startTrip failed: ${resp.statusCode} ${resp.data}');
    }
    setState(() => isTripLoading = false);
  }

  Future<void> stopTrip() async {
    setState(() => isTripLoading = true);
    final resp = await _dio.post('trips/end/');
    if (resp.statusCode == 200) {
      setState(() {
        isTripActive   = false;
        activeTripId   = null;
        activeSequence = null;
        inZone         = false;
        payments       = [];
      });
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('تم إيقاف الرحلة')));
    }
    setState(() => isTripLoading = false);
  }

  // ------------ Navigation ------------

  void _onItemTapped(int index) {
    if (index == 0) {
      context.push(AppRouter.KHomepageDriver);
    } else if (index == 1) {
      context.push(AppRouter.KInvoicelistDriver);
    } else if (index == 3) {
      context.push(
        AppRouter.KMoreDriver,
        extra: {'driverId': widget.driverId, 'token': widget.token},
      );
    } else {
      setState(() => _selectedIndex = index);
    }
  }

  // ------------ UI ------------

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: LayoutBuilder(
          builder: (context, constraints) {
            final sw = constraints.maxWidth;
            final sh = constraints.maxHeight;

            return SafeArea(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: sw * .03),
                child: Column(
                  children: [
                    SizedBox(height: sh * .01),
                    // Header
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              height: sh * .04,
                              width : sh * .04,
                              child : Image.asset('assets/icon/personal.png'),
                            ),
                            SizedBox(width: sw * .02),
                            Text(
                              'أهلاً، ${widget.name}',
                              style: TextStyle(
                                fontSize: sw * .04,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Alexandria',
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: sh * .08,
                          width : sw * .35,
                          child : const Logo(),
                        ),
                      ],
                    ),
                    SizedBox(height: sh * .02),

                    // Trip info + buttons
                    InformationCar(
                      onStartTrip     : startTrip,
                      onStopTrip      : stopTrip,
                      isLoading       : isTripLoading,
                      canStart        : !isTripActive && assignedVehicleId != null && assignedRouteId != null,
                      canStop         : isTripActive,
                      isTripActive    : isTripActive,
                      activeSequence  : activeSequence,
                      activeRouteName : activeRouteName,
                      activeStartTime : activeStartTime,
                    ),
                    SizedBox(height: sh * .02),

                    // Payments dashboard
                    Dashboard(payments: payments, onRefresh: fetchTripPayments),
                    SizedBox(height: sh * .02),

                    // Wallet + summary
                    Row(
                      children: [
                        Expanded(
                          child: CollectedAmountContainer(
                            collected: balance,
                            pending: pendingBalance,
                          ),
                        ),
                        const SizedBox(width: 8),
                        const Expanded(child: DetailsPrice()),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
        bottomNavigationBar: CustomBottomNavBar(
          selectedIndex: _selectedIndex,
          onItemTapped : _onItemTapped,
        ),
      ),
    );
  }
}