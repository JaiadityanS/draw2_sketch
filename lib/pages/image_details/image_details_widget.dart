import '/backend/backend.dart';
import '/components/delete_modal/delete_modal_widget.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'image_details_model.dart';
export 'image_details_model.dart';

class ImageDetailsWidget extends StatefulWidget {
  const ImageDetailsWidget({
    Key? key,
    this.sketchRef,
  }) : super(key: key);

  final SketchesRecord? sketchRef;

  @override
  _ImageDetailsWidgetState createState() => _ImageDetailsWidgetState();
}

class _ImageDetailsWidgetState extends State<ImageDetailsWidget> {
  late ImageDetailsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ImageDetailsModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Stack(
                    alignment: AlignmentDirectional(0.0, -1.0),
                    children: [
                      InkWell(
                        onTap: () async {
                          await Navigator.push(
                            context,
                            PageTransition(
                              type: PageTransitionType.fade,
                              child: FlutterFlowExpandedImageView(
                                image: Image.network(
                                  widget.sketchRef!.replicateOutput!,
                                  fit: BoxFit.contain,
                                ),
                                allowRotation: false,
                                tag: widget.sketchRef!.replicateOutput!,
                                useHeroAnimation: true,
                              ),
                            ),
                          );
                        },
                        child: Hero(
                          tag: widget.sketchRef!.replicateOutput!,
                          transitionOnUserGestures: true,
                          child: Image.network(
                            widget.sketchRef!.replicateOutput!,
                            width: MediaQuery.of(context).size.width * 1.0,
                            height: 430.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0.0, 420.0, 0.0, 0.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 1.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 6.0,
                                color: Color(0x27000000),
                                offset: Offset(0.0, -2.0),
                              )
                            ],
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(0.0),
                              bottomRight: Radius.circular(0.0),
                              topLeft: Radius.circular(20.0),
                              topRight: Radius.circular(20.0),
                            ),
                          ),
                          alignment: AlignmentDirectional(0.0, -1.0),
                          child: Align(
                            alignment: AlignmentDirectional(-1.0, -1.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 16.0, 16.0, 44.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 4.0),
                                    child: Text(
                                      'Created on',
                                      style: FlutterFlowTheme.of(context)
                                          .bodySmall,
                                    ),
                                  ),
                                  Text(
                                    dateTimeFormat('MMMMEEEEd',
                                        widget.sketchRef!.timeCreated!),
                                    style: FlutterFlowTheme.of(context)
                                        .headlineMedium,
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 16.0, 0.0, 4.0),
                                    child: Text(
                                      'Your Prompt',
                                      style: FlutterFlowTheme.of(context)
                                          .bodySmall,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 16.0),
                                    child: Text(
                                      valueOrDefault<String>(
                                        widget.sketchRef!.replicatePrompt,
                                        'No Prompt',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily: 'Plus Jakarta Sans',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                          ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 12.0),
                                    child: Text(
                                      'Your Sketch',
                                      style: FlutterFlowTheme.of(context)
                                          .bodySmall,
                                    ),
                                  ),
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(12.0),
                                    child: CachedNetworkImage(
                                      imageUrl: widget.sketchRef!.sketch!,
                                      width: double.infinity,
                                      height: 330.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 64.0, 16.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 0.0, 0.0),
                                child: FlutterFlowIconButton(
                                  borderColor: Colors.transparent,
                                  borderRadius: 30.0,
                                  buttonSize: 48.0,
                                  fillColor:
                                      FlutterFlowTheme.of(context).overlay,
                                  icon: Icon(
                                    Icons.arrow_back_rounded,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    size: 30.0,
                                  ),
                                  onPressed: () async {
                                    context.safePop();
                                  },
                                ),
                              ),
                              FlutterFlowIconButton(
                                borderColor:
                                    FlutterFlowTheme.of(context).lineColor,
                                borderRadius: 30.0,
                                borderWidth: 2.0,
                                buttonSize: 48.0,
                                fillColor: FlutterFlowTheme.of(context).overlay,
                                icon: Icon(
                                  Icons.delete_outlined,
                                  color: FlutterFlowTheme.of(context).alternate,
                                  size: 24.0,
                                ),
                                onPressed: () async {
                                  await showModalBottomSheet(
                                    isScrollControlled: true,
                                    backgroundColor: Colors.transparent,
                                    barrierColor: Colors.transparent,
                                    context: context,
                                    builder: (bottomSheetContext) {
                                      return Padding(
                                        padding:
                                            MediaQuery.of(bottomSheetContext)
                                                .viewInsets,
                                        child: DeleteModalWidget(
                                          sketchRef: widget.sketchRef,
                                        ),
                                      );
                                    },
                                  ).then((value) => setState(() {}));
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
