# Godot Workshop Utility
Small utility used to upload content to Steam Workshop with Godot. It is early in development and will most likely undergo a lot of changes. Made to work with the [Godot-ModUploader](https://github.com/GodotModding/godot-mod-loader). Also make sure to have followed this [Steam Workshop implementation guide](https://partner.steamgames.com/doc/features/workshop/implementation) before adding this utility.

Requires [GodotSteam](https://godotsteam.com), can be the extension or the binary.

## How to use (if you are a gamedev)
1. Create a `steam_data.json` file containing the `app_id` key and set its value to your game's Steam app ID.
2. Place the entire `godot-workshop-utility` directory into your godot game so that modders can run it after they decompile your game (or if you release the source code to them).
3. You could also distrubute it with your game as a seperate binary file.

## Options

1. Add a `tags` key to the `steam_data.json` file and set its value to an array of tags corresponding to the ones you've set in the Steam backend. (***Edit Steamworks settings*** > ***Workshop*** > ***Tags***) 
This will allow users to set tags for their mod.
