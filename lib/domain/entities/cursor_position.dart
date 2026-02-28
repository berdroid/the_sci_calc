import 'package:freezed_annotation/freezed_annotation.dart';

import 'expression_node.dart';

part 'cursor_position.freezed.dart';

@freezed
class CursorPosition with _$CursorPosition {
  const factory CursorPosition({
    required NodeId focusedNodeId,
    @Default(0) int charOffset,
  }) = _CursorPosition;
}

@freezed
class SelectionRange with _$SelectionRange {
  const factory SelectionRange({
    required NodeId anchorNodeId,
    required NodeId extentNodeId,
  }) = _SelectionRange;
}
