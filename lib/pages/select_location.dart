import 'package:world_clock/services/world_time.dart';
import 'package:flutter/material.dart';

class SelectLocation extends StatefulWidget {
  const SelectLocation({Key? key}) : super(key: key);

  @override
  State<SelectLocation> createState() => _SelectLocationState();
}

class _SelectLocationState extends State<SelectLocation> {
  List<WorldTime> locations = [
    WorldTime(url: 'Europe/London', location: 'London', flag: 'assets/uk.png'),
    WorldTime(
        url: 'Europe/Berlin', location: 'Athens', flag: 'assets/greece.png'),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'assets/egypt.png'),
    WorldTime(
        url: 'Africa/Nairobi', location: 'Nairobi', flag: 'assets/kenya.png'),
    WorldTime(
        url: 'America/Chicago', location: 'Chicago', flag: 'assets/usa.png'),
    WorldTime(
        url: 'America/New_York', location: 'New York', flag: 'assets/usa.png'),
    WorldTime(
        url: 'Asia/Seoul', location: 'Seoul', flag: 'assets/south_korea.png'),
    WorldTime(
        url: 'Asia/Jakarta', location: 'Jakarta', flag: 'assets/indonesia.png'),
    WorldTime(
        url: 'Asia/Dhaka', location: 'Dhaka', flag: 'assets/bangladesh.png'),
  ];

  void UpdateTime(index) async {
    WorldTime instance = locations[index];

    await instance.getTime();

    Navigator.pop(context, {
      'location': instance.location,
      'time': instance.time,
      'isDay': instance.isDay,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: const Text("Select Location"),
      ),
      body: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                onTap: () => UpdateTime(index),
                title: Text(locations[index].location),
                leading: CircleAvatar(
                  backgroundImage: AssetImage(locations[index].flag),
                ),
              ),
            );
          }),
    );
  }
}
