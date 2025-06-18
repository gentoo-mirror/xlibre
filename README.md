### X11LIBRE Overlay  ###

This overlay is intended to enable building the X11LIBRE project under Gentoo.

### Using Overlay ###

```
# eselect repository add x11libre git https://github.com/X11Libre/ports-gentoo.git
# emaint sync -r x11libre
```

After that you can use this local overlay.


**Removing previously installed xorg if necessary:**

```
# emerge -C x11-base/xorg-server x11-base/xorg-drivers $(qlist -IC x11-drivers)

```

**Installing Xserver:**
```
# emerge -av --autounmask x11-base/xorg-server::x11libre
```

After installation, a new set for building drivers @x11libre-module-rebuild will be available:
```
emerge @x11libre-module-rebuild
```
After updating the server, this command can easily rebuild all dependent drivers.
