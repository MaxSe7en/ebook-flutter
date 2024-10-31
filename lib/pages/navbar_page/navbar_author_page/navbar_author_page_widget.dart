import '/components/nav_bar_componant_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'navbar_author_page_model.dart';
export 'navbar_author_page_model.dart';

class NavbarAuthorPageWidget extends StatefulWidget {
  const NavbarAuthorPageWidget({super.key});

  @override
  State<NavbarAuthorPageWidget> createState() => _NavbarAuthorPageWidgetState();
}

class _NavbarAuthorPageWidgetState extends State<NavbarAuthorPageWidget> {
  late NavbarAuthorPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NavbarAuthorPageModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              const Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [],
              ),
              Align(
                alignment: const AlignmentDirectional(0.0, 1.0),
                child: wrapWithModel(
                  model: _model.navBarComponantModel,
                  updateCallback: () => safeSetState(() {}),
                  child: const NavBarComponantWidget(
                    selectedPage: 'Author',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
