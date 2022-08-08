import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

class CreateFolderCall {
  static Future<ApiCallResponse> call({
    String? name = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'createFolder',
      apiUrl:
          'https://api.streamtape.com/file/createfolder?login=a5660958f6f8f97b2f2a&key=ldLqYbdZOaF7Pj9&name=${name}',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
    );
  }
}

class ListFoldersCall {
  static Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'listFolders',
      apiUrl:
          'https://api.streamtape.com/file/listfolder?login=a5660958f6f8f97b2f2a&key=ldLqYbdZOaF7Pj9',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
    );
  }
}
