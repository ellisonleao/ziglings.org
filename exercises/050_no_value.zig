// Zig has all of these ways of expressing different types of "no value"
// because they each serve a purpose. Briefly:
//
//   * undefined - there is no value YET, this cannot be read YET
//   * null      - there is an explicit value of "no value"
//   * errors    - there is no value because something went wrong
//   * void      - there will NEVER be a value stored here
//
// Please use the correct "no value" for each ??? to make this program
// print out a cursed quote from the Necronomicon. ...If you dare.
//
const std = @import("std");

const Err = error{Cthulhu};

pub fn main() void {
    var first_line1: *const [16]u8 = undefined;
    first_line1 = "That is not dead";

    var first_line2: Err!*const [21]u8 = Err.Cthulhu;
    first_line2 = "which can eternal lie";

    // Note we need the "{!s}" format for the error union string.
    std.debug.print("{s} {!s} / ", .{ first_line1, first_line2 });

    printSecondLine();
}

fn printSecondLine() void {
    var second_line2: ?*const [18]u8 = null;
    second_line2 = "even death may die";

    std.debug.print("And with strange aeons {s}.\n", .{second_line2.?});
}
