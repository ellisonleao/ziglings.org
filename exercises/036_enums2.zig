const std = @import("std");

const Color = enum(u32) {
    red = 0xff0000,
    green = 0x00ff00,
    blue = 0x0000ff,
};

pub fn main() void {
    // Remember Zig's multi-line strings? Here they are again.
    // Also, check out this cool format string:
    //
    //     {x:0>6}
    //      ^
    //      x       type ('x' is lower-case hexadecimal)
    //       :      separator (needed for format syntax)
    //        0     padding character (default is ' ')
    //         >    alignment ('>' aligns right)
    //          6   width (use padding to force width)
    //
    // Please add this formatting to the blue value.
    // (Even better, experiment without it, or try parts of it
    // to see what prints!)
    std.debug.print(
        \\<p>
        \\  <span style="color: #{x:0>6}">Red</span>
        \\  <span style="color: #{x:0>6}">Green</span>
        \\  <span style="color: #{x:0>6}">Blue</span>
        \\</p>
        \\
    , .{
        @intFromEnum(Color.red),
        @intFromEnum(Color.green),
        @intFromEnum(Color.blue),
    });
}
