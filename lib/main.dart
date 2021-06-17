import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

void main() {
  runApp(MaterialApp(home:NamingScreen()));
}
const flashOn = 'FLASH ON';
const flashOff = 'FLASH OFF';
const frontCamera = 'FRONT CAMERA';
const backCamera = 'BACK CAMERA';

class NamingScreen extends StatefulWidget {
  @override
  NamingScreenState createState() => NamingScreenState();
}

//this will be the first screen your going to see
class NamingScreenState extends State<NamingScreen> {
  final textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;
    double height=MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(left: 16.0, right: 16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              Container(
                margin: const EdgeInsets.only(top: 80.0, bottom: 36.0),
                width: width,
                height: height*0.15,
                child: Image.asset('assets/six_group_logo.png',fit: BoxFit.fill,),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('Willkommen zur Six Pandemie\n Tracing App',style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.bold),),
                  ],
                ),
              ),
              SizedBox(height: 30.0,),
              TextFormField(
                controller: textController,
                decoration: InputDecoration(
                  labelText: 'Ganzer Name',
                  hintText: 'Vorname Nachname',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter your Email';
                  } else if (RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value)) {
                    return 'Please enter a valid Email';
                  } else {
                    return null;
                  }
                },
              ),
              SizedBox(height: 20.0,),
              RaisedButton(
                child: Text('Weiter'),
                color: Color(0xffe42313),
                //Navigates t
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CapturingVisitingDataState()),
                  );
                  return showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        content: Text(textController.text),
                      );
                    }
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//Here u can set yourself Corona positiv
class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;
    double height=MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(left: 16.0, right: 16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 80.0, bottom: 36.0),
                width: width,
                height: height*0.15,
                child: Image.asset('assets/six_group_logo.png',fit: BoxFit.fill,),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('Profil',style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.bold),),
                  ],
                ),
              ),
              SizedBox(height: 30.0,),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Vorname Nachname',
                  hintText: 'Vorname Nachname',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter your Email';
                  } else if (RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value)) {
                    return 'Please enter a valid Email';
                  } else {
                    return null;
                  }
                },
              ),
              SizedBox(height: 20.0,),
              RaisedButton(
                child: Text('Status: Negativ'),
                color: Color(0xffFFFFFF),
                onPressed: (){},
              ),
              SizedBox(height: 20.0,),
              RaisedButton(
                child: Text('Erfasste Standorte'),
                color: Color(0xffFFFFFF),
                onPressed: (){},
              ),
            ],
          ),
        ),
      ),
    );
  }
}


//On this Screen we Capture all the Data and use the QR-Scanner
class CapturingVisitingDataState extends StatelessWidget {
  final textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery
        .of(context)
        .size
        .width;
    double height = MediaQuery
        .of(context)
        .size
        .height;
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(left: 16.0, right: 16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 100.0, bottom: 36.0),
                width: width,
                height: height * 0.15,
                child: Image.asset('assets/six_group_logo.png', fit: BoxFit.fill,),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('Registriere deine Arbeitsplätze', style: TextStyle(
                        fontSize: 25.0, fontWeight: FontWeight.bold),),
                  ],
                ),
              ),
              SizedBox(height: 30.0,),
              TextFormField(
                controller: textController,
                decoration: InputDecoration(
                  labelText: 'Zimmer Nummer',
                  hintText: 'QR-Code',
                  suffixIcon: Icon(Icons.email),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter your Email';
                  } else if (RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value)) {
                    return 'Please enter a valid Email';
                  } else {
                    return null;
                  }
                },
              ),
              SizedBox(height: 20.0,),
              RaisedButton(
                child: Text('QR Scanner'),
                color: Color(0xffffffff),
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => QRView()),
                  );
                  return showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          content: Text(textController.text),
                        );
                      }
                  );

                },
              ),
              SizedBox(height: 20.0,),
              RaisedButton(
                child: Text('Standort Speichern'),
                color: Color(0xffe42313),
                onPressed: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ProfileScreen()),
                  );

                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();

  int _selectedGender = 0;

  List<DropdownMenuItem<int>> genderList = [];

  void loadGenderList() {
    genderList = [];
    genderList.add(new DropdownMenuItem(
      child: new Text('Male'),
      value: 0,
    ));
    genderList.add(new DropdownMenuItem(
      child: new Text('Female'),
      value: 1,
    ));
    genderList.add(new DropdownMenuItem(
      child: new Text('Other'),
      value: 2,
    ));
  }

  @override
  Widget build(BuildContext context) {
    loadGenderList();
    return Form(
        key: _formKey,
        child: new ListView(
          children: getFormWidget(),
        ));
  }

  List<Widget> getFormWidget() {
    List<Widget> formWidget = new List();

    formWidget.add(new DropdownButton(
      hint: new Text('Select Gender'),
      items: genderList,
      value: _selectedGender,
      onChanged: (value) {
        setState(() {
          _selectedGender = value;
        });
      },
      isExpanded: true,
    ));

    return formWidget;
  }
}

