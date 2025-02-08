const std = @import("std");

pub fn main() void {
    var cards = [8]u8{ 'A', '4', 'K', '8', '5', '2', 'Q', 'J' };

    // Please put the first 4 cards in hand1 and the rest in hand2.
    const hand1: []u8 = cards[0..4];
    const hand2: []u8 = cards[4..];

    std.debug.print("Hand1: ", .{});
    printHand(hand1);

    std.debug.print("Hand2: ", .{});
    printHand(hand2);
}

// Please lend this function a hand. A u8 slice hand, that is.
fn printHand(hand: []u8) void {
    for (hand) |h| {
        std.debug.print("{u} ", .{h});
    }
    std.debug.print("\n", .{});
}
//
// Fun fact: Under the hood, slices are stored as a pointer to
// the first item and a length.
