// zig 0.10.0

const std = @import("std");
const print = std.debug.print;

pub fn main() void {
    const a: i42 = 5;
    const b: i13 = 3;
    print("{} + {} = {}\n", .{ a, b, a + b });

    const c: i4 = 5;
    const d: u2 = 3;
    const cd = c *% d;
    print("{}:{s} * ", .{ c, @typeName(@TypeOf(c)) });
    print("{}:{s} = ", .{ d, @typeName(@TypeOf(d)) });
    print("{}:{s}\n", .{ cd, @typeName(@TypeOf(cd)) });

    print("4.2 / 3.14 = {}\n", .{4.2 / 3.14});
}
