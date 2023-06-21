import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:openim_demo/src/models/jubao.dart';

class JubaoController extends GetxController {
  List<Jubao> mJubaos = [];
  // currentReason

  TextEditingController reasonController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    mJubaos = jubaos;
  }

  void showSelectDialog() {
    Get.defaultDialog(
        title: "请选择举报理由",
        content: Container(
          width: 300,
          height: 300,
          child: ListView.builder(
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Get.back();
                },
                child: Container(
                  height: 55,
                  padding: EdgeInsets.only(left: 16, right: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        mJubaos[index].reason,
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      Icon(
                        Icons.check,
                        size: 16,
                        color: Colors.blue,
                      )
                    ],
                  ),
                ),
              );
            },
            itemCount: mJubaos.length,
          ),
        ));
  }
}
