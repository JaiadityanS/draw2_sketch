import '/auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/components/bg_blur/bg_blur_widget.dart';
import '/components/image_results/image_results_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/instant_timer.dart';
import '/flutter_flow/upload_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:signature/signature.dart';
import 'creation_page_model.dart';
export 'creation_page_model.dart';

class CreationPageWidget extends StatefulWidget {
  const CreationPageWidget({Key? key}) : super(key: key);

  @override
  _CreationPageWidgetState createState() => _CreationPageWidgetState();
}

class _CreationPageWidgetState extends State<CreationPageWidget>
    with TickerProviderStateMixin {
  late CreationPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  final animationsMap = {
    'textOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 300.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 300.ms,
          begin: Offset(0.0, 20.0),
          end: Offset(0.0, 0.0),
        ),
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 300.ms,
          begin: 0.9,
          end: 1.0,
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CreationPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        _model.darkMode = true;
        _model.animateMessage = false;
      });
    });

    _model.textController ??= TextEditingController();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          child: Stack(
            children: [
              wrapWithModel(
                model: _model.bgBlurModel,
                updateCallback: () => setState(() {}),
                child: BgBlurWidget(),
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(32.0, 48.0, 32.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Create with AI',
                          style: FlutterFlowTheme.of(context).headlineMedium,
                        ),
                        ToggleIcon(
                          onPressed: () async {
                            setState(() => _model.darkMode = !_model.darkMode!);
                            if (_model.darkMode == true) {
                              setDarkModeSetting(context, ThemeMode.light);
                            } else {
                              setDarkModeSetting(context, ThemeMode.dark);
                            }
                          },
                          value: _model.darkMode!,
                          onIcon: Icon(
                            Icons.nightlight_round,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            size: 25.0,
                          ),
                          offIcon: Icon(
                            Icons.wb_sunny_outlined,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            size: 25.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              32.0, 12.0, 32.0, 12.0),
                          child: Material(
                            color: Colors.transparent,
                            elevation: 0.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(16.0),
                              child: Container(
                                width: double.infinity,
                                height: 300.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  borderRadius: BorderRadius.circular(16.0),
                                  border: Border.all(
                                    color:
                                        FlutterFlowTheme.of(context).lineColor,
                                  ),
                                ),
                                child: Stack(
                                  alignment: AlignmentDirectional(1.0, -1.0),
                                  children: [
                                    ClipRect(
                                      child: Signature(
                                        controller: _model.signatureController,
                                        backgroundColor: Colors.white,
                                        width: double.infinity,
                                        height: double.infinity,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 12.0, 12.0, 0.0),
                                      child: FlutterFlowIconButton(
                                        borderColor: Colors.transparent,
                                        borderRadius: 8.0,
                                        borderWidth: 1.0,
                                        buttonSize: 40.0,
                                        fillColor: Color(0xFFF49F77),
                                        icon: Icon(
                                          Icons.delete_rounded,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBtnText,
                                          size: 22.0,
                                        ),
                                        onPressed: () async {
                                          setState(() {
                                            _model.signatureController.clear();
                                          });
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(32.0, 0.0, 32.0, 0.0),
                    child: TextFormField(
                      controller: _model.textController,
                      textCapitalization: TextCapitalization.sentences,
                      obscureText: false,
                      decoration: InputDecoration(
                        labelText: 'Describe your drawing...',
                        labelStyle:
                            FlutterFlowTheme.of(context).bodySmall.override(
                                  fontFamily: 'Plus Jakarta Sans',
                                  lineHeight: 1.3,
                                ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).lineColor,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).primary,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).alternate,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).alternate,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        filled: true,
                        fillColor:
                            FlutterFlowTheme.of(context).secondaryBackground,
                        contentPadding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 16.0, 16.0, 16.0),
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Plus Jakarta Sans',
                            lineHeight: 1.3,
                          ),
                      maxLines: 5,
                      minLines: 1,
                      keyboardType: TextInputType.multiline,
                      validator:
                          _model.textControllerValidator.asValidator(context),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(32.0, 32.0, 32.0, 0.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        var _shouldSetState = false;
                        final signatureImage =
                            await _model.signatureController.toPngBytes();
                        if (signatureImage == null) {
                          showUploadMessage(
                            context,
                            'Signature is empty.',
                          );
                          return;
                        }
                        showUploadMessage(
                          context,
                          'Uploading signature...',
                          showLoading: true,
                        );
                        final downloadUrl = (await uploadData(
                            getSignatureStoragePath(), signatureImage));

                        ScaffoldMessenger.of(context).hideCurrentSnackBar();
                        if (downloadUrl != null) {
                          setState(
                              () => _model.uploadedSignatureUrl = downloadUrl);
                          showUploadMessage(
                            context,
                            'Success!',
                          );
                        } else {
                          showUploadMessage(
                            context,
                            'Failed to upload signature.',
                          );
                          return;
                        }

                        _model.createPrediction =
                            await ReplicateAPIGroup.createPredictionCall.call(
                          prompt: _model.textController.text,
                          imageURL: _model.uploadedSignatureUrl,
                        );
                        _shouldSetState = true;
                        if ((_model.createPrediction?.succeeded ?? true)) {
                          _model.instantTimer = InstantTimer.periodic(
                            duration: Duration(milliseconds: 2000),
                            callback: (timer) async {
                              _model.getPrediction = await ReplicateAPIGroup
                                  .getPredictionCall
                                  .call(
                                id: ReplicateAPIGroup.createPredictionCall
                                    .id(
                                      (_model.createPrediction?.jsonBody ?? ''),
                                    )
                                    .toString(),
                              );
                              _shouldSetState = true;
                              if ((_model.getPrediction?.succeeded ?? true)) {
                                if ((String status) {
                                  return status == "succeeded";
                                }(ReplicateAPIGroup.getPredictionCall
                                    .status(
                                      (_model.getPrediction?.jsonBody ?? ''),
                                    )
                                    .toString())) {
                                  final sketchesCreateData =
                                      createSketchesRecordData(
                                    sketch: _model.uploadedSignatureUrl,
                                    timeCreated: getCurrentTimestamp,
                                    replicateOutput:
                                        ReplicateAPIGroup.getPredictionCall
                                            .outputImageURLs(
                                              (_model.getPrediction?.jsonBody ??
                                                  ''),
                                            )
                                            .last,
                                    replicatePrompt: _model.textController.text,
                                  );
                                  await SketchesRecord.createDoc(
                                          currentUserReference!)
                                      .set(sketchesCreateData);
                                  setState(() {
                                    _model.animateMessage = true;
                                  });
                                  setState(() {
                                    _model.textController?.clear();
                                  });
                                  setState(() {
                                    _model.signatureController.clear();
                                  });
                                  _model.instantTimer?.cancel();
                                  await showModalBottomSheet(
                                    isScrollControlled: true,
                                    backgroundColor: Colors.transparent,
                                    barrierColor: Color(0x00000000),
                                    context: context,
                                    builder: (bottomSheetContext) {
                                      return GestureDetector(
                                        onTap: () => FocusScope.of(context)
                                            .requestFocus(_unfocusNode),
                                        child: Padding(
                                          padding:
                                              MediaQuery.of(bottomSheetContext)
                                                  .viewInsets,
                                          child: ImageResultsWidget(
                                            outputImage: ReplicateAPIGroup
                                                .getPredictionCall
                                                .outputImageURLs(
                                                  (_model.getPrediction
                                                          ?.jsonBody ??
                                                      ''),
                                                )
                                                .last,
                                          ),
                                        ),
                                      );
                                    },
                                  ).then((value) => setState(() {}));

                                  if (_shouldSetState) setState(() {});
                                  return;
                                }
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Get Prediction failed.',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium,
                                    ),
                                    duration: Duration(milliseconds: 4000),
                                    backgroundColor: Color(0x00000000),
                                  ),
                                );
                              }
                            },
                            startImmediately: false,
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Create Prediction Failed',
                                style: FlutterFlowTheme.of(context).bodyMedium,
                              ),
                              duration: Duration(milliseconds: 4000),
                              backgroundColor: Color(0x00000000),
                            ),
                          );
                        }

                        if (_shouldSetState) setState(() {});
                      },
                      text: 'Submit',
                      options: FFButtonOptions(
                        width: double.infinity,
                        height: 44.0,
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).primary,
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  fontFamily: 'Plus Jakarta Sans',
                                  color: Colors.white,
                                ),
                        elevation: 0.0,
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                  if (_model.animateMessage == true)
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 32.0, 0.0, 0.0),
                        child: Text(
                          'Your image is generating...',
                          style: FlutterFlowTheme.of(context).bodyMedium,
                        ).animateOnPageLoad(
                            animationsMap['textOnPageLoadAnimation']!),
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
