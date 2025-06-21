# XLibre Overlay

This overlay is intended to enable building the [XLibre Xserver](https://github.com/X11Libre) project on [Gentoo Linux](https://www.gentoo.org/).

## How to install the overlay

Use [`eselect-repository`](https://wiki.gentoo.org/wiki/Eselect/Repository):

```
# eselect repository add xlibre git https://github.com/X11Libre/ports-gentoo
```

You may want to adjust the [priority](https://wiki.gentoo.org/wiki//etc/portage/repos.conf#Ebuild_repository_priority) of the `xlibre` repository in `/etc/portage/repos.conf` like so:

```
[xlibre]
...
priority = 100
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

Right now there is no released version of XLibre Xserver. To use the XLibre [live ebuilds](https://wiki.gentoo.org/wiki/Live_ebuilds), add the following lines to your [/etc/portage/package.accept\_keywords](https://wiki.gentoo.org/wiki//etc/portage/package.accept_keywords) file:

```
*/*::xlibre **
```

**Or** for the individual packages:

```
x11-base/xlibre-drivers **
x11-base/xlibre-server **
x11-base/xorg-server **
x11-drivers/xf86-input-elographics **
x11-drivers/xf86-input-evdev **
x11-drivers/xf86-input-joystick **
x11-drivers/xf86-input-libinput **
x11-drivers/xf86-input-synaptics **
x11-drivers/xf86-input-void **
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

If `/etc/portage/package.accept_keywords` is a directory, then create a file like `/etc/portage/package.accept_keywords/xlibre` containing one of the above blocks.

**WARNING:** The live ebuilds may break at any time. Use them only if you want to develop or alpha test XLibre. If in doubt, wait for the first release.

## Testing Third-Party Repositories Added as a Pull Request

To build pull requests from third-party repositories using the Git live ebuilds you can override the Git repo, branch and commit values set in the ebuild. Just provide one or more of the following variables on the command line:

```
EGIT_OVERRIDE_REPO_*
EGIT_OVERRIDE_BRANCH_*
EGIT_OVERRIDE_COMMIT_*
```

For example:

```
EGIT_OVERRIDE_REPO_X11LIBRE_XSERVER="https://github.com/probonopd/xserver" EGIT_OVERRIDE_BRANCH_X11LIBRE_XSERVER="patch-2"  emerge -1 x11-base/xlibre-server
```

where in this example `X11LIBRE` is the capitalized name of the Github project and `XSERVER` is the capitalized name of the Github repository of the live ebuild.

You will see the actual names of the variables specific to each ebuild when you unpack it, e.g.:

```
# ebuild xlibre-server-9999.ebuild unpack
```

For further reference of the override mechanism see [git-r3.eclass – Gentoo Development Guide](https://devmanual.gentoo.org/eclass-reference/git-r3.eclass/index.html) and its implementation.

## Using an Alternative udev Implementation

If you like to use XLibre with udev support but stay away from eudev/systemd you may want to consider [sys-libs/libudev-zero - Gentoo Portage Overlays](https://gpo.zugaina.org/sys-libs/libudev-zero).
