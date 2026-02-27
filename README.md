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

Navigation between operator arguments is possible by tapping/clicking the field. On platforms with 
hardware keyboard, using the arrow and tab keys also navigates within or between operator arguments.

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

The list of recent entries holds at most 20 entries and persists between app starts.
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

