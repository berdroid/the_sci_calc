import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../application/calculator/calculator_cubit.dart';
import '../../application/settings/settings_cubit.dart';
import '../../application/settings/settings_state.dart';
import '../../domain/enums/angle_unit.dart';
import '../../domain/enums/display_format.dart';

class AngleUnitToggle extends StatelessWidget {
  const AngleUnitToggle({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsCubit, SettingsState>(
      builder: (context, state) {
        return _ToggleChipRow<AngleUnit>(
          values: AngleUnit.values,
          current: state.angleUnit,
          label: (u) => u.label,
          onSelected: (u) {
            context.read<SettingsCubit>().setAngleUnit(u);
            context.read<CalculatorCubit>().setAngleUnit(u);
          },
        );
      },
    );
  }
}

class DisplayFormatToggle extends StatelessWidget {
  const DisplayFormatToggle({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsCubit, SettingsState>(
      builder: (context, state) {
        return _ToggleChipRow<DisplayFormat>(
          values: DisplayFormat.values,
          current: state.displayFormat,
          label: (f) => f.label,
          onSelected: (f) {
            context.read<SettingsCubit>().setDisplayFormat(f);
            context.read<CalculatorCubit>().setDisplayFormat(f);
          },
        );
      },
    );
  }
}

class _ToggleChipRow<T> extends StatelessWidget {
  const _ToggleChipRow({
    required this.values,
    required this.current,
    required this.label,
    required this.onSelected,
  });

  final List<T> values;
  final T current;
  final String Function(T) label;
  final void Function(T) onSelected;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Row(
      mainAxisSize: MainAxisSize.min,
      spacing: 4,
      children: values.map((v) {
        final isSelected = v == current;
        return InkWell(
          onTap: () => onSelected(v),
          borderRadius: BorderRadius.circular(6),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 150),
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
            decoration: BoxDecoration(
              color:
                  isSelected ? colorScheme.primary : colorScheme.surfaceContainerHighest,
              borderRadius: BorderRadius.circular(6),
            ),
            child: Text(
              label(v),
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w600,
                color: isSelected
                    ? colorScheme.onPrimary
                    : colorScheme.onSurfaceVariant,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
