import 'dart:io';

import 'package:camera/camera.dart';
import 'package:gopher_eye/provider/camera_provider.dart';
import 'package:flutter/material.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:provider/provider.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  State<StatefulWidget> createState() => _CameraStack();
}

class _CameraStack extends State<StatefulWidget> {
  XFile? image;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Consumer<CameraProvider>(builder: (context, provider, child) {
          if (!provider.isInitialized) {
            provider.initializeCameras();
            return const Center(child: CircularProgressIndicator());
          }
          if (image == null) {
            return Center(
              child: Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 0.0),
                  child: Column(
                    children: [
                      Column(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              //* flash button row
                              Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    10.0, 20.0, 10.0, 0.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    IconButton(
                                      icon: Icon(
                                        provider.isFlashOn
                                            ? Icons.flash_on
                                            : Icons.flash_off,
                                        color: Colors.white,
                                      ),
                                      onPressed: provider.toggleFlash,
                                    ),
                                    const Icon(
                                      Icons.settings_rounded,
                                      color: Colors.white,
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                          Stack(
                            children: [
                              CameraPreview(provider.controller!),
                              Positioned(
                                bottom: 0,
                                right: 20,
                                left: 20,
                                child: Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      36, 35, 36, 0.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border(
                                              bottom: BorderSide(
                                                  color: Colors.white,
                                                  width: 1.0),
                                              left: BorderSide(
                                                  color: Colors.white,
                                                  width: 1.0),
                                              right: BorderSide(
                                                  color: Colors.white,
                                                  width: 1.0),
                                              top: BorderSide(
                                                  color: Colors.white,
                                                  width: 1.0)),
                                        ),
                                        child: Center(
                                          child: Padding(
                                            padding: const EdgeInsets.all(2.0),
                                            child: IconButton(
                                              icon: const Icon(
                                                Icons.photo_library,
                                                color: Colors.white,
                                                size: 30,
                                              ),
                                              onPressed: () async {
                                                await provider.galleryImage();
                                                image = provider.pickedImage;
                                              },
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            border: Border(
                                                bottom: BorderSide(
                                                    color: Colors.white,
                                                    width: 2.0),
                                                left: BorderSide(
                                                    color: Colors.white,
                                                    width: 2.0),
                                                right: BorderSide(
                                                    color: Colors.white,
                                                    width: 2.0),
                                                top: BorderSide(
                                                    color: Colors.white,
                                                    width: 2.0))),
                                        child: Center(
                                          child: Padding(
                                            padding: const EdgeInsets.all(2.0),
                                            child: IconButton(
                                              icon: const Icon(
                                                Icons.camera_alt_rounded,
                                                color: Colors.white,
                                                size: 40,
                                              ),
                                              onPressed: () async {
                                                await provider.capture();
                                                image = provider.pickedImage;
                                              },
                                            ),
                                          ),
                                        ),
                                      ),
                                      IconButton(
                                        icon: const Icon(
                                          Icons.loop_rounded,
                                          color: Colors.white,
                                          size: 40,
                                        ),
                                        onPressed: provider.switchCamera,
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  )),
            );
          } else {
            /*return Column(
              children: [
                SizedBox(
                    height: 100,
                    width: 100,
                    child: Image.file(File(image!.path)))
              ],
            ); */

            return Center(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10.0, 30.0, 10.0, 0.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.file(File(image!.path)),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(30, 30, 30, 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.red,
                                  border: Border(
                                      bottom: BorderSide(
                                          color: Colors.white, width: 2.0),
                                      left: BorderSide(
                                          color: Colors.white, width: 2.0),
                                      right: BorderSide(
                                          color: Colors.white, width: 2.0),
                                      top: BorderSide(
                                          color: Colors.white, width: 2.0))),
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: IconButton(
                                    icon: const Icon(
                                      Icons.close_rounded,
                                      color: Colors.white,
                                      size: 40,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        image = null;
                                      });
                                    },
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.green,
                                  border: Border(
                                      bottom: BorderSide(
                                          color: Colors.white, width: 2.0),
                                      left: BorderSide(
                                          color: Colors.white, width: 2.0),
                                      right: BorderSide(
                                          color: Colors.white, width: 2.0),
                                      top: BorderSide(
                                          color: Colors.white, width: 2.0))),
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: IconButton(
                                    icon: const Icon(
                                      Icons.check_rounded,
                                      color: Colors.white,
                                      size: 40,
                                    ),
                                    onPressed: () {
                                      GallerySaver.saveImage(image!.path);
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ]),
              ),
            );
          }
        }));
  }
}
