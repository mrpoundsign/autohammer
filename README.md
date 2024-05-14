# AutoHammer for [AutoForge](https://playautoforge.com/)

AutoHammer is a mod to make modding for AutoForge easier by creating hooks and systems so core files do not need to be overwritten by any other mod to augment AutoForge.

Currently the functionality is extremely limited. Contributions are welcome. Public access to TypeScript source is not possible, but please contact me on Diesord if you'd like access to the git hub repo for contributions.

## Development

Extract `src/autohammer` over the `sources.zip` from [AutoForge](https://playautoforge.com/).

Create an `init` directory, and place your init `.ts` file there. Examples in `src/scripts/init`.

### Distributing

Once you ahve a build, copy your `scripts/init/<mymod>.lua` and any other files for your mod out, and put them in an archive.

For example, this is the zip structure in AutoHammer, excluding the core overrides:
```
autohammer\scripts\autohammer\quickbar.lua
autohammer\scripts\autohammer\systems
autohammer\scripts\autohammer\systems\commands.lua
autohammer\scripts\init
autohammer\scripts\init\autohammer.lua
```
