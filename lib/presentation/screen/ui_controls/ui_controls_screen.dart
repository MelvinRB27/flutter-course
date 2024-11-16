// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class UiControlsScreen extends StatelessWidget {
  static const String name = "ui_controls_Screen";

  const UiControlsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("UI Controls")),
        body: const _UiControlsView());
  }
}

class _UiControlsView extends StatefulWidget {
  const _UiControlsView({
    super.key,
  });

  @override
  State<_UiControlsView> createState() => _UiControlsViewState();
}

enum Transporations { car, bus, train, plane, boat }

class _UiControlsViewState extends State<_UiControlsView> {
  bool isDeveloper = false;
  Transporations selectedTransportation = Transporations.car;
  bool wantsBreakfast = false;
  bool wantsLunch = false;
  bool wantsDinner = false;

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const ClampingScrollPhysics(),
      children: [
        SwitchListTile(
            onChanged: (value) => setState(() => isDeveloper = value),
            value: isDeveloper,
            title: const Text("Developer Mode"),
            subtitle: const Text("Controles adicionales")),
        _RadiosTransporationView(selectedTransportation, (value) {
          setState(() => selectedTransportation = value);
        }),
        CheckboxListTile(
            onChanged: (value) =>
                setState(() => wantsBreakfast = !wantsBreakfast),
            value: wantsBreakfast,
            title: const Text("Wants breakfast?"),
            subtitle: const Text("Desea desayunar?")),
        CheckboxListTile(
            onChanged: (value) => setState(() => wantsLunch = !wantsLunch),
            value: wantsLunch,
            title: const Text("Wants lunch?"),
            subtitle: const Text("Desea cenar?")),
        CheckboxListTile(
            onChanged: (value) => setState(() => wantsDinner = !wantsDinner),
            value: wantsDinner,
            title: const Text("Wants dinner?"),
            subtitle: const Text("Desea cenar?")),
      ],
    );
  }
}

class _RadiosTransporationView extends StatelessWidget {
  final Transporations selectedTransportation;
  final Function(Transporations) onChange;

  const _RadiosTransporationView(this.selectedTransportation, this.onChange);

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: const Text("Transportation"),
      subtitle: const Text("Transporte"),
      children: [
        RadioListTile(
            groupValue: selectedTransportation,
            value: Transporations.car,
            title: const Text("Car"),
            subtitle: const Text("Carro"),
            onChanged: (value) {
              onChange(Transporations.car);
            }),
        RadioListTile(
            groupValue: selectedTransportation,
            value: Transporations.bus,
            title: const Text("Bus"),
            subtitle: const Text("Autobús"),
            onChanged: (value) {
              onChange(Transporations.bus);
            }),
        RadioListTile(
            groupValue: selectedTransportation,
            value: Transporations.train,
            title: const Text("Train"),
            subtitle: const Text("Tren"),
            onChanged: (value) {
              onChange(Transporations.train);
            }),
        RadioListTile(
            groupValue: selectedTransportation,
            value: Transporations.plane,
            title: const Text("Plane"),
            subtitle: const Text("Avión"),
            onChanged: (value) {
              onChange(Transporations.plane);
              ;
            }),
        RadioListTile(
            groupValue: selectedTransportation,
            value: Transporations.boat,
            title: const Text("Boat"),
            subtitle: const Text("Barco"),
            onChanged: (value) {
              onChange(Transporations.boat);
              ;
            }),
      ],
    );
  }
}
