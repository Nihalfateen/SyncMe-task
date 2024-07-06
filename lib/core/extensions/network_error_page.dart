import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../common/model/api_response_model.dart';

class NetworkErrorPage extends GetView {
  ResponseModel responseModel;

  NetworkErrorPage(this.responseModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("API Response Page"),
        elevation: 0,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Card(
            child: ListTile(
              title: Text("statusCode"),
              subtitle: Text(
                responseModel.statusCode.toString() +
                    " " +
                    responseModel.message.toString(),
              ),
            ),
          ),
          Card(
            child: ListTile(
              title: Text("URL"),
              subtitle: Text(responseModel.url.toString()),
              trailing: IconButton(
                icon: Icon(Icons.copy),
                onPressed: () async {
                  await Clipboard.setData(
                    ClipboardData(
                      text: responseModel.url.toString(),
                    ),
                  );
                },
              ),
            ),
          ),
          Card(
            child: ListTile(
              title: Text("Query"),
              subtitle: Text(responseModel.query.toString()),
              trailing: IconButton(
                icon: Icon(Icons.copy),
                onPressed: () async {
                  await Clipboard.setData(
                    ClipboardData(
                      text: responseModel.query.toString(),
                    ),
                  );
                },
              ),
            ),
          ),
          Card(
            child: ListTile(
              title: Text("Respons"),
              subtitle: Text(responseModel.data.toString()),
              trailing: IconButton(
                icon: Icon(Icons.copy),
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),
    );
  }
}