class QRView extends StatefulWidget {
  const QRView({
    Key key,
    CameraFacing cameraFacing, void Function(QRViewController controller) onQRViewCreated, List<
        BarcodeFormat> formatsAllowed, QrScannerOverlayShape overlay,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _QRViewState();
}

class _QRViewState extends State<QRView> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode result;
  QRViewController controller;

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller.pauseCamera();
    } else if (Platform.isIOS) {
      controller.resumeCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 5,
            child: QRView(
              key: qrKey,
              onQRViewCreated: _onQRViewCreated,
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: (result != null)
                  ? Text(
                  'Barcode Type: ${describeEnum(result.format)}   Data: ${result.code}')
                  : Text('Scan a code'),
            ),
          )
        ],
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
      });
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}


//class QRView extends StatefulWidget {
//  const QRView({
//    Key key,
//    CameraFacing cameraFacing, void Function(QRViewController controller) onQRViewCreated, List<BarcodeFormat> formatsAllowed, QrScannerOverlayShape overlay,
//  }) : super(key: key);
//  @override
//  State<StatefulWidget> createState() => _QRViewState();
//}
////pubspec.yaml
//class _QRViewState extends State<QRView> {
//  Barcode result;
//  QRViewController controller;
//  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
//
//  @override
//  void reassemble() {
//    super.reassemble();
//    if (Platform.isAndroid) {
//      controller.pauseCamera();
//    } else if (Platform.isIOS) {
//      controller.resumeCamera();
//    }
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      body: Column(
//        children: <Widget>[
//          Expanded(flex: 4,
//              child: Container(
//                  height: MediaQuery.of(context).size.height * .65,
//                  child: _buildQrView(context)
//              )
//          ),
//          Expanded(
//            flex: 1,
//            child: FittedBox(
//              fit: BoxFit.contain,
//              child: Column(
//                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                children: <Widget>[
//                  if (result != null)
//                    Text(
//                        'Barcode Type: ${describeEnum(result.format)}   Data: ${result.code}')
//                  else
//                    Text('Scan a code'),
//                  Row(
//                    mainAxisAlignment: MainAxisAlignment.center,
//                    crossAxisAlignment: CrossAxisAlignment.center,
//                    children: <Widget>[
//                      Container(
//                        margin: EdgeInsets.all(8),
//                        child: RaisedButton(
//                            onPressed: () => setState(() {
//                              controller?.toggleFlash();
//                            }),
//                            child: FutureBuilder(
//                              future: controller?.getFlashStatus(),
//                              builder: (context, snapshot) {
//                                return Text('Flash: ${snapshot.data}');
//                              },
//                            )),
//                      ),
//                      Container(
//                        margin: EdgeInsets.all(8),
//                        child: RaisedButton(
//                            onPressed: () => setState(() {
//                              controller?.flipCamera();
//                            }),
//                            child: FutureBuilder(
//                              future: controller?.getCameraInfo(),
//                              builder: (context, snapshot) {
//                                if (snapshot.data != null) {
//                                  return Text(
//                                      'Camera facing ${describeEnum(snapshot.data)}');
//                                } else {
//                                  return Text('loading');
//                                }
//                              },
//                            )),
//                      )
//                    ],
//                  ),
//                  Row(
//                    mainAxisAlignment: MainAxisAlignment.center,
//                    crossAxisAlignment: CrossAxisAlignment.center,
//                    children: <Widget>[
//                      Container(
//                        margin: EdgeInsets.all(8),
//                        child: RaisedButton(
//                          onPressed: () {
//                            controller?.pauseCamera();
//                          },
//                          child: Text('pause', style: TextStyle(fontSize: 20)),
//                        ),
//                      ),
//                      Container(
//                        margin: EdgeInsets.all(8),
//                        child: RaisedButton(
//                          onPressed: () {
//                            controller?.resumeCamera();
//                          },
//                          child: Text('resume', style: TextStyle(fontSize: 20)),
//                        ),
//                      )
//                    ],
//                  ),
//                ],
//              ),
//            ),
//          )
//        ],
//      ),
//    );
//  }

//  Widget _buildQrView(BuildContext context) {
//    var scanArea = (MediaQuery.of(context).size.width < 400 ||
//        MediaQuery.of(context).size.height < 400)
//        ? 150.0
//        : 300.0;
//    return QRView(
//      key: qrKey,
//      cameraFacing: CameraFacing.front,
//      onQRViewCreated: _onQRViewCreated,
//      formatsAllowed: [BarcodeFormat.qrcode],
//      overlay: QrScannerOverlayShape(
//        borderColor: Colors.red,
//        borderRadius: 10,
//        borderLength: 30,
//        borderWidth: 10,
//        cutOutSize: scanArea,
//      ),
//    );
//  }
//
//  void _onQRViewCreated(QRViewController controller) {
//    setState(() {
//      this.controller = controller;
//    });
//    controller.scannedDataStream.listen((scanData) {
//      setState(() {
//        result = scanData;
//      });
//    });
//  }
//
//  @override
//  void dispose() {
//    controller.dispose();
//    super.dispose();
//  }
//}

Future<String> get _localPath async {
  final directory = await getApplicationDocumentsDirectory();

  return directory.path;
}
Future<File> get _localFile async {
  final path = await _localPath;
  return File('$path/counter.txt');
}

Future<File> writeCounter(int counter) async {
  final file = await _localFile;
  return file.writeAsString('$counter');
}