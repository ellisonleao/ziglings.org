const std = @import("std");

const Elephant = struct {
    letter: u8,
    tail: ?*Elephant = null, // Hmm... tail needs something...
    visited: bool = false,
};

pub fn main() void {
    var elephantA = Elephant{ .letter = 'A' };
    var elephantB = Elephant{ .letter = 'B' };
    var elephantC = Elephant{ .letter = 'C' };

    // Link the elephants so that each tail "points" to the next.
    linkElephants(&elephantA, &elephantB);
    linkElephants(&elephantB, &elephantC);

    visitElephants(&elephantA);

    std.debug.print("\n", .{});
}

// If e1 and e2 are valid pointers to elephants,
// this function links the elephants so that e1's tail "points" to e2.
fn linkElephants(e1: ?*Elephant, e2: ?*Elephant) void {
    e1.?.tail = e2.?;
}

// This function visits all elephants once, starting with the
// first elephant and following the tails to the next elephant.
fn visitElephants(first_elephant: *Elephant) void {
    var e = first_elephant;

    while (!e.visited) {
        std.debug.print("Elephant {u}. ", .{e.letter});
        e.visited = true;
        e = e.tail orelse break;
    }
}
