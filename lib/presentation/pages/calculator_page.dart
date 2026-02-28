import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../application/calculator/calculator_cubit.dart';
import '../../application/settings/settings_cubit.dart';
import '../../application/settings/settings_state.dart';
import '../../domain/entities/expression_node.dart';
import '../layout/calculator_layout.dart';
import '../widgets/theme_toggle.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key});

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  final _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    // Load settings on startup.
    context.read<SettingsCubit>().load();

    // Sync settings into calculator cubit after load.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final settings = context.read<SettingsCubit>().state;
      final calc = context.read<CalculatorCubit>();
      calc.setAngleUnit(settings.angleUnit);
      calc.setDisplayFormat(settings.displayFormat);
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Keep calculator state in sync when settings change.
    return BlocListener<SettingsCubit, SettingsState>(
      listenWhen: (prev, curr) =>
          prev.angleUnit != curr.angleUnit ||
          prev.displayFormat != curr.displayFormat,
      listener: (context, state) {
        final calc = context.read<CalculatorCubit>();
        calc.setAngleUnit(state.angleUnit);
        calc.setDisplayFormat(state.displayFormat);
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Scientific Calculator'),
          centerTitle: false,
          actions: const [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: ThemeToggle(),
            ),
          ],
        ),
        body: KeyboardListener(
          focusNode: _focusNode,
          autofocus: true,
          onKeyEvent: _onKey,
          child: const CalculatorLayout(),
        ),
      ),
    );
  }

  void _onKey(KeyEvent event) {
    if (event is! KeyDownEvent && event is! KeyRepeatEvent) return;
    final cubit = context.read<CalculatorCubit>();
    final key = event.logicalKey;

    if (key == LogicalKeyboardKey.backspace) {
      cubit.deleteAtCursor();
    } else if (key == LogicalKeyboardKey.delete) {
      cubit.clear();
    } else if (key == LogicalKeyboardKey.enter ||
        key == LogicalKeyboardKey.numpadEnter) {
      cubit.evaluate();
    } else if (key == LogicalKeyboardKey.arrowLeft) {
      cubit.moveCursorLeft();
    } else if (key == LogicalKeyboardKey.arrowRight) {
      cubit.moveCursorRight();
    } else if (key == LogicalKeyboardKey.escape) {
      cubit.clearResult();
    } else {
      final char = event.character;
      if (char != null) {
        _handleCharacter(cubit, char);
      }
    }
  }

  void _handleCharacter(CalculatorCubit cubit, String char) {
    switch (char) {
      case '0':
      case '1':
      case '2':
      case '3':
      case '4':
      case '5':
      case '6':
      case '7':
      case '8':
      case '9':
        cubit.appendDigit(char);
      case '.':
        cubit.appendDecimalPoint();
      case '+':
        cubit.insertBinaryOp(OperatorType.add);
      case '-':
        cubit.insertBinaryOp(OperatorType.subtract);
      case '*':
        cubit.insertBinaryOp(OperatorType.multiply);
      case '/':
        cubit.insertBinaryOp(OperatorType.divide);
      case '=':
        cubit.evaluate();
    }
  }
}
