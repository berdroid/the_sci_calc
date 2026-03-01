# the_sci_calc

The scientific calculator is an app that implements a scientific calculator.

Its main use case is to perform calculations by visually entering numbers, operators, functions
and other elements of scientific mathematical expressions, and then displaying the results.

## User interface

The user interface consists of three main elements:

* An expression display on top, serving to enter terms and expressions and displaying the results
* An entry section in the lower right containing the numerical keypad and function keys to enter operators and functions.
* An optional display section on the left of the window, visible when the display is wide enough
  (e.g. in landscape mode, or on a desktop window). This section displays a scrolling list of recent
  calculations which may also be selected to be re-edited in the expression display area.

### Expression display

User actions in the entry section will immediately update the expression display. Pressing the Enter button 
will evaluate the expression and display the result. If there are input errors, invalid operands,
or incomplete elements, these
will be highlighted and explained with brief error messages at the foot of the display section.

Expressions will be displayed in structured style, similar to writing on paper. Values to be
entered will be shown as lightly shaded boxes until filled in. This works for all operators, such as square root,
quotient, exponentiation, trigonometric functions, etc.

Each shaded box is a **slot** that can hold a complete sub-expression. While the cursor is inside
a slot, digits, operators, functions, constants, and parentheses all build up the expression
*within that slot*. For example, typing `3`, `+`, `4` inside the radicand slot of a square-root
produces `√(3 + 4)`, not `√3 + 4`. Pressing the left or right arrow key moves the cursor out of
the current slot and into the surrounding expression.

#### Cursor

The insertion point is shown as a thin blinking vertical line. It can appear:

* **Inside a number** — between any two adjacent digits, or before the first / after the last digit.
  Typing a digit inserts it at that exact position.
* **Inside an empty slot** — the caret blinks inside the shaded placeholder box.
* **Before a sub-expression** (*entry* position) — the caret appears to the left of a structural
  element such as a root, fraction, function call, or constant. Input at this position
  *prepends* to the expression: typing a digit inserts `digit × expression` (implicit multiply);
  typing an operator inserts `□ op expression`, placing a new empty slot to the left.
* **After a sub-expression** (*exit* position) — the caret appears to the right of a structural
  element. Input here appends in the normal way: typing an operator wraps the expression as the
  left operand and creates a new empty slot on the right.

#### Implicit multiplication

When the cursor is at the end of a number or a constant (π, e), inserting a constant, a function,
or a root automatically inserts an implicit `×` between the existing value and the new element.
Examples:
* `2` then `π`  →  `2 × π`
* `3` then `sin`  →  `3 × sin(□)`
* `π` then `√`  →  `π × √(□)`

This avoids the need to type an explicit `×` in the common case of a coefficient followed by
a function or constant, such as `sin(2π)`.

Navigation between operator arguments is possible by tapping/clicking anywhere in the expression,
which places the cursor at the end of the tapped element. On platforms with a hardware keyboard,
the left and right arrow keys step through every cursor position in reading order, including
entry and exit positions of every structural element.

Long-pressing a field will select its contents, e.g. the argument of a root. Repeatedly long-pressing
a selection will extend the selection to the surrounding operator or expression until the whole
expression in the expression display is selected. A DEL button is provided in the entry section
to delete the selection. Other input actions replace the selection with the input.
Pressing the DEL button without selection will delete the element to the left of the cursor.

Result display shall have these options:
* decimal notation
* scientific notation
* engineering notation
* degree, minute, seconds
* rational a b/c

When applicable, results are displayed with up to fifteen significant digits, culling trailing zeros.

The change of display is possible at any time, independent of the type of calculation being performed.

A toggle button below the display area allows the selection of the result format. The display
changes immediately when the button is pressed.

### Entry section

The entry section provides buttons to enter numbers, operators and functions into the expression
display.

The following symbols are supported:
* basic operators: addition, subtraction, multiplication, division
* quotients a over b
* square root and n th root
* exponentiation
* trigonometric functions and their inverse functions
* hyperbolic functions and their inverse functions
* logarithmic functions (natural log and base 10 log, log to arbitrary base)
* parentheses to any nesting level
* absolute value
* modulo

The following operations are out of scope in the initial release:
* combinatoric functions (nPr, nCr, n!, etc.)
* complex numbers

Undo/redo operations are not supported.

Apart from numerical values in decimal and scientific notation (e.g. 1.34e-6), 
the constants pi, and e, are accepted in the expression input.

As common in scientific calculations, the arguments of trigonometric functions are selectable as
degrees, gons and radians. A toggle button below the display area allows the selection of the
unit.


### Recent expressions list

In landscape mode, or in a desktop window, the app will also display a scrollable list of recent 
expressions and results on the left. 
Double-tapping an entry will copy the expression to the display section for editing.

Each time the = button is pressed and a result is successfully computed, the expression
together with its result is prepended to the list. An expression that produces an error is
not recorded. The list of recent entries holds at most 20 entries and persists between app starts.
Entries in the list may be selected by long press, and then may be deleted with the DEL button, 
or moved up and down in the list by dragging them.

Both the trigonometric unit and the result display format are stored with the expression in the list of
recent expressions and restored to the entry field when the expression is copied.

### Theming

The app supports light and dark themes. By default, the theme follows the operating system's current
setting. A toggle button allows the user to override this and select light or dark mode explicitly.
The preference is persisted between app starts.

## Architecture

The app uses clean architecture implemented using Blocs and/or Cubits for the business logic
as well as suitable repositories to store and retrieve settings and recent calculations.

## Implementation

The implementation uses a folder structure representing the architecture, and in line with 
clean architecture principles: repositories, models, blocs, entities and presentation 
live in their proper folders. Presentation elements are suitably distributed into folders
representing categories like display, buttons, layout elements, etc.

Calculations should use higher precision beyond 64-bit floating point to avoid rounding errors.



## Target platforms and technology

The app shall be implemented in Flutter, targeting all common platforms: Android, iOS, macOS, Windows,
Web and optionally Linux.

