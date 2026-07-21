pub fn main() !void {
    const username = "bücher";
    const normalized = normalize_username(username);
    std.debug.print("Normalized: {s}\n", .{normalized});
}
extern fn normalize_username(input: [*:0]const u8) ?[*:0]const u8;
