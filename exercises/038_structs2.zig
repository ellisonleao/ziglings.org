//
// Grouping values in structs is not merely convenient. It also allows
// us to treat the values as a single item when storing them, passing
// them to functions, etc.
//
// This exercise demonstrates how we can store structs in an array and
// how doing so lets us print them using a loop.
//
const std = @import("std");

const Role = enum {
    wizard,
    thief,
    bard,
    warrior,
};

const Character = struct {
    role: Role,
    gold: u32,
    health: u8,
    experience: u32,
};

pub fn main() void {
    var chars: [2]Character = undefined;

    // Glorp the Wise
    chars[0] = Character{
        .role = Role.wizard,
        .gold = 20,
        .health = 100,
        .experience = 10,
    };

    chars[1] = Character{
        .role = Role.bard,
        .gold = 10,
        .health = 100,
        .experience = 20,
    };

    // Printing all RPG characters in a loop:
    for (chars, 0..) |c, num| {
        std.debug.print("Character {} - G:{} H:{} XP:{}\n", .{
            num + 1, c.gold, c.health, c.experience,
        });
    }
}
