// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_application_project_1/modals/add_medication_modal.dart';
import 'package:flutter_application_project_1/modals/add_test_modal.dart';
import 'package:flutter_application_project_1/models/patient_model.dart';
import 'package:flutter_application_project_1/providers/patient_provider.dart';
import 'package:flutter_application_project_1/screens/all_patients.dart';
import 'package:flutter_application_project_1/screens/update_patient.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:provider/provider.dart';

void main() {
  testWidgets('Verify add patient button is present on AllPatients page',
      (WidgetTester tester) async {
    //Arrange - Pump MyApp() widget to tester
    await tester.pumpWidget(
      ChangeNotifierProvider(
        create: (context) => PatientProvider(),
        child: const MaterialApp(home: SecondPage()),
      ),
    );

    //Act - Find button by type
    var elevatedBtn = find.byType(ElevatedButton);

    //Assert - Check that button widget is present
    expect(elevatedBtn, findsOneWidget);
  });

  testWidgets(
      'Verify that the search patient text field is present on AllPatients page',
      (WidgetTester tester) async {
    //Arrange - Pump MyApp() widget to tester
    await tester.pumpWidget(
      ChangeNotifierProvider(
        create: (context) => PatientProvider(),
        child: const MaterialApp(home: SecondPage()),
      ),
    );
    //Act - Find button by type
    var searchField = find.byType(TextField);

    //Assert - Check that button widget is present
    expect(searchField, findsOneWidget);
  });

  testWidgets(
      'Verify that the two input widgets are present on the add medication modal',
      (WidgetTester tester) async {
    //Arrange - Pump AddUser() widget to tester
    await tester.pumpWidget(
      ChangeNotifierProvider(
        create: (context) => PatientProvider(),
        child: const MaterialApp(
            home: AddMedicationModal(patientId: '67jaj83yjdu21r732ry')),
      ),
    );

    //Act - Find button by type
    var textField = find.byType(TextFormField);

    //Assert - Check that exactly 2 Text input widgets are present
    expect(textField, findsNWidgets(2));
  });

  testWidgets(
      'Verify that update patient button is present on UpdatePatients page',
      (WidgetTester tester) async {
    //Arrange - Pump MyApp() widget to tester
    await tester.pumpWidget(
      ChangeNotifierProvider(
        create: (context) => PatientProvider(),
        child: MaterialApp(
            home: UpdatePatientPage(
                patientInfo: PatientModel(
          id: "6jdjnu92rhd29",
          firstName: "John",
          lastName: "Doe",
          address: "2 Bay Street",
          dateOfBirth: "24",
          department: "Emergency",
          doctor: "Dr. Rania Abesh",
          bloodGroup: "A+",
          email: "test@test.com",
          phoneNumber: "2984732491",
          isAdmitted: false,
          condition: "critical",
          gender: "Male",
          genotype: "AA",
        ))),
      ),
    );

    //Act - Find button by type
    var updateBtn = find.text("Proceed");

    //Assert - Check that button widget is present
    expect(updateBtn, findsOneWidget);
  });

  testWidgets(
    'Test if the Cancel button on add test modal works as expected',
    (WidgetTester tester) async {
      // Pump the AddTestModal widget

      await tester.pumpWidget(
        ChangeNotifierProvider(
          create: (context) => PatientProvider(),
          child: const MaterialApp(
              home: AddTestModal(patientId: '67jaj83yjdu21r732ry')),
        ),
      );

      // Tap the Cancel button
      await tester.tap(find.text('Cancel'));
      await tester.pumpAndSettle(); // Wait for the modal to close

      // Verify that the modal is closed
      expect(find.byType(AlertDialog), findsNothing);
    },
  );

  testWidgets(
    'Test if the Cancel button on add medication modal works as expected',
    (WidgetTester tester) async {
      // Pump the AddTestModal widget

      await tester.pumpWidget(
        ChangeNotifierProvider(
          create: (context) => PatientProvider(),
          child: const MaterialApp(
              home: AddMedicationModal(patientId: '67jaj83yjdu21r732ry')),
        ),
      );

      // Tap the Cancel button
      await tester.tap(find.text('Cancel'));
      await tester.pumpAndSettle(); // Wait for the modal to close

      // Verify that the modal is closed
      expect(find.byType(AlertDialog), findsNothing);
    },
  );
}
