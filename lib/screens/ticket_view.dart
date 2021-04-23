import 'package:flutter/material.dart';
import 'package:mobile_trip_planner/models/ticket_model.dart';
import 'package:mobile_trip_planner/widgets/my_app_bar.dart';

class TicketView extends StatelessWidget {
  final Ticket ticket;

  TicketView(this.ticket);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar.withoutIcons(ticket.title),
      backgroundColor: Theme.of(context).backgroundColor,
      body: Column(children: [
        SizedBox(height: 5),
        Container(
          width: double.infinity,
          height: 300,
          child: Card(
            color: Theme.of(context).primaryColor,
            child: Container(child: 
              ticket.image,
            ),
          ),
        )
      ],),
    );
  }
}