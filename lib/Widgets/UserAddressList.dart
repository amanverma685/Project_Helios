import 'package:flutter/material.dart';
import 'package:helios/Constants/Constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Expansiontile extends StatefulWidget {
  @override
  _ExpansiontileState createState() => _ExpansiontileState();
}

class _ExpansiontileState extends State<Expansiontile> {
  String selectedLocation = "Please add a location...";
  void addDefaultLocation() async {
    if (locationList.isEmpty) {
      selectedLocation = "Please select location";
      SharedPreferences defaultLocation = await SharedPreferences.getInstance();
      if (defaultLocation.getString('selectedDefaultLocation') != null) {
        selectedLocation =
            defaultLocation.getString('selectedDefaultLocation')!;
      }
    }
  }

  @override
  void initState() {
    addDefaultLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: Column(
        children: <Widget>[
          SizedBox(height: 5.0),
          ExpansionTile(
            trailing: Icon(Icons.add),
            leading: Icon(Icons.location_on),
            title: Text(
              selectedLocation,
              style: TextStyle(fontSize: 15.0),
            ),
            children: <Widget>[
              ListView.builder(
                itemCount: locationList.length,
                itemBuilder: (context, index) => Padding(
                  padding: EdgeInsets.only(left: 5, right: 5),
                  child: ListTile(
                    leading: Icon(Icons.home),
                    title: selectedLocation != "Please add a location..."
                        ? Text(selectedLocation)
                        : Text("Please add your Location"),
                    selectedTileColor: Colors.amber,
                    onTap: () async {
                      selectedLocation = locationList[index];
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      prefs.setString(
                          'selectedDefaultLocation', locationList[index]);
                      setState(() {});
                    },
                  ),
                ),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
