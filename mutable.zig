// zig 0.10.0

const print = @import("std").debug.print;

pub fn main() void {
    var x: i32 = 2;
    x += 2;
    print("2 + 2 = {}\n", .{x});
}
