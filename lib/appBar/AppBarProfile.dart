import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeleton_app/styles/Colors.dart';
import 'package:thebase_app/config.dart';
import 'package:thebase_app/generated/models/customers.dart';
import 'package:thebase_app/managers/blocs/AuthBloc.dart';
import 'package:thebase_app/managers/blocs/AuthState.dart';
import 'package:thebase_app/ui/styles/Colors.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'dart:convert';
import 'package:thebase_app/services/provide.dart';

class AppBarProfile extends StatefulWidget implements PreferredSizeWidget {
  final Widget firstIcon, child;
  final String title;
  final double childHeight;

  const AppBarProfile({
    Key key,
    @required this.firstIcon,
    @required this.title,
    this.childHeight,
    this.child,
    @required this.preferredSize,
  }) : super(key: key);

  @override
  final Size preferredSize;

  @override
  _AppBarProfileState createState() => _AppBarProfileState();
}

class _AppBarProfileState extends State<AppBarProfile> {
  @override
  Widget build(BuildContext context) {
    _imgFromCamera() async {
      var image = await ImagePicker.pickImage(
          source: ImageSource.camera, imageQuality: 50);
    }

    _imgFromGallery() async {
      var image = await ImagePicker.pickImage(
          source: ImageSource.gallery, imageQuality: 50);
      var encoded = base64.encode(image.readAsBytesSync());

      var userAccount = await context.api.customersApi.accounts
          .uploadProfileImage(defaultOrganisationId,
          context.blocs.auth.state.user.id, ImageUploadRequest(encoded));

      // update the current user
      context.blocs.auth.updateUserAccount(userAccount.data);
    }

    void _showPicker(BuildContext context) {
      showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
        ),
        context: context,
        builder: (builder) {
          return Container(
            decoration: BoxDecoration(
              color: TheBaseColors.lightGreen,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.0),
                topRight: Radius.circular(10.0),
              ),
            ),
            child: Wrap(
              children: [
                ListTile(
                    leading: Icon(
                      Icons.image_outlined,
                      color: Colors.black,
                    ),
                    title: Text(
                      'My Library',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 18.0,
                      ),
                    ),
                    onTap: () {
                      _imgFromGallery();
                      Navigator.of(context).pop();
                    }),
                ListTile(
                  leading: Icon(
                    Icons.camera_alt_outlined,
                    color: Colors.black,
                  ),
                  title: Text(
                    'Camera',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 18.0,
                    ),
                  ),
                  onTap: () {
                    _imgFromCamera();
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          );
        },
      );
    }

    const profileSize = 200;
    const backgroundHeight = 300.0;
    const widgetHeight = backgroundHeight + profileSize / 2;
    return Stack(
      children: <Widget>[
        ClipPath(
          clipper: _AppBarProfileClipper(widgetHeight),
          child: Container(
            padding: const EdgeInsets.only(top: 10.0),
            color: TheBaseColors.lightGreen,
            child: Stack(
              children: <Widget>[
                Container(
                  color: TheBaseColors.lightGreen,
                  height: backgroundHeight,
                  width: double.infinity,
                ),
                Align(
                  alignment: Alignment(0.0, 0.2),
                  child: Container(
                    //margin: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.black, width: 4),
                    ),
                    child: GestureDetector(
                      onTap: () {
                        _showPicker(context);
                      },
                      child: BlocBuilder<AuthBloc, AuthState>(
                          builder: (context, state) => CircleAvatar(
                            radius: 55,
                            backgroundColor: TheBaseColors.lightGreen,
                            child: state.user.profile.avatar.publicUrl !=
                                null
                                ? ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: Image.network(
                                state.user.profile.avatar.publicUrl,
                                width: 120,
                                height: 120,
                                fit: BoxFit.fitHeight,
                              ),
                            )
                                : Container(
                              decoration: BoxDecoration(
                                  color: TheBaseColors.lightGreen,
                                  borderRadius:
                                  BorderRadius.circular(50)),
                              width: 50,
                              height: 50,
                              child: Icon(
                                Icons.camera_alt,
                                color: Colors.black,
                              ),
                            ),
                          )),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment(0, -0.8),
                  child: Text(
                    widget.title,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 24),
                  ),
                ),
                Align(
                  alignment: Alignment(-0.9, -0.9),
                  child: widget.firstIcon,
                ),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 60, //50
          left: 0,
          right: 0,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: widget.child,
          ),
        ),
      ],
    );
  }
}

class _AppBarProfileClipper extends CustomClipper<Path> {
  final double childHeight;

  _AppBarProfileClipper(this.childHeight);

  @override
  Path getClip(Size size) {
    var path = Path();
    path.moveTo(0, size.height - 40.0);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 40.0);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
