import 'package:evening_flow/models/routine_model.dart';
import 'package:evening_flow/models/step_model.dart';

final List<RoutineModel> exampleEveningRoutines = [
  const RoutineModel(
    id: "routine1",
    title: "Entspannter Abend",
    startTime: Duration(hours: 20, minutes: 0),
    status: RoutineStatus.inactive,
    steps: [
      StepModel(
        id: "step1",
        title: "Leichte Dehnübungen",
        description: "5-10 Minuten",
        duration: Duration(minutes: 10),
        status: StepStatus.pending,
      ),
      StepModel(
        id: "step2",
        title: "Tee zubereiten",
        description: "Entspannender Kräutertee",
        duration: Duration(minutes: 5),
        status: StepStatus.pending,
      ),
      StepModel(
        id: "step3",
        title: "Meditation",
        description: "10 Minuten Atemübung",
        duration: Duration(minutes: 10),
        status: StepStatus.pending,
      ),
      StepModel(
        id: "step4",
        title: "Lesen",
        description: "Buch oder Zeitschrift",
        duration: Duration(minutes: 20),
        status: StepStatus.pending,
      ),
    ],
  ),

  const RoutineModel(
    id: "routine2",
    title: "Tagesrückblick",
    startTime: Duration(hours: 21, minutes: 0),
    status: RoutineStatus.inactive,
    steps: [
      StepModel(
        id: "step1",
        title: "Notizen machen",
        description: "Erfolge und Herausforderungen des Tages festhalten",
        duration: Duration(minutes: 10),
        status: StepStatus.pending,
      ),
      StepModel(
        id: "step2",
        title: "Reflexion",
        description: "Fragen: Was lief gut? Was möchte ich verbessern?",
        duration: Duration(minutes: 15),
        status: StepStatus.pending,
      ),
      StepModel(
        id: "step3",
        title: "Planung für morgen",
        description: "3-5 Dinge aufschreiben",
        duration: Duration(minutes: 10),
        status: StepStatus.pending,
      ),
    ],
  ),

  const RoutineModel(
    id: "routine3",
    title: "Morgen vorbereiten",
    startTime: Duration(hours: 21, minutes: 30),
    status: RoutineStatus.inactive,
    steps: [
      StepModel(
        id: "step1",
        title: "Kleidung rauslegen",
        duration: Duration(minutes: 5),
        status: StepStatus.pending,
      ),
      StepModel(
        id: "step2",
        title: "Tasche packen",
        description: "Laptop, Unterlagen, Snacks",
        duration: Duration(minutes: 10),
        status: StepStatus.pending,
      ),
      StepModel(
        id: "step3",
        title: "Wecker stellen",
        duration: Duration.zero,
        status: StepStatus.pending,
      ),
    ],
  ),

  const RoutineModel(
    id: "routine4",
    title: "Früh ins Bett",
    startTime: Duration(hours: 22, minutes: 0),
    status: RoutineStatus.inactive,
    steps: [
      StepModel(
        id: "step1",
        title: "Zähne putzen",
        duration: Duration(minutes: 3),
        status: StepStatus.pending,
      ),
      StepModel(
        id: "step2",
        title: "Duschen",
        duration: Duration(minutes: 10),
        status: StepStatus.pending,
      ),
      StepModel(
        id: "step3",
        title: "Handy weglegen",
        duration: Duration.zero,
        status: StepStatus.pending,
      ),
      StepModel(
        id: "step4",
        title: "Entspannungsübung",
        description: "5 Minuten Atemtechnik",
        duration: Duration(minutes: 5),
        status: StepStatus.pending,
      ),
      StepModel(
        id: "step5",
        title: "Schlafen gehen",
        duration: Duration.zero,
        status: StepStatus.pending,
      ),
    ],
  ),
];
