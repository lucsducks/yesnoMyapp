import 'package:dio/dio.dart';
import 'package:yesnomyapp/domain/entities/message.dart';
import 'package:yesnomyapp/infrastructure/models/yes_no_model.dart';

class GetYesNo {
  final _dio = Dio();
  Future<Message> getAnswer() async {
    final response = await _dio.get('https://yesno.wtf/api');
    final yesNoModel = YesNoModel.fromMap(response.data);
    return yesNoModel.toMessageEntity();
  }
}
