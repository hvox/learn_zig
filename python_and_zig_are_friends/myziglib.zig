const std = @import("std");
const print = std.debug.print;

export fn f() void {
    print("enter f()\n", .{});
    const back = std.Thread.spawn(.{}, g, .{}) catch {
        print("ERROR: Failed to spawn a thread!", .{});
        return;
    };
    back.detach();
    print("leave f()\n", .{});
}

fn g() void {
    print("enter g()\n", .{});
    var i: u32 = 1;
    while (i < 1000) {
        i += 1;
        print("i={}\n", .{i});
    }
    print("leave g()\n", .{});
}
