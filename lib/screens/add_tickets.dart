import 'package:flutter/material.dart';
import 'package:mobile_trip_planner/database_helpers/reservations_database_helper.dart';
import 'package:mobile_trip_planner/models/reservation_model.dart';
import 'package:mobile_trip_planner/models/tripinfo_model.dart';
import 'package:mobile_trip_planner/screens/ticket_view.dart';
import 'package:mobile_trip_planner/widgets/bottomsheet_input_widget.dart';
import 'package:mobile_trip_planner/widgets/checklist_item_widget_dismissible.dart';
import 'package:mobile_trip_planner/widgets/my_app_bar.dart';
import 'package:mobile_trip_planner/widgets/next_screen_tile.dart';
import 'package:mobile_trip_planner/widgets/saved_snack_bar.dart';

class AddTicketsScreen extends StatefulWidget {
  Tripinfo tripinfo;

  AddTicketsScreen({Key? key, required this.tripinfo}) : super(key: key);

  @override
  _AddTicketsScreenState createState() => _AddTicketsScreenState();
}

class _AddTicketsScreenState extends State<AddTicketsScreen> {
  bool isLoading = false;
  String _text = "";
  final _myController = TextEditingController();
  late List<Reservation> _tickets = [];

  @override
  void initState() {
    super.initState();
    loadItems();
  }

  Future loadItems() async {
    setState(() => isLoading = true);
    _tickets = await ReservationsDatabaseHelper.instance.readAllReservations(widget.tripinfo.travelId as int);
    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyAppBar('Dodaj bilety i rezerwacje', Icon(Icons.add), () {
          showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              builder: (BuildContext context) {
                return Padding(
                  padding: MediaQuery.of(context).viewInsets,
                  child: BottomsheetInputWidget(
                    hintText: 'Nazwa biletu',
                    controller: _myController,
                    onPressedFunction: () {
                      _text = _myController.text;
                      ReservationsDatabaseHelper.instance.create(Reservation(
                          title: _text,
                          imagePath: 'lib/assets/images/code.png',
                          travelId: widget.tripinfo.travelId as int));
                      _myController.clear();
                      loadItems();
                      Navigator.pop(context, _text);
                    },
                    onWillPopFunction: () {
                      _myController.clear();
                      loadItems();
                      Navigator.pop(context, _text);
                      throw Exception();
                    },
                  ),
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
                        //setState(() {
                        //_tickets.removeAt(index);
                        ReservationsDatabaseHelper.instance
                            .delete(ticket.reservationId);
                        //});
                      },
                      child: NextScreenTile(
                          title: ticket.title,
                          icon: Icon(
                            Icons.account_box_outlined,
                            color: Theme.of(context).accentColor,
                          ),
                          function: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        TicketView(ticket: ticket)));
                          }));
                },
              ),
            ),
          ],
        ));
  }
}
