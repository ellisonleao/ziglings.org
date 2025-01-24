const std = @import("std");

pub fn main() void {
    const foo = true;

    if (foo) {
        std.debug.print("Foo is 1!\n", .{});
    } else {
        std.debug.print("Foo is not 1!\n", .{});
    }
}
