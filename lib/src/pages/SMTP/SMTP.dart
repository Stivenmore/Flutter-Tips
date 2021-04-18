import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mailer/smtp_server.dart';
import 'package:mailer/mailer.dart';

class SMTP extends StatefulWidget {
  const SMTP({Key key}) : super(key: key);

  @override
  _SMTPState createState() => _SMTPState();
}

class _SMTPState extends State<SMTP> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          onPressed: () {
            metodo();
          },
          child: Text(
            'Envia Email',
            style: TextStyle(fontSize: 18),
          ),
        ),
      ),
    );
  }

  metodo() async {
    String username = 'Example@gmail.com';
    String password = '**********';

    // ignore: deprecated_member_use
    final smtpServer = gmail(username, password);
    // Use the SmtpServer class to configure an SMTP server:
    // final smtpServer = SmtpServer('smtp.domain.com');
    // See the named arguments of SmtpServer for further configuration
    // options.

    // Create our message.
    final message = Message()
      ..from = Address(username, 'Your name')
      ..recipients.add('engineerindustrial1@gmail.com')
      ..ccRecipients.addAll(['engineerindustrial1@gmail.com', 'engineerindustrial1@gmail.com'])
      ..bccRecipients.add(Address('engineerindustrial1@gmail.com'))
      ..subject = 'Hey esta es la prueba del protocolo SMTP :: 😀 :: ${DateTime.now()}'
      ..text = 'This is the plain text.\nThis is line 2 of the text part.'
      ..html = "<h1>Test</h1>\n<p>Hey! Here's some HTML content</p>";

    try {
      final sendReport = await send(message, smtpServer);
      print('Message sent: ' + sendReport.toString());
    } on MailerException catch (e) {
      print('Message not sent.');
      for (var p in e.problems) {
        print('Problem: ${p.code}: ${p.msg}');
      }
    }
    // DONE

    // Let's send another message using a slightly different syntax:
    //
    // Addresses without a name part can be set directly.
    // For instance `..recipients.add('destination@example.com')`
    // If you want to display a name part you have to create an
    // Address object: `new Address('destination@example.com', 'Display name part')`
    // Creating and adding an Address object without a name part
    // `new Address('destination@example.com')` is equivalent to
    // adding the mail address as `String`.
    final equivalentMessage = Message()
      ..from = Address(username, 'Your name 😀')
      ..recipients.add(Address('engineerindustrial1@gmail.com@outlook.es'))
      ..ccRecipients
          .addAll([Address('lenka2000@engineerindustrial1@gmail.com.es'), 'engineerindustrial1@gmail.com@outlook.es'])
      ..bccRecipients.add('engineerindustrial1@gmail.com')
      ..subject = 'Test Dart Mailer library :: 😀 :: ${DateTime.now()}'
      ..text = 'This is the plain text.\nThis is line 2 of the text part.'
      ..html =
          '<h1>Test</h1>\n<p>Hey! Here is some HTML content</p><img src="cid:myimg@3.141"/>'
      ..attachments = [
        FileAttachment(File('assets\image\logo.png'))
          ..location = Location.inline
          ..cid = '<myimg@3.141>'
      ];

    final sendReport2 = await send(equivalentMessage, smtpServer);

    // Sending multiple messages with the same connection
    //
    // Create a smtp client that will persist the connection
    var connection = PersistentConnection(smtpServer);

    // Send the first message
    await connection.send(message);

    // send the equivalent message
    await connection.send(equivalentMessage);

    // close the connection
    await connection.close();
  }
}
