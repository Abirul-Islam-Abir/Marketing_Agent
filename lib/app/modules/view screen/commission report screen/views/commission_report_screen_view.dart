import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/commission_report_screen_controller.dart';

class CommissionReportScreenView
    extends GetView<CommissionReportScreenController> {
  const CommissionReportScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CommissionReportScreenView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'CommissionReportScreenView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
