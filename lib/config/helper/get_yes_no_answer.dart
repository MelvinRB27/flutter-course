import 'package:dio/dio.dart';
import 'package:flutter_application_1/domain/entities/message.dart';
import 'package:flutter_application_1/infrastructure/models/yes_no_model.dart';

class GetYesNoAnswer {
  final _dio = Dio();

  Future<Message> getAnswer() async {
    final response = await _dio.get('https://yesno.wtf/api');

    final data = YesNoModel.fromJsonMap(response.data);
    return data.toMessageEntity();
  }
}
