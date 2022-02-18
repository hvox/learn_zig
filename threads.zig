// zig 0.10.0

const std = @import("std");
const print = std.debug.print;

threadlocal var local_counter: i32 = 0;
var global_counter: i32 = 0;

pub fn main() !void {
    const thread1 = try std.Thread.spawn(.{}, print_counters, .{1});
    const thread2 = try std.Thread.spawn(.{}, print_counters, .{2});
    const thread3 = try std.Thread.spawn(.{}, print_counters, .{3});
    print_counters(4);
    thread1.join();
    thread2.join();
    thread3.join();
}

fn print_counters(id: i32) void {
    local_counter += 1;
    global_counter += 1;
    print("thread #{}\n", .{id});
    print("local counter: {}\n", .{local_counter});
    print("global counter: {}\n", .{global_counter});
}
