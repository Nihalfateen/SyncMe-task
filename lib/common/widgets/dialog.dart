import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DeleteAccountController extends GetxController {
  void deleteAccount() {
    // Implement your account deletion logic here
    print("Account deleted");
    Get.back(); // Close the dialog after deletion
  }

  void cancelDelete() {
    Get.back(); // Just close the dialog
  }

  void showDeleteDialog() {
    Get.defaultDialog(
      title: "Delete Account",
      middleText: "Are you sure you want to delete your account?",
      confirm: ElevatedButton(
        onPressed: deleteAccount,
        child: Text("Yes, Delete"),
        // style: ElevatedButton.styleFrom(
        //   backgroundColor: Colors.red, // Button color
        // ),
      ),
      cancel: TextButton(
        onPressed: cancelDelete,
        child: Text("NO"),
      ),
    );
  }
}
