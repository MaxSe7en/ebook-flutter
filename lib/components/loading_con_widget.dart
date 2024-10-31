import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'loading_con_model.dart';
export 'loading_con_model.dart';

class LoadingConWidget extends StatefulWidget {
  const LoadingConWidget({super.key});

  @override
  State<LoadingConWidget> createState() => _LoadingConWidgetState();
}

class _LoadingConWidgetState extends State<LoadingConWidget> {
  late LoadingConModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LoadingConModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 0.0,
      height: 0.0,
      decoration: const BoxDecoration(),
      alignment: const AlignmentDirectional(0.0, 0.0),
    );
  }
}
