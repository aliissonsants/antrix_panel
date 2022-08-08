import '../backend/api_requests/api_calls.dart';
import '../components/create_folder_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key? key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  Completer<ApiCallResponse>? _apiRequestCompleter;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Color(0xFF895FED),
        automaticallyImplyLeading: false,
        title: Text(
          'UpStream',
          style: FlutterFlowTheme.of(context).title1.override(
                fontFamily: 'Poppins',
                color: FlutterFlowTheme.of(context).primaryBackground,
              ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 2,
      ),
      backgroundColor: Color(0xFF1C1C1C),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await showModalBottomSheet(
            isScrollControlled: true,
            backgroundColor: Colors.transparent,
            context: context,
            builder: (context) {
              return Padding(
                padding: MediaQuery.of(context).viewInsets,
                child: Container(
                  height: 250,
                  child: CreateFolderWidget(),
                ),
              );
            },
          );
        },
        backgroundColor: Color(0xFFAA8BF2),
        elevation: 8,
        child: Icon(
          Icons.add,
          color: Colors.white,
          size: 24,
        ),
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
            child: FutureBuilder<ApiCallResponse>(
              future: (_apiRequestCompleter ??= Completer<ApiCallResponse>()
                    ..complete(ListFoldersCall.call()))
                  .future,
              builder: (context, snapshot) {
                // Customize what your widget looks like when it's loading.
                if (!snapshot.hasData) {
                  return Center(
                    child: SizedBox(
                      width: 50,
                      height: 50,
                      child: CircularProgressIndicator(
                        color: FlutterFlowTheme.of(context).primaryColor,
                      ),
                    ),
                  );
                }
                final listViewListFoldersResponse = snapshot.data!;
                return Builder(
                  builder: (context) {
                    final listResult = getJsonField(
                      listViewListFoldersResponse.jsonBody,
                      r'''$.result.folders[*]''',
                    ).toList();
                    return RefreshIndicator(
                      onRefresh: () async {
                        setState(() => _apiRequestCompleter = null);
                        await waitForApiRequestCompleter();
                      },
                      child: ListView.builder(
                        padding: EdgeInsets.zero,
                        scrollDirection: Axis.vertical,
                        itemCount: listResult.length,
                        itemBuilder: (context, listResultIndex) {
                          final listResultItem = listResult[listResultIndex];
                          return Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 5, 0),
                                  child: Icon(
                                    Icons.folder_rounded,
                                    color: Color(0xFFAA8BF2),
                                    size: 40,
                                  ),
                                ),
                                Text(
                                  getJsonField(
                                    listResultItem,
                                    r'''$.name''',
                                  ).toString(),
                                  style: FlutterFlowTheme.of(context)
                                      .subtitle1
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: Colors.white,
                                      ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  Future waitForApiRequestCompleter({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = _apiRequestCompleter?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
