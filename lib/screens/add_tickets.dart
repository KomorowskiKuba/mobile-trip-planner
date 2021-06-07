import 'package:flutter/material.dart';
import 'package:mobile_trip_planner/models/reservation_model.dart';
import 'package:mobile_trip_planner/screens/ticket_view.dart';
import 'package:mobile_trip_planner/widgets/bottomsheet_input_widget.dart';
import 'package:mobile_trip_planner/widgets/checklist_item_widget_dismissible.dart';
import 'package:mobile_trip_planner/widgets/my_app_bar.dart';
import 'package:mobile_trip_planner/widgets/next_screen_tile.dart';

class AddTicketsScreen extends StatefulWidget {
  @override
  _AddTicketsScreenState createState() => _AddTicketsScreenState();
}

class _AddTicketsScreenState extends State<AddTicketsScreen> {
  String _text = "";
  final _myController = TextEditingController();
  final List<Reservation> _tickets = [
    Reservation(
        travelId: 1,
        title: 'Ticket 1',
        imagePath: 'lib/assets/images/paris.jpg'),
    Reservation(
        travelId: 1,
        title: 'Ticket 2',
        imagePath: 'lib/assets/images/paris.jpg'),
    Reservation(
        travelId: 1,
        title: 'Ticket 3',
        imagePath: 'lib/assets/images/paris.jpg'),
    Reservation(
        travelId: 1,
        title: 'Ticket 4',
        imagePath: 'lib/assets/images/paris.jpg'),
  ];

  _saveItem(String ticketName) async {
    setState(() {
      _tickets.add(Reservation(
          title: ticketName,
          imagePath: 'lib/assets/images/paris.jpg',
          travelId: 1));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyAppBar('Dodaj bilety i rezerwacje', Icon(Icons.add), () {
          showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              builder: (BuildContext context) {
                return BottomsheetInputWidget(
                  hintText: 'Nazwa biletu',
                  controller: _myController,
                  onPressedFunction: () {
                    _text = _myController.text;
                    _saveItem(_text);
                    _myController.clear();
                    Navigator.pop(context, _text);
                  },
                  onWillPopFunction: () {
                    _myController.clear();
                    Navigator.pop(context, _text);
                    throw Exception();
                  },
                );
              });
        }),
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
                          TicketView(ticket: ticket)));
                },
              ),
            ),
          ],
        ));
  }
}
