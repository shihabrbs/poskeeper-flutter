import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_notifier.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:getx_project_flutter/Controller/datacontroller.dart';
class GetxListView extends GetView<DataController> {
  const GetxListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('getx NetWork Call With List'),
      ),
      body: controller.obx(
          (data)=> Center(
            child: ListView.builder(
              itemCount: data!.length,
                itemBuilder: (BuildContext context,int index){
                return Card(
                  child: Column(
                    children: [
                      ListTile(
                        title: Text(data[index]['name']['first']),
                        subtitle: Text(data[index]['name']['last']),
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(
                            data[index]['picture']['thumbnail']
                          ),
                        ),
                      )
                    ],
                  ),
                );
                },
            ),
          )
      ),
    );
  }
}
