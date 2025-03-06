import 'package:dio/dio.dart';
import 'package:yes_no_app/data/models/yes_no_model.dart';

import 'package:yes_no_app/domain/entities/message.dart';

class GetYesNotAnswer {

  final _dio = Dio();
  
  Future<Message> getAnwer() async {
    final response = await _dio.get('https://yesno.wtf/api');

    final yesNoModel = YesNoModel.fromJsonMap(response.data);

    return Message(
      text: yesNoModel.answer,
      fromWho: FromWho.hers,
      imageUrl: yesNoModel.image,
    );
  }
}
