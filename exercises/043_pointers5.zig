const std = @import("std");

const Class = enum {
    wizard,
    thief,
    bard,
    warrior,
};

const Character = struct {
    class: Class,
    gold: u32,
    health: u8 = 100,
    experience: u32,
    mentor: ?*Character = null,
};

pub fn main() void {
    var mighty_krodor = Character{
        .class = Class.wizard,
        .gold = 10000,
        .experience = 2340,
    };

    var glorp = Character{
        .class = Class.wizard,
        .gold = 10,
        .experience = 20,
        .mentor = &mighty_krodor,
    };

    // FIX ME!
    // Please pass Glorp to printCharacter():
    printCharacter(&glorp);
}

// Note how this function's "c" parameter is a pointer to a Character struct.
fn printCharacter(c: *Character) void {
    // Here's something you haven't seen before: when switching an enum, you
    // don't have to write the full enum name. Zig understands that ".wizard"
    // means "Class.wizard" when we switch on a Class enum value:
    const class_name = switch (c.class) {
        .wizard => "Wizard",
        .thief => "Thief",
        .bard => "Bard",
        .warrior => "Warrior",
    };

    std.debug.print("{s} (G:{} H:{} XP:{})\n", .{
        class_name,
        c.gold,
        c.health,
        c.experience,
    });

    // Checking an "optional" value and capturing it will be
    // explained later (this pairs with the '?' mentioned above.)
    if (c.mentor) |mentor| {
        std.debug.print("  Mentor: ", .{});
        printCharacter(mentor);
    }
}
