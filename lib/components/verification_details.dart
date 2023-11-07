import 'package:flutter/material.dart';

class VerifyRequest {
  final String verifyName;
  final String verifyAnswer; // Corrected the typo

  VerifyRequest({required this.verifyAnswer, required this.verifyName}); // Corrected parameter names
}

List<VerifyRequest> verify = [
  VerifyRequest(verifyName: 'Name', verifyAnswer: 'Akwasi Mensah'),
  VerifyRequest(verifyName: 'Name', verifyAnswer: 'Akwasi Mensah'),
];