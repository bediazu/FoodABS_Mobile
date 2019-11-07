import 'package:flutter/cupertino.dart';
import 'package:camera/camera.dart';
import 'dart:async';

class CameraViewPort extends StatefulWidget
{
  @override
  CameraViewportState createState() => CameraViewportState();
}

class CameraViewportState extends State<CameraViewPort>
{
  List<CameraDescription> _myCameras = [];
  CameraController _camController;
  bool _ready = false;

  @override
  void initState()
  {
    super.initState();
    this.setup();
  }

  @override
  void dispose() {
    _camController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context)
  {
    if(!_ready)
      return Container();
    return AspectRatio(
      aspectRatio: _camController.value.aspectRatio,
      child: CameraPreview(_camController),
    );
  }

  Future<Null> setup() async
  {
    try
    {
      _myCameras=await availableCameras();
      _camController=new CameraController(_myCameras[0], ResolutionPreset.high);
      await _camController.initialize();
      setState(()
      {
        _ready=true;
      });
    }
    on CameraException catch(_)
    {
      setState(()
      {
        _ready=false;
      });
    }
  }
}
