//
// Now let's create a function that takes a parameter. Here's an
// example that takes two parameters. As you can see, parameters
// are declared just like any other types ("name": "type"):
//
//     fn myFunction(number: u8, is_lucky: bool) {
//         ...
//     }
//
const std = @import("std");

pub fn main() void {
    std.debug.print("Powers of two: {} {} {} {}\n", .{
        twoToThe(1),
        twoToThe(2),
        twoToThe(3),
        twoToThe(4),
    });
}

fn twoToThe(my_number: u5) u32 {
    return std.math.pow(u32, 2, my_number);
    // std.math.pow(type, a, b) takes a numeric type and two
    // numbers of that type (or that can coerce to that type) and
    // returns "a to the power of b" as that same numeric type.
}
