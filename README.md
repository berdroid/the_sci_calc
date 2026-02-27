# the_sci_calc

The scientific calculator is an app the implements a scientific calculator.

Its main use case is to perform calculations by visually entering numbers, operators, functions
and other elements of scientific mathematical expressions, and then displaying the results.

## User interface

The user interface consists of three main elements:

* An expression display on top, serving to enter terms and expressions and displaying the results
* An entry section in the lower right containing the numerical keypad and function keys to enter operators and functions.
* An optional display section on the left of the window, visible when the display is wide enough
  (e.g. in landscape mode, or on a desktop window). This section displays a scrolling list or recent 
  calculations which may also be selected to be re-edited in the expression display area.

User actions in the entry section will immediately update the expression display. Pressing the Enter button 
will evaluate the expression and display the result. If there are errors or incomplete elements, these
will be highlighted and explained with brief error messages at the foot of the display section.

Expressions will be displayed in structured style, similar to writing on paper. Values to be 
entered will be shown as lightly shaded boxes until filled in. This works for all operators, such as square root, 
quotient, exponentiation, trigonometric functions, etc.

The following symbols are supported:
* basic operators 
* quotients a over b
* square root and n th root
* exponentiation
* trigonometric functions and there inverse functions
* logarithmic function (natural log and base 10 log, log to arbitrary base)
* parentheses to any nesting level

Result display shall have these options:
* decimal notation
* scientific notation
* engineering notation
* degree, minute, seconds
* rational a b/c

Apart from numerical values in decimal and scientific notation, common constants such as pi, e, etc.
are accepted in the expression input.

In landscape mode, or in a desktop window, the app will also display a scrollable list of recent 
expressions and result on the left. Double-tapping an entry will copy it to the entry section for editing.

## Architecture

The app uses clean architecture implemented using Blocs and ore Cubits for the business logic 
as well as suitable repositories to store and retrieve settings and recent calculations.

## Implementation

The implementation uses a folder structure representing the architecture, and in line with 
clean architecture princibles: repositories, models, blocs, entities and presentation 
live in their proper folders. Presentation elements are suitably distributed into folders
representing categories like display, buttons, layout elements, etc.


