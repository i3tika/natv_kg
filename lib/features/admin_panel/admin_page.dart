import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:natv_kg/features/admin_panel/ui/commonWidget/add_channel.dart';
import 'package:natv_kg/features/admin_panel/ui/commonWidget/channel_card.dart';

import 'bloc/save_channel_bloc.dart';


class AdminPage extends StatefulWidget {
  const AdminPage({super.key});

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 186, 4, 4),
          title: const Text(
            'Admin Panel',
            style: TextStyle(
                fontSize: 25, fontWeight: FontWeight.w700, color: Colors.white),
          ),
          elevation: 0.4),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: BlocBuilder<SaveChannelBloc, SaveChannelState>(
              builder: (context, state) {
                if (state is SaveChannelGet) {
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: state.channels.length,
                    itemBuilder: (context, index) => ChannelCard(
                      id: state.channels[index].id,
                      channelName: state.channels[index].channelName,
                      logo: state.channels[index].logo ?? '',
                      pricePerLetter: state.channels[index].pricePerLetter,
                    ),
                  );
                } 
                return const Text('Not found');
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const AddChannel(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
