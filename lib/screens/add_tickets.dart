import 'package:flutter/material.dart';
import 'package:mobile_trip_planner/models/ticket_model.dart';
import 'package:mobile_trip_planner/screens/ticket_view.dart';
import 'package:mobile_trip_planner/widgets/checklist_item_widget_dismissible.dart';
import 'package:mobile_trip_planner/widgets/my_app_bar.dart';
import 'package:mobile_trip_planner/widgets/next_screen_tile.dart';

class AddTicketsScreen extends StatefulWidget {
  @override
  _AddTicketsScreenState createState() => _AddTicketsScreenState();
}

class _AddTicketsScreenState extends State<AddTicketsScreen> {
  final List<Ticket> _tickets = [
    Ticket(
        'Ticket 1',
        Image(
          image: AssetImage('lib/assets/images/paris.jpg'),
        )),
    Ticket(
        'Ticket 2',
        Image(
          image: AssetImage('lib/assets/images/paris.jpg'),
        )),
    Ticket(
        'Ticket 3',
        Image(
          image: AssetImage('lib/assets/images/paris.jpg'),
        )),
    Ticket(
        'Ticket 4',
        Image(
          image: AssetImage('lib/assets/images/paris.jpg'),
        )),
    Ticket(
        'Ticket 5',
        Image(
          image: AssetImage('lib/assets/images/paris.jpg'),
        ))
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyAppBar.withoutIcons('Dodaj bilety i rezerwacje'),
        backgroundColor: Theme.of(context).backgroundColor,
        body: Column(
          children: [
            SizedBox(
              height: 5,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _tickets.length,
                itemBuilder: (context, index) {
                  final ticket = _tickets[index];

                  return Dismissible(
                      direction: DismissDirection.startToEnd,
                      background: DismissibleItemBackground(),
                      key: Key(ticket.title),
                      onDismissed: (direction) {
                        setState(() {
                          _tickets.removeAt(index);
                        });
                      },
                      child: NextScreenTile(
                          ticket.title,
                          Icon(
                            Icons.account_box_outlined,
                            color: Theme.of(context).accentColor,
                          ),
                          TicketView(ticket)));
                },
              ),
            ),
          ],
        ));
  }
}
