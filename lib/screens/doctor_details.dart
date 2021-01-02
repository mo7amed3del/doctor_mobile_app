import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_4/models/doctor.dart';

class DoctorDetails extends StatelessWidget{
  Doctor doctor;
  int _selectedItem = 0;
  DoctorDetails(this.doctor);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Doctor Details'),
      ),
      bottomNavigationBar: bottomNavBar(),
      body: Column(
        children: [
          Row(
            children: [
              // Image.asset('assets/images/1.jpg'),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  // child: Image.asset('assets/images/1.jpg'),
                  backgroundImage: AssetImage(doctor.urlPhoto),
                  radius: 65,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        doctor.name,
                        style: TextStyle(
                          fontSize: 22,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    doctor.speciality,
                    style: TextStyle(
                        color: Color(0xff07da5f),
                        fontSize: 20,
                        fontStyle: FontStyle.italic),
                  ),
                ],
              )
            ],
          ),
      Padding( padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text('short description',
                  textAlign: TextAlign.left,
                  style: TextStyle (
                      fontSize: 22,
                      fontWeight: FontWeight.bold
                  ),

                ),

              ],
            )

          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text(doctor.shortDescription,
                  style: TextStyle (
                      fontSize: 20,
                      color: Color(0x770000000)
                  ),

                )
              ],
            ),

          ),
          Padding(
          padding: const EdgeInsets.fromLTRB(8.0,50.0,8.0,8.0),
              child: Row(
                children: [
                  Text('Location',
                    textAlign: TextAlign.left,
                    style: TextStyle (
                        fontSize: 22,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ],
              )

          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8.0,12.0,8.0,8.0),
            child: Row(
              children: [
                Text(doctor.address,
                  style: TextStyle (
                      fontSize: 20,
                      color: Color(0x770000000)
                  ),

                )
              ],
            ),
          ),
          Row(
          children: [
          // Image.asset('assets/images/1.jpg'),
          Padding(
            padding: const EdgeInsets.fromLTRB(8.0,8.0,8.0,8.0),
          child: Image.asset('assets/images/map.jpg'),
          ),
        ],
      ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: RaisedButton(onPressed: (){},
                child: Text('Request',
                style: TextStyle(
                color: Colors.white)),
                color :Colors.green,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)
                ),padding: const EdgeInsets.fromLTRB(85.0,10.0,85.0,10.0),


            ),

          )
        ]
      ),
    );
  }


  Widget appBar() {
    return AppBar(
      title: Text('Doctor Details'),
      centerTitle: true,
      leading: IconButton(
        onPressed: () {},
        icon: Icon(
          Icons.arrow_back,
          color: Colors.white,
        ),
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.workspaces_filled),
          onPressed: () {},
          color: Colors.white,
        )
      ],
    );
  }
  Widget bottomNavBar() {
    return BottomNavigationBar(
      currentIndex: _selectedItem,
      onTap: (index) {
        /*setState(() {
          _selectedItem = index;
        });*/
      },
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.notification_important_sharp),
          label: 'Notification',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.calendar_today),
          label: 'Schedule',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_rounded),
          label: 'Profile',
        ),
      ],
    );
  }
}
