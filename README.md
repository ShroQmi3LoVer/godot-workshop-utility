# Godot Workshop Utility
Small utility used to upload content to Steam Workshop with Godot. It is early in development and will most likely undergo a lot of changes. Made to work with the [Godot-ModUploader](https://github.com/GodotModding/godot-mod-loader). Also make sure to have followed this [Steam Workshop implementation guide](https://partner.steamgames.com/doc/features/workshop/implementation) before adding this utility.

Requires [GodotSteam](https://godotsteam.com), can be the extension or the binary.

## How to use (if you are a gamedev)
1. Place the entire `godot-workshop-utility` directory into your godot game so that modders can run it after they decompile your game (or if you release the source code to them).
1. Change the values on the `SteamService` node to reflect your steam app id and workshop tag configuration.
1. You could also distrubute it with your game as a seperate binary file. If you do this, you can put you appid and tags as keys in `steam_data.json`. 
