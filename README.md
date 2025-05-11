# Luanti AppImage

## About

Automatically generated AppImages for [Luanti][luanti] (formerly minetest) on x86-64 architecture.

## Why

I used to use [a pre-built AppImage][anonymous-repo], but it hasn't been updated for quite some time, and I don't like ~~minetest~~ Luanti nagging me for updates.  
Also, automating this process would be useful because an AppImage would be created as soon as\* an update is pushed.

\*: depends on the interval for checking updates, set to one week for now.

## How

It uses GitHub Actions to first check if there's a new release available. If so, it builds Luanti from source on Ubuntu 22.04(using Docker, because we dislike vendor lock-in and also want to be able to test the flow locally), and puts the final binary and all its dependencies into an AppImage(following AppDir specification using linuxdeploy). After that creates a new release with the help of some nifty actions.

## Installation

### Automatic

1. Download [ivan-hc/AM][am], a nice tool to install and manage AppImages.

2. Since this repo isn't in AM's list, you have to add it manually.

```bash
am extra zyachel/luanti-appimage luanti
```

3. (Optional) To update, simply run the following:

```bash
am update luanti
```

### Manual

1. Go to [the releases page][releases page] and download [the latest release][latest release].
2. Modify and run the following in your terminal emulator:

```bash
chmod +x ./path/to/Lunati-<version>.AppImage
```

## Build locally

1. You need docker on your machine.

2. clone this repository, or just copy `Dockerfile`, `docker-compose.yml`, and `build.sh` to a directory.

3. run
```bash
export LATEST_VERSION=5.11.0 # replace with your desired version number.
docker compose up --build
chmod +x "./output/Luanti-$LATEST_VERSION.AppImage"
```

## Caveats

I've only tested this on my machines(Debian trixie, Debian bookworm, and EndeavourOS Neo), so it may not work on yours. If that's the case, file a new issue and help me fix it.

## To-Do

- [x] Try not to add redundant dependencies to the final AppImage.
- [ ] Add support for i386.
- [ ] Generate a `.deb` alongside.
- [ ] Test on different machines.
- [x] A better installation method

## Credits

- [An0n3m0us][anonymous-repo]'s initial implementation, especially [this issue by @Lejo1][issue].
- [linuxdeploy][linuxdeploy], for doing the actual packaging. 
- [appimage-builder][appimage-builder], for their magical tool for creating AppImages, was used prior to current linuxdeploy setup.
- [localsend]'s workflow.
- all the GitHub actions that are being used
- [luanti][luanti], for the game :)

<!-- links -->

[luanti]: https://www.luanti.org/
[anonymous-repo]: https://github.com/An0n3m0us/Minetest-AppImages/
[issue]: https://github.com/An0n3m0us/Minetest-AppImages/issues/3
[linuxdeploy]: https://github.com/linuxdeploy/linuxdeploy/
[appimage-builder]: https://appimage-builder.readthedocs.io/
[localsend]: https://github.com/localsend/localsend/blob/main/.github/workflows/linux_build.yml

[am]: https://github.com/ivan-hc/AM-Application-Manager/
[releases page]: https://github.com/zyachel/luanti-appimage/releases
[latest release]: https://github.com/zyachel/luanti-appimage/releases/latest
