//
// Quiz time again! I have solved the famous "Fizz Buzz"!
//
//     "Players take turns to count incrementally, replacing
//      any number divisible by three with the word "fizz",
//      and any number divisible by five with the word "buzz".
//          - From https://en.wikipedia.org/wiki/Fizz_buzz
//
// Let's go from 1 to 16.
const std = @import("std");

pub fn main() void {
    var i: u8 = 1;
    var stop_at: u8 = 16;

    // This is a 'while' loop that looks like 'for' from other languages.
    while (i <= stop_at) : (i += 1) {
        if (i % 3 == 0) std.debug.print("Fizz", .{});
        if (i % 5 == 0) std.debug.print("Buzz", .{});
        if (!(i % 3 == 0) and !(i % 5 == 0)) {
            std.debug.print("{}", .{i});
        }
        std.debug.print(", ", .{});
    }
    std.debug.print("\n", .{});
}
