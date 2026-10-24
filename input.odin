package main

import rl "vendor:raylib"

get_player_direction :: proc() -> f32 {
    if is_pressing_left() {
        return -1
    }

    if is_pressing_right() {
        return 1
    }

    return 0
}

is_pressing_left :: proc() -> bool {
    return rl.IsKeyDown(.A) || rl.IsKeyDown(.LEFT)
}

is_pressing_right :: proc() -> bool {
    return rl.IsKeyDown(.D) || rl.IsKeyDown(.RIGHT)
}

