import 'dart:io';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class WhatsAppStatusScreen extends StatefulWidget {
  @override
  _WhatsAppStatusScreenState createState() => _WhatsAppStatusScreenState();
}

class _WhatsAppStatusScreenState extends State<WhatsAppStatusScreen> {
  List<FileSystemEntity> _statuses = [];

  @override
  void initState() {
    super.initState();
    _requestPermission();
  }

  Future<void> _requestPermission() async {
    // طلب الإذن للوصول إلى التخزين
    PermissionStatus status = await Permission.storage.request();
    if (status.isGranted) {
      _showPermissionGrantedDialog();
    } else if (status.isPermanentlyDenied) {
      openAppSettings(); // افتح إعدادات التطبيق ليقوم المستخدم بمنح الإذن يدويًا
    }
  }

  void _showPermissionGrantedDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Permission Granted'),
          content:
              Text('You have granted permission to access WhatsApp statuses.'),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
                _loadStatuses();
              },
            ),
          ],
        );
      },
    );
  }

  void _loadStatuses() async {
    // مسار مجلد حالات الواتساب
    Directory directory =
        Directory('/storage/emulated/0/WhatsApp/Media/.Statuses');
    List<FileSystemEntity> statuses = directory.listSync();

    setState(() {
      _statuses = statuses;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('WhatsApp Status')),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 4.0,
          mainAxisSpacing: 4.0,
        ),
        itemCount: _statuses.length,
        itemBuilder: (context, index) {
          return Image.file(File(_statuses[index].path));
        },
      ),
    );
  }
}
