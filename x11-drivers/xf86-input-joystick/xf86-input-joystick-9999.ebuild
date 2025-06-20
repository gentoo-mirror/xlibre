# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8


inherit xlibre

DESCRIPTION="X.Org driver for joystick input devices"
if [[ ${PV} != 9999* ]]; then
	KEYWORDS="~amd64"
fi

src_install() {
	xlibre_src_install

	insinto /usr/share/X11/xorg.conf.d
	doins config/50-joystick-all.conf
}
