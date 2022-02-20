// zig 0.10.0

const std = @import("std");
const print = std.debug.print;
const c_code = @cImport({
    @cInclude("./add_and_hi.c");
});

pub fn main() !void {
    var a: c_int = -25;
    var b: c_int = 333;
    print("{} + {} = {}\n", .{ a, b, c_code.add(a, b) });
}
