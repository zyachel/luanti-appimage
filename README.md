# Luanti AppImage

## About

Automatically generated AppImages for [Luanti][luanti] (formerly minetest) on x86-64 architecture.

## Why

I used to use [a pre-built AppImage][anonymous-repo], but it hasn't been updated for quite some time, and I don't like ~~minetest~~ Luanti nagging me for updates.  
Also, automating this process would be useful because an AppImage would be created as soon as\* an update is pushed.

\*: depends on the interval for checking updates, set to two days for now.

## How
It uses GitHub Actions to first check if there's a new release available. If so, it builds Luanti from source on Ubuntu 22.04. Then using appimage-builder, puts the final binary and all its dependencies into an AppImage(following AppDir specification). And finally creates a new release with the help of some nifty actions.

## Installation

1. Go to the releases tab and download the latest release.
2. run `chmod +x ./path/to/Lunati-<version>.AppImage` in your terminal emulator.

## Caveats

- I've only tested this on my machine(Debian trixie), so it may not work on yours. If that's the case, file a new issue and help me fix it.
- File size is bigger by \~5mb compared to [An0n3m0us][anonymous-repo]'s AppImages, as I have added more(almost all output by `ldd`) dependencies.

## To-Do:

- [ ]: Try not to add redundant dependencies to the final AppImage.
- [ ]: Add support for i386.
- [ ]: Generate a `.deb` alongside.
- [ ]: Test on different machines.

## Credits
- [An0n3m0us][anonymous-repo]'s initial implementation, especially [this issue by @Lejo1][issue].
- [appimage-builder][appimage-builder], for their magical tool for creating AppImages.
- [localsend]'s workflow.
- all the GitHub actions that are being used
- [luanti][luanti], for the game :)

[luanti]: https://www.luanti.org/
[anonymous-repo]: https://github.com/An0n3m0us/Minetest-AppImages/
[issue]: https://github.com/An0n3m0us/Minetest-AppImages/issues/3
[appimage-builder]: https://appimage-builder.readthedocs.io/
[localsend]: https://github.com/localsend/localsend/blob/main/.github/workflows/linux_build.ymlz