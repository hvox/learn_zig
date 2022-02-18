// zig 0.10.0

const print = @import("std").debug.print;

fn f() i32 {
    const singleton = struct {
        var value: i32 = 0;
    };
    singleton.value += 1;
    return singleton.value;
}

pub fn main() void {
    print("f() = {}, {}, {}, {}\n", .{ f(), f(), f(), f() });
}
