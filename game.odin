package main

import rl "vendor:raylib"

RESOLUTION_WIDTH :: 320
RESOLUTION_HEIGHT :: 180

//Pixels per second
player_speed : f32 : 100

main::proc() {
    // Integer scaling since pixel art looks terrible otherwise.
    scale: i32 = 4
    rl.InitWindow(RESOLUTION_WIDTH * scale, RESOLUTION_HEIGHT * scale, "Test")
    player_texture := rl.LoadTexture("./assets/player.png")

    player_position := get_player_position(scale, RESOLUTION_WIDTH / 2, RESOLUTION_HEIGHT / 2)
    for !rl.WindowShouldClose() {
        // if rl.IsWindowResized() {
        //     display.updateScale()
        // }

        player_position.x += get_player_direction() * player_speed * rl.GetFrameTime()
        
        rl.BeginDrawing()
		rl.ClearBackground({160, 200, 255, 255})
        rl.DrawTexture(player_texture, i32(player_position.x), i32(player_position.y), rl.WHITE)
		rl.EndDrawing()
    }
    rl.CloseWindow()
}

get_player_position::proc(scale: i32, posX, posY: f32) -> [2]f32 {
    return [2]f32{posX*f32(scale), posY*f32(scale)}
}