# XLibre Overlay

This overlay is intended to enable building the [XLibre Xserver](https://github.com/X11Libre) project on [Gentoo Linux](https://www.gentoo.org/).

## How to install the overlay

Use [`eselect-repository`](https://wiki.gentoo.org/wiki/Eselect/Repository):

```
# eselect repository add xlibre git https://github.com/X11Libre/ports-gentoo
```

You may want to adjust the [priority][repoprio] of the `xlibre` repository in `/etc/portage/repos.conf` like so:

```
[xlibre]
...
priority = 9999
...
```

Now you can use `emerge --sync xlibre` or `emaint sync -r xlibre` to sync this
repository.

The `x11-base/xlibre-server` package in this overlay causes file collisions with the
`x11-base/xorg-server::gentoo` package. When switching to this overlay first fetch
the XLibre Server package and then remove the X.Org Server and drivers packages before
installing `x11-base/xlibre-server` and the `x11-base/xorg-server::xlibre` dummy package:

```
# emerge -f x11-base/xlibre-server
# emerge -C x11-base/xorg-server
# emerge -C x11-base/xorg-drivers
# emerge -av1 x11-base/xlibre-server
# emerge @x11-module-rebuild
# emerge @preserved-rebuild
```

## Using the overlay

Right now there is no released version of XLibre Xserver. To use the XLibre Git live ebuilds, add the following lines to your `/etc/portage/package.accept_keywords` file:

```
x11-base/xlibre-drivers **
x11-base/xlibre-server **
x11-base/xorg-server **
x11-drivers/xf86-input-elographics **
x11-drivers/xf86-input-evdev **
x11-drivers/xf86-input-joystick **
x11-drivers/xf86-input-libinput **
x11-drivers/xf86-input-synaptics **
x11-drivers/xf86-input-vmmouse **
x11-drivers/xf86-input-wacom **
x11-drivers/xf86-video-amdgpu **
x11-drivers/xf86-video-ast **
x11-drivers/xf86-video-ati **
x11-drivers/xf86-video-dummy **
x11-drivers/xf86-video-fbdev **
x11-drivers/xf86-video-geode **
x11-drivers/xf86-video-intel **
x11-drivers/xf86-video-mga **
x11-drivers/xf86-video-nouveau **
x11-drivers/xf86-video-qxl **
x11-drivers/xf86-video-r128 **
x11-drivers/xf86-video-siliconmotion **
x11-drivers/xf86-video-vesa **
x11-drivers/xf86-video-vmware **
```

If `/etc/portage/package.accept_keywords` is a directory, then create a file `/etc/portage/package.accept_keywords/xlibre` with the above content.

**WARNING** The live ebuilds may break at any time. Use them only if you want to develop or alpha test XLibre. If in doubt, wait for the first release.

[repoprio]: [Ebuild repository priority - /etc/portage/repos.conf - Gentoo wiki](https://wiki.gentoo.org/wiki//etc/portage/repos.conf#Ebuild_repository_priority)
