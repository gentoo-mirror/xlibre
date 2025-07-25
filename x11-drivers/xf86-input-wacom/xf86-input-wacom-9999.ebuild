# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8


inherit linux-info systemd udev xlibre meson

DESCRIPTION="Driver for Wacom tablets and drawing devices"
HOMEPAGE="https://linuxwacom.github.io/ https://github.com/X11Libre/xf86-input-wacom"

LICENSE="GPL-2+"
if [[ ${PV} != 9999* ]]; then
	KEYWORDS="~alpha ~amd64 ~arm ~arm64 ~loong ~ppc ~ppc64 ~riscv ~sparc ~x86"
fi
IUSE="test"
RESTRICT="!test? ( test )"

RDEPEND="
	x11-libs/libX11
	x11-libs/libXext
	x11-libs/libXi
	x11-libs/libXrandr
	x11-libs/libXinerama
	virtual/libudev:="
DEPEND="${RDEPEND}"

pkg_pretend() {
	linux-info_pkg_setup

	if ! linux_config_exists \
			|| ! linux_chkconfig_present HID_WACOM; then
		echo
		ewarn "If you use a USB Wacom tablet, you need to enable support in your kernel"
		ewarn "  Device Drivers --->"
		ewarn "    HID support  --->"
		ewarn "      Special HID drivers  --->"
		ewarn "        <*> Wacom Intuos/Graphire tablet support (USB)"
		echo
	fi
}

pkg_setup() {
	linux-info_pkg_setup
}

src_configure() {
	xlibre_flags_setup

	local emesonargs=(
		-Dsystemd-unit-dir="$(systemd_get_systemunitdir)"
		-Dudev-rules-dir="$(get_udevdir)/rules.d"
		$(meson_feature test unittests)
		-Dwacom-gobject=disabled
	)
	meson_src_configure
}

pkg_postinst() {
	udev_reload
}

pkg_postrm() {
	udev_reload
}
