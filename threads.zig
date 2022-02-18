// zig 0.10.0

const std = @import("std");
const print = std.debug.print;

threadlocal var local_counter: i32 = 0;
var global_counter: i32 = 0;

pub fn main() !void {
    const thread1 = try std.Thread.spawn(.{}, print_counters, .{});
    const thread2 = try std.Thread.spawn(.{}, print_counters, .{});
    const thread3 = try std.Thread.spawn(.{}, print_counters, .{});
    print_counters();
    thread1.join();
    thread2.join();
    thread3.join();
}

fn print_counters() void {
    local_counter += 1;
    global_counter += 1;
    print("local counter: {}\n", .{local_counter});
    print("global counter: {}\n", .{global_counter});
}
