import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeleton_app/styles/Colors.dart';
import 'package:thebase_app/config.dart';
import 'package:thebase_app/generated/models/customers.dart';
import 'package:thebase_app/managers/blocs/AuthBloc.dart';
import 'package:thebase_app/managers/blocs/AuthState.dart';
import 'package:thebase_app/ui/components/buttons/RoundedButton.dart';
import 'package:thebase_app/ui/styles/Colors.dart';
import 'package:thebase_app/services/provide.dart';

class TextFormProfile extends StatefulWidget {
  @override
  _TextFormProfileState createState() => _TextFormProfileState();
}

class _TextFormProfileState extends State<TextFormProfile> {
  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController phoneController = TextEditingController();

    nameController.text = context.blocs.auth.state.user.profile.displayName;
    emailController.text = context.blocs.auth.state.user.email;
    phoneController.text = context.blocs.auth.state.user.profile.phoneNumber;

    return BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
      return Center(
          child: Container(
            width: 250,
            child: Column(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
              Text('Name: ', style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.normal, color: Colors.black)),
              TextFormField(
                controller: nameController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(color: TheBaseColors.lightGreen),
                  ),
                ),
                // InputField()
              ),
              /*SizedBox(
            height: 10,
          ),
          Text('Email:', style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.normal, color: Colors.black)),
          TextFormField(
            controller: emailController,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              border: UnderlineInputBorder(
                borderSide: BorderSide(color: TheBaseColors.lightGreen),
              ),
            ),
            // InputField()
          ),*/
              SizedBox(
                height: 10,
              ),
              Text('Phone:', style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.normal, color: Colors.black)),
              TextFormField(
                controller: phoneController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(color: TheBaseColors.lightGreen),
                  ),
                ),
                // InputField()
              ),
              SizedBox(
                height: 10,
              ),
              Text('Date of Birth:', style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.normal, color: Colors.black)),
              TextField(
                keyboardType: TextInputType.datetime,
                decoration: InputDecoration(
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(color: TheBaseColors.lightGreen),
                  ),
                ),
                // InputField()
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Type of diet:',
                    style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.normal, color: Colors.black),
                  ),
                  DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      items: <String>['vegetarian', 'vegan', 'pescatarian', 'omnivore'].map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          value = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () async {
                  var userAccount = await context.api.customersApi.accounts.putProfile(
                      defaultOrganisationId,
                      context.blocs.auth.state.user.id,
                      CustomerAccountProfile(nameController.value.text, context.blocs.auth.state.user.profile.avatar, phoneController.value.text,
                          context.blocs.appConfig.phoneLocale.languageCode));

                  // update the current user
                  context.blocs.auth.updateUserAccount(userAccount.data);

                  Navigator.pushNamed(context, '/informationSaved');
                },
                child: Container(
                    height: 40.0,
                    width: 150.0,
                    margin: EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.black,
                    ),
                    child: Center(
                      child: Text('Save', style: Theme.of(context).textTheme.headline6),
                    )),
              ),
            ]),
          ));
    });
  }
}
