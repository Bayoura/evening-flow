import 'package:evening_flow/buttons.dart';
import 'package:evening_flow/constants/colors.dart';
import 'package:evening_flow/constants/text_styles.dart';
import 'package:evening_flow/widgets/routine_countdown.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> dropdownList = <String>[
    "Beispielroutine 1",
    "Beispielroutine 2",
    "Beispielroutine 3",
  ];
  late String dropdownValue;
  final startTime = const TimeOfDay(hour: 21, minute: 30);
  String formattedTime = "";

  @override
  void initState() {
    super.initState();
    dropdownValue = dropdownList.first;
    formattedTime =
        "${startTime.hour < 10 ? "0${startTime.hour}" : startTime.hour}:${startTime.minute < 10 ? "0${startTime.minute}" : startTime.minute}";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Deine Abendroutine"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const SizedBox(
              height: 48,
              width: 48,
              child: Icon(
                Icons.settings_outlined,
                color: AppColors.textSecondary,
              ),
            ),
          ),
        ],
      ),
      body: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Deine aktuelle Routine für heute:",
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(height: 8),
              DropdownButtonFormField<String>(
                initialValue: dropdownValue,
                style: AppTextStyles.buttonPrimary,
                icon: const Padding(
                  padding: EdgeInsets.only(right: 24),
                  child: Icon(
                    Icons.arrow_drop_down,
                    color: AppColors.textPrimary,
                  ),
                ),
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 16,
                  ),

                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(
                      color: AppColors.surfaceSecondary,
                      width: 2,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(
                      color: AppColors.surfaceSecondary,
                      width: 2,
                    ),
                  ),
                ),
                items: dropdownList
                    .map(
                      (item) =>
                          DropdownMenuItem(value: item, child: Text(item)),
                    )
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    dropdownValue = value!;
                  });
                },
              ),
              const SizedBox(height: 24),
              Text("Beginn heute um $formattedTime Uhr"),
              const SizedBox(height: 8),
              RoutineCountdown(startTime: startTime),
              const SizedBox(height: 40),
              Center(
                child: PrimaryButton(
                  text: "Jetzt starten",
                  onPressed: () {
                    debugPrint("Jetzt starten wurde geklickt!");
                  },
                ),
              ),
              const SizedBox(height: 80),
              Text(
                "Schritte heute:",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
