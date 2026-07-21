pub fn main() !void {
    const username = "bücher";
    const normalized = normalize_username(username);
    std.debug.print("Normalized: {s}\n", .{normalized});
}
