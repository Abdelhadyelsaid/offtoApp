import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:offto/Core/Const/colors.dart';
import 'package:offto/Features/Home/View/Widgets/button_widget.dart';

import '../../../../generated/l10n.dart';
import '../../Bloc/home_cubit.dart';

class GuestsBottomSheet extends StatelessWidget {
  const GuestsBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var tr = S.of(context);
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        final cubit = HomeCubit.get(context);
        return Container(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            // Wrap in SingleChildScrollView
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      tr.passengers_rooms,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    IconButton(
                      icon: Icon(Icons.close, color: Colors.grey),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                ),
                // Display rooms
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: cubit.rooms.length,
                  itemBuilder: (context, index) {
                    return _buildRoomControls(context, index);
                  },
                ),
                // Show Add Room button only if there's 1 room
                if (cubit.rooms.length < 4)
                  ElevatedButton(
                    onPressed: () {
                      cubit.addRoom();
                    },
                    child: Text("Add Room"),
                  ),
                const SizedBox(height: 16),
                DefaultButton(
                  textSize: 20,
                  borderRadius: BorderRadius.circular(10),
                  onTap: () {
                    Navigator.pop(context);
                  },
                  height: 50.h,
                  color: buttonColor,
                  text: tr.done,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildRoomControls(BuildContext context, int roomIndex) {
    final cubit = context.read<HomeCubit>();
    final room = cubit.rooms[roomIndex];

    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Room ${roomIndex + 1}"),
                if (roomIndex > 0) // Show close button from room 2 onward
                  IconButton(
                    icon: Icon(Icons.close, color: Colors.grey),
                    onPressed: () {
                      cubit
                          .removeRoom(roomIndex); // Function to remove the room
                    },
                  ),
              ],
            ),
            _buildCounter(
              context,
              "Adult",
              "Above 11 Year",
              'adults',
              roomIndex,
            ),
            _buildCounter(
              context,
              "Child",
              "2-11 Years",
              'children',
              roomIndex,
            ),
            _buildCounter(
              context,
              "Infant",
              "Less than 1 Year",
              'infants',
              roomIndex,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCounter(
    BuildContext context,
    String title,
    String subtitle,
    String type,
    int roomIndex,
  ) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        final cubit = context.read<HomeCubit>();
        int count;

        // Get the correct count based on the type
        switch (type) {
          case 'adults':
            count = cubit.rooms[roomIndex].adults;
            break;
          case 'children':
            count = cubit.rooms[roomIndex].children;
            break;
          case 'infants':
            count = cubit.rooms[roomIndex].infants;
            break;
          default:
            count = 0;
        }

        return ListTile(
          title: Text(title),
          subtitle: Text(subtitle),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Decrement button
              IconButton(
                icon: const Icon(Icons.remove),
                onPressed: () {
                  switch (type) {
                    case 'adults':
                      cubit.decrementAdult(roomIndex);
                      break;
                    case 'children':
                      cubit.decrementChild(roomIndex);
                      break;
                    case 'infants':
                      cubit.decrementInfant(roomIndex);
                      break;
                  }
                },
              ),
              // Display the count
              Text('$count'),
              // Increment button
              IconButton(
                icon: const Icon(Icons.add),
                onPressed: () {
                  switch (type) {
                    case 'adults':
                      cubit.incrementAdult(roomIndex);
                      break;
                    case 'children':
                      cubit.incrementChild(roomIndex);
                      break;
                    case 'infants':
                      cubit.incrementInfant(roomIndex);
                      break;
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
