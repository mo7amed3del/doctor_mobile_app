import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_4/models/doctor.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'dart:math';

import 'doctor_list.dart';

class DoctorDetails extends StatelessWidget {
  Doctor doctor;
  int _selectedItem = 0;
  DoctorDetails(this.doctor);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Text('Doctor Details'),
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => DoctorList()));
            },
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
        ),
        bottomNavigationBar: bottomNavBar(),
        body: ListView(
          children: [Detalis(doctor: doctor, size: size)],
        ));
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

class Detalis extends StatelessWidget {
  const Detalis({
    Key key,
    @required this.doctor,
    @required this.size,
  }) : super(key: key);

  final Doctor doctor;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
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
                    Divider(
                      color: Colors.black12,
                      height: 10,
                      thickness: 1,
                      indent: 20,
                      endIndent: 25,
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SmoothStarRating(
                              starCount: 5,
                              color: Colors.yellow,
                              rating: doctor.rating,
                              isReadOnly: true),
                        ),
                        Text(
                          doctor.rating.toString(),
                          style: TextStyle(fontSize: 18, color: Color(0x770000000)),
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
            Divider(
              color: Colors.black12,
              height: 10,
              thickness: 1,
              indent: 20,
              endIndent: 25,
            ),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      'short description',
                      textAlign: TextAlign.left,
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                  ],
                )),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    doctor.shortDescription,
                    style: TextStyle(fontSize: 18, color: Color(0x770000000)),
                  )
                ],
              ),
            ),
            Padding(
                padding: const EdgeInsets.fromLTRB(8.0, 45.0, 8.0, 8.0),
                child: Row(
                  children: [
                    Text(
                      'Location',
                      textAlign: TextAlign.left,
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                  ],
                )),
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 12.0, 8.0, 8.0),
              child: Row(
                children: [
                  Icon(
                    Icons.add_location,
                    color: Colors.red,
                  ),
                  Text(
                    doctor.address,
                    style: TextStyle(fontSize: 18, color: Color(0x770000000)),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Center(
                child: SizedBox(
                  child: Image.asset('assets/images/map.jpg',
                      height: size.height / 4, width: size.width * 2),
                  height: size.height/5,
                  width: size.width * 2,
                )
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: SizedBox(
                width: size.width,
                height: 55,
                child: RaisedButton(
                  child: Text(
                    "Request",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                  onPressed: () {},
                  color: Color(0xff07da5f),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                ),
              ),
            )
          ]),
    );
  }
}
