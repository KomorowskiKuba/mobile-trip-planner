import 'package:flutter/material.dart';

import 'package:mobile_trip_planner/models/ticket_model.dart';
import 'package:mobile_trip_planner/screens/ticket_view.dart';
import 'package:mobile_trip_planner/widgets/my_app_bar.dart';
import 'package:mobile_trip_planner/widgets/next_screen_tile.dart';

class AddTicketsScreen extends StatelessWidget {
  final List<Ticket> _tickets = [
    Ticket('Ticket 1', Image(image: AssetImage('lib/assets/images/paris.jpg'),)),
    Ticket('Ticket 2', Image(image: AssetImage('lib/assets/images/paris.jpg'),)),
    Ticket('Ticket 3', Image(image: AssetImage('lib/assets/images/paris.jpg'),)),
    Ticket('Ticket 4', Image(image: AssetImage('lib/assets/images/paris.jpg'),)),
    Ticket('Ticket 5', Image(image: AssetImage('lib/assets/images/paris.jpg'),)),
    Ticket('Ticket 6', Image(image: AssetImage('lib/assets/images/paris.jpg'),)),
    Ticket('Ticket 7', Image(image: AssetImage('lib/assets/images/paris.jpg'),)),
    Ticket('Ticket 8', Image(image: AssetImage('lib/assets/images/paris.jpg'),)),
    Ticket('Ticket 9', Image(image: AssetImage('lib/assets/images/paris.jpg'),)),
    Ticket('Ticket 10', Image(image: AssetImage('lib/assets/images/paris.jpg'),)),
    Ticket('Ticket 11', Image(image: AssetImage('lib/assets/images/paris.jpg'),)),
    Ticket('Ticket 12', Image(image: AssetImage('lib/assets/images/paris.jpg'),))
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar.withoutIcons('Dodaj bilety i rezerwacje'),
      backgroundColor: Theme.of(context).backgroundColor,
      body: SingleChildScrollView(
        child: Column(children: [
          SizedBox(
                height: 5,
          ),
            for (var currentTicket in _tickets) NextScreenTile(currentTicket.title, Icon(Icons.account_box_outlined, color: Theme.of(context).accentColor,), TicketView(currentTicket)), //TODO: Change icon to ticket icon
        ],),
      ),
    );
  }
}
