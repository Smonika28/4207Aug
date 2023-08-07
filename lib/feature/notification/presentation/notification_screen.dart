import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import '../../../utils/Api/api_calling/api_provider.dart';
import '../model/notification_model.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  ApiProvider apiProvider = ApiProvider();

  NotificationModel notificationModel = NotificationModel();

  void notificationData() async {
    var resData = await apiProvider.getNotificationData();
    log(resData.data!.toString());
    setState(() {
      notificationModel = resData;
    });
  }

  @override
  void initState() {
    super.initState();
    notificationData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notification screen"),
      ),
      body: notificationModel.data != null
          ? ListView.builder(
              itemCount: 20,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.only(bottom: 5),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 211, 209, 209)
                        .withOpacity(0.4),
                  ),
                  child: ListTile(
                    title: Html(
                      data: notificationModel.data!.title ?? " ",
                    ),
                    subtitle: Html(
                      data: notificationModel.data!.content ?? " ",
                    ),
                  ),
                );
              },
            )
          : const Center(
              child: CircularProgressIndicator.adaptive(),
            ),
    );
  }
}
