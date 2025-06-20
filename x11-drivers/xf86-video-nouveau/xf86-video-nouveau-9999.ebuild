# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

X11LIBRE_DRI="always"
X11LIBRE_PACKAGE_NAME="xf86-video-nouveau"
inherit xlibre

DESCRIPTION="Accelerated Open Source driver for nVidia cards"
HOMEPAGE="
	https://nouveau.freedesktop.org/
	https://github.com/X11Libre/xf86-video-nouveau
"
if [[ ${PV} != 9999* ]]; then
	KEYWORDS="~amd64"
fi

RDEPEND=">=x11-libs/libdrm-2.4.60[video_cards_nouveau]
	virtual/libudev:="
DEPEND="${RDEPEND}"
