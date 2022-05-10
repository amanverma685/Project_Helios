import 'package:flutter/material.dart';
import 'package:helios/Constants/Constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocationModalBottomSheet extends StatefulWidget {
  final Function addLocation;
  LocationModalBottomSheet({Key? key, required this.addLocation})
      : super(key: key);

  @override
  _LocationModalBottomSheetState createState() =>
      _LocationModalBottomSheetState();
}

class _LocationModalBottomSheetState extends State<LocationModalBottomSheet> {
  Color activeColor = Colors.green;

  final TextEditingController locationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: MediaQuery.of(context).viewInsets,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 10,
              ),
              Text(
                "Please add your Delivery Location",
                style: TextStyle(color: Colors.green, fontSize: 18),
              ),
              Container(
                height: 250,
                child: ListView.builder(
                  itemCount: locationList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      leading: Icon(
                        Icons.add_location_rounded,
                        color: activeColor,
                      ),
                      trailing: Icon(
                        Icons.verified_outlined,
                        color: activeColor,
                      ),
                      title: Text(locationList[index]),
                      onTap: () async {
                        widget.addLocation(locationList[index]);

                        SharedPreferences myPrefs =
                            await SharedPreferences.getInstance();
                        myPrefs.setString(
                            'defaultLocation', locationList[index]);
                        print(myPrefs.getString('defaultLocation'));
                        Navigator.pop(context);
                      },
                    );
                  },
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: Form(
              //     key: _formKey,
              //     child: TextFormField(
              //       controller: locationController,
              //       keyboardType: TextInputType.streetAddress,
              //       decoration: InputDecoration(
              //         icon: Icon(Icons.home_filled),
              //         hintText: 'Want to add address',
              //         labelText: 'address',
              //       ),
              //       validator: (value) {
              //         if (value!.isEmpty) {
              //           return 'Please enter your full address';
              //         }
              //         return null;
              //       },
              //     ),
              //   ),
              // ),
              // Center(
              //   child: ElevatedButton(
              //     child: Text('Add Address'),
              //     onPressed: () async {
              //       FocusScope.of(context).requestFocus(FocusNode());
              //       if (_formKey.currentState!.validate()) {
              //
              //         Navigator.pop(context);
              //       }
              //     },
              //   ),
              // ),
              SizedBox(
                height: 40,
              )
            ],
          ),
        ),
      ),
    );
  }
}
