# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

X11LIBRE_PACKAGE_NAME="xf86-video-geode"
inherit xlibre

DESCRIPTION="AMD Geode GX and LX graphics driver"
if [[ ${PV} != 9999* ]]; then
	KEYWORDS="~amd64"
fi
IUSE="ztv"

DEPEND="
	ztv? (
		sys-kernel/linux-headers
	)
"

src_configure() {
	local X11LIBRE_CONFIGURE_OPTIONS=(
		$(use_enable ztv)
	)
	xlibre_src_configure
}
