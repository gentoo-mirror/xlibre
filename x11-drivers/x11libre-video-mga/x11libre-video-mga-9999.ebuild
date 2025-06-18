# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

X11LIBRE_PACKAGE_NAME="xf86-video-mga"
inherit x11libre

DESCRIPTION="Matrox video driver"
if [[ ${PV} != 9999* ]]; then
	KEYWORDS="~amd64"
fi

src_configure() {
	local X11LIBRE_CONFIGURE_OPTIONS=(
		--disable-dri
	)
	x11libre_src_configure
}
