const std = @import("std");
const print = std.debug.print;
const myasm = @cImport({
    @cInclude("./f.h");
});

pub fn main() !void {
    print("Hello there\n", .{});
    var x = myasm.f();
    print("ret = {}\n", .{x});
}
