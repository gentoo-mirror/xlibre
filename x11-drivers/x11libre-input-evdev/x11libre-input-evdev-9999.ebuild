# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

X11LIBRE_PACKAGE_NAME="xf86-input-evdev"
inherit linux-info x11libre

DESCRIPTION="Generic Linux input driver"
if [[ ${PV} != 9999* ]]; then
	KEYWORDS="~amd64"
fi

RDEPEND="
	x11-base/x11libre-server[udev]
	dev-libs/libevdev
	sys-libs/mtdev
	virtual/libudev:="
DEPEND="
	${RDEPEND}
	>=sys-kernel/linux-headers-2.6
	x11-base/xorg-proto"

pkg_pretend() {
	if use kernel_linux ; then
		CONFIG_CHECK="~INPUT_EVDEV"
	fi
	check_extra_config
}
