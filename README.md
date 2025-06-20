### XLibre Overlay  ###

This overlay is intended to enable building the XLibre project under Gentoo.

### Using Overlay ###

```
# eselect repository add xlibre git https://github.com/X11Libre/ports-gentoo.git
# emaint sync -r xlibre
```

After that you can use this local overlay.


**Removing previously installed xorg if necessary:**

```
# emerge -C x11-base/xorg-server x11-base/xorg-drivers $(qlist -IC x11-drivers)

```

**Installing Xserver:**
```
# emerge -av --autounmask x11-base/xlibre-server
```

After installation, a new set for building drivers @xlibre-module-rebuild will be available:
```
emerge @xlibre-module-rebuild
```
After updating the server, this command can easily rebuild all dependent drivers.
