import 'package:devotional/src/common_widgets/constants/app_colors.dart';
import 'package:devotional/src/common_widgets/constants/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class WorshipCalendarDialog extends StatefulWidget {
  const WorshipCalendarDialog({super.key});

  @override
  State<WorshipCalendarDialog> createState() => _WorshipCalendarDialogState();
}

class _WorshipCalendarDialogState extends State<WorshipCalendarDialog> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Container(
          width: 400,
          height: 600,
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Worship Schedule',
                    style: AppStyles.serifDisplay.copyWith(
                      fontSize: 24,
                      color: AppColors.charcoalGrey,
                    ),
                  ),
                  IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: const Icon(Icons.close),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              TableCalendar(
                firstDay: DateTime.utc(2024, 1, 1),
                lastDay: DateTime.utc(2030, 12, 31),
                focusedDay: _focusedDay,
                calendarFormat: _calendarFormat,
                selectedDayPredicate: (day) {
                  return isSameDay(_selectedDay, day);
                },
                onDaySelected: (selectedDay, focusedDay) {
                  setState(() {
                    _selectedDay = selectedDay;
                    _focusedDay = focusedDay;
                  });
                },
                onFormatChanged: (format) {
                  if (_calendarFormat != format) {
                    setState(() {
                      _calendarFormat = format;
                    });
                  }
                },
                onPageChanged: (focusedDay) {
                  _focusedDay = focusedDay;
                },
                calendarStyle: const CalendarStyle(
                  todayDecoration: BoxDecoration(
                    color: AppColors.warmTaupe, // Use a defined color
                    shape: BoxShape.circle,
                  ),
                  selectedDecoration: BoxDecoration(
                    color: AppColors.charcoalGrey,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              const SizedBox(height: 24),
              const Divider(),
              const SizedBox(height: 16),
              Expanded(
                child: ListView(
                  children: [
                    _buildSessionItem(
                      'Sunday Service',
                      '10:00 AM - 12:00 PM',
                      'Main Sanctuary & Online',
                    ),
                    _buildSessionItem(
                      'Wednesday Worship',
                      '6:00 PM - 7:30 PM',
                      'Prayer Hall',
                    ),
                    _buildSessionItem(
                      'Friday Prayer',
                      '7:00 PM - 9:00 PM',
                      'Online (Zoom)',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSessionItem(String title, String time, String location) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(width: 4, height: 48, color: AppColors.warmTaupe),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: AppStyles.sansDisplay.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: AppColors.charcoalGrey,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                '$time • $location',
                style: AppStyles.sansDisplay.copyWith(
                  fontSize: 14,
                  color: AppColors.stone600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
