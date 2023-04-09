import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:intl/intl.dart';

import '../theme/app_colors.dart';

class ChannelListContainer extends StatefulWidget {
  const ChannelListContainer({
    super.key,
    required this.logo,
    required this.channelName,
    required this.id,
  });
  final String logo;
  final String channelName;
  final int id;

  @override
  State<ChannelListContainer> createState() => _ChannelListContainerState();
}

class _ChannelListContainerState extends State<ChannelListContainer> {
  String _range = '';

  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    setState(() {
      if (args.value is PickerDateRange) {
        _range = '${DateFormat('dd/MM/yyyy').format(args.value.startDate)} -'
            ' ${DateFormat('dd/MM/yyyy').format(args.value.endDate ?? args.value.startDate)}';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      height: 150,
      child: Stack(
        children: [
          Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 140,
                      height: 70,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.grey, width: 1.0),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Image.network(
                          widget.logo,
                          width: 250,
                          height: 250,
                        ),
                        // child: Image.network(
                        //   widget.logo == "" || widget.logo == "string"
                        //       ? 'https://natv.kg/static/user/ima/logo.png'
                        //       : widget.logo ??
                        //           'https://natv.kg/static/user/ima/logo.png',
                        //   width: 80,
                        //   height: 40,
                        // ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Text(widget.id.toString()),
                  Text(
                    widget.channelName,
                    style: const TextStyle(fontSize: 15),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    width: 400,
                    height: 35,
                    decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(color: AppColors.grey, spreadRadius: 1),
                        ]),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: Text(_range),
                        ),
                        IconButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                actions: [
                                  SizedBox(
                                    height: 500,
                                    child: Stack(
                                      children: <Widget>[
                                        Positioned(
                                          left: 0,
                                          right: 0,
                                          top: 0,
                                          height: 80,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Text('Select range: ${_range}'),
                                            ],
                                          ),
                                        ),
                                        Positioned(
                                          left: 0,
                                          top: 40,
                                          right: 0,
                                          bottom: 0,
                                          child: SfDateRangePicker(
                                            confirmText: 'Сохранить',
                                            cancelText: 'Отмена',
                                            startRangeSelectionColor:
                                                Colors.red,
                                            endRangeSelectionColor: Colors.red,
                                            todayHighlightColor: Colors.red,
                                            rangeSelectionColor:
                                                const Color.fromARGB(
                                                    255, 238, 150, 144),
                                            selectionTextStyle: const TextStyle(
                                                color: Colors.white),
                                            rangeTextStyle: const TextStyle(
                                                color: Colors.white),
                                            showActionButtons: true,
                                            onSubmit: (p0) {
                                              Navigator.pop(context);
                                            },
                                            onCancel: () {
                                              Navigator.pop(context);
                                            },
                                            onSelectionChanged:
                                                _onSelectionChanged,
                                            selectionMode:
                                                DateRangePickerSelectionMode
                                                    .range,
                                            initialSelectedRange:
                                                PickerDateRange(
                                              DateTime.now().subtract(
                                                  const Duration(days: 4)),
                                              DateTime.now().add(
                                                const Duration(days: 5),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                          icon: const Padding(
                            padding: const EdgeInsets.only(bottom: 5),
                            child: const Icon(Icons.calendar_month),
                          ),
                        ),
                      ],
                    )),
              ),
            ],
          )
        ],
      ),
    );
  }
}
