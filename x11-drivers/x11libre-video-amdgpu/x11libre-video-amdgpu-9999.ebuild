# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
X11LIBRE_DRI="always"
X11LIBRE_PACKAGE_NAME="xf86-video-amdgpu"
inherit x11libre

if [[ ${PV} != 9999* ]]; then
	KEYWORDS="~amd64"
fi

DESCRIPTION="Accelerated Open Source driver for AMDGPU cards"

IUSE="udev"

RDEPEND=">=x11-libs/libdrm-2.4.89[video_cards_amdgpu]
	x11-base/x11libre-server[-minimal]
	udev? ( virtual/libudev:= )"
DEPEND="${RDEPEND}"

src_configure() {
	local X11LIBRE_CONFIGURE_OPTIONS=(
		--enable-glamor
		$(use_enable udev)
	)
	x11libre_src_configure
}
