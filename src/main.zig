const std = @import("std");

pub fn main() !void {
    // prepare allocator
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    defer _ = gpa.deinit();
    const allocator = gpa.allocator();

    // get args
    const args = try std.process.argsAlloc(allocator);
    defer std.process.argsFree(allocator, args);

    // display args in order
    for (args, 1..) |arg, i| {
        std.debug.print("Argument {d}: {s}\n", .{ i, arg });
    }
}
