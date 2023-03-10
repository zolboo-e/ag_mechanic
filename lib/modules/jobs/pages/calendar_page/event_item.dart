import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '/models/job.dart';

class EventItem extends StatelessWidget {
  const EventItem({super.key, required this.data});

  final Job data;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 12.0,
        vertical: 4.0,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: data.status.color,
          width: 1.5,
        ),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: ListTile(
        onTap: () => context.push('/jobs/${data.id}'),
        leading: Icon(
          data.status.icon,
          color: data.status.color,
        ),
        trailing: Icon(
          Icons.chevron_right,
          color: data.status.color,
        ),
        subtitle: Text(
          '${DateFormat('yyyy/MM/dd HH:mm').format(data.bookedStart)} - ${data.bookedEnd.hour}:${data.bookedEnd.minute.toString().padLeft(2, '0')}',
          style: TextStyle(color: data.status.color),
        ),
        title: Text(
          data.booking.vehicle.plateNumber,
          style: TextStyle(color: data.status.color),
        ),
      ),
    );
  }
}
