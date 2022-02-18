// zig 0.10.0

const print = @import("std").debug.print;

pub fn main() void {
    const msg = "2∫π = π²";
    print("{s}  :  {s}\n", .{ msg, @typeName(@TypeOf(msg)) });
    print("msg[2] = {d}:{s}\n", .{ msg[2], @typeName(@TypeOf(msg[2])) });
}
