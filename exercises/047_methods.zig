const std = @import("std");

// Look at this hideous Alien struct. Know your enemy!
const Alien = struct {
    health: u8,

    // We hate this method:
    pub fn hatch(strength: u8) Alien {
        return Alien{
            .health = strength * 5,
        };
    }
};

// Your trusty weapon. Zap those aliens!
const HeatRay = struct {
    damage: u8,

    // We love this method:
    pub fn zap(self: HeatRay, alien: *Alien) void {
        alien.health -= if (self.damage >= alien.health) alien.health else self.damage;
    }
};

pub fn main() void {
    // Look at all of these aliens of various strengths!
    var aliens = [_]Alien{
        Alien.hatch(2),
        Alien.hatch(1),
        Alien.hatch(3),
        Alien.hatch(3),
        Alien.hatch(5),
        Alien.hatch(3),
    };

    var aliens_alive = aliens.len;
    const heat_ray = HeatRay{ .damage = 7 }; // We've been given a heat ray weapon.

    // We'll keep checking to see if we've killed all the aliens yet.
    while (aliens_alive > 0) {
        aliens_alive = 0;

        // Loop through every alien by reference (* makes a pointer capture value)
        for (&aliens) |*alien| {
            heat_ray.zap(alien);
            if (alien.health > 0) aliens_alive += 1;
        }

        std.debug.print("{} aliens. ", .{aliens_alive});
    }

    std.debug.print("Earth is saved!\n", .{});
}
