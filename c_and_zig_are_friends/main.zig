// zig 0.10.0

const std = @import("std");
const print = std.debug.print;
const c_code = @cImport({
    @cInclude("./add_and_hi.c");
});

pub fn main() !void {
    var a: c_int = -25;
    var b: c_int = 333;
    print("We have successfully imported funcion {}!\n", .{c_code.add});
    print("Btw, {} + {} = {} mod 257\n", .{ a, b, c_code.add(a, b) });
    print("Also we have imported funcion {}!\n", .{c_code.hi});
    print("Let's call it...\n", .{});
    c_code.hi();
}
