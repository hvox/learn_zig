// zig 0.10.0

const std = @import("std");
const SIG = std.os.SIG;
const print = std.debug.print;

const font3x5 =
    //       ---    █▀█    ▀█     ▀▀█    ▀▀█    █ █
    //      SPACE   █ █     █     █▀▀    ▀▀█    ▀▀█
    //       ---    ▀▀▀    ▀▀▀    ▀▀▀    ▀▀▀      ▀
    [_]u15{ 00000, 32319, 02033, 30391, 32437, 31900 } ++
    //
    //       █▀▀    █▀▀    ▀▀█    █▀█    █▀█     ▄
    //       ▀▀█    █▀█     █     █▀█    ▀▀█     ▄
    //       ▀▀▀    ▀▀▀     ▀     ▀▀▀    ▀▀▀
    [_]u15{ 24253, 24255, 25328, 32447, 32445, 00320 };

pub fn show_character_row(char: u8, row: u4) !void {
    const char_index: u4 = switch (char) {
        32 => 0,
        else => @intCast(u4, char - 47),
    };
    if (row < 2) {
        var x: u4 = 0;
        while (x <= 2) : (x += 1) {
            const bit_index: u4 = 5 * x + row * 2;
            const repr = switch (3 & font3x5[char_index] >> bit_index) {
                0 => " ",
                1 => "▄",
                2 => "▀",
                else => "█",
            };
            print("{s}", .{repr});
        }
    } else {
        var x: u4 = 0;
        while (x <= 2) : (x += 1) {
            const bit_index: u4 = 5 * x + 4;
            const repr = switch (1 & font3x5[char_index] >> bit_index) {
                0 => " ",
                else => "▄",
            };
            print("{s}", .{repr});
        }
    }
}

pub fn show(message: []const u8) !void {
    print("\x1b[A" ** 5 ++ "\n", .{});
    var y: u4 = 3;
    while (y >= 1) : (y -= 1) {
        print(" ", .{});
        for (message) |char| {
            print(" ", .{});
            try show_character_row(char, y - 1);
        }
        print("\n", .{});
    }
    print("\n", .{});
}

const signal_handler_action = std.os.Sigaction{
    .handler = .{ .handler = signal_handler },
    .mask = std.os.empty_sigset,
    .flags = std.os.SA.RESETHAND,
};

fn signal_handler(_: c_int) callconv(.C) void {
    print("\n\x1b[?25h", .{});
    std.os.exit(0);
}

pub fn main() !void {
    if (@import("builtin").os.tag != .windows) {
        for ([_]u6{ SIG.INT, SIG.SEGV }) |signal| {
            std.os.sigaction(signal, &signal_handler_action, null) catch {};
        }
    }
    print("\n" ** 5 ++ "\x1b[?25l", .{});
    while (true) {
        const current_time = @divFloor(std.time.milliTimestamp(), 1000);
        const seconds = @intCast(u7, @rem(current_time, 60));
        const minutes = @intCast(u7, @rem(@divFloor(current_time, 60), 60));
        const hours = @intCast(u5, @rem(@divFloor(current_time, 60 * 60) + 3, 24));
        var buf: [16]u8 = undefined;
        var msg = try std.fmt.bufPrint(&buf, "{:0>2}:{:0>2}:{:0>2}", .{ hours, minutes, seconds });
        try show(msg);
        std.time.sleep(1000_000_000);
    }
}
