# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

X11LIBRE_DRI=always
X11LIBRE_PACKAGE_NAME="xf86-video-ati"
inherit linux-info x11libre

if [[ ${PV} != 9999* ]]; then
	KEYWORDS="~amd64"
fi

DESCRIPTION="ATI video driver"
HOMEPAGE="https://www.x.org/wiki/ati/"

IUSE="udev"

RDEPEND="
	media-libs/mesa
	>=x11-libs/libdrm-2.4.89[video_cards_radeon]
	>=x11-libs/libpciaccess-0.8.0
	x11-base/x11libre-server[-minimal]
	udev? ( virtual/libudev:= )"
DEPEND="${RDEPEND}
	x11-base/xorg-proto"

pkg_pretend() {
	if use kernel_linux; then
		if kernel_is -ge 3 9; then
			CONFIG_CHECK="~!DRM_RADEON_UMS ~!FB_RADEON"
		else
			CONFIG_CHECK="~DRM_RADEON_KMS ~!FB_RADEON"
		fi
	fi
	check_extra_config
}

pkg_setup() {
	linux-info_pkg_setup
	x11libre_pkg_setup
}

src_configure() {
	local X11LIBRE_CONFIGURE_OPTIONS=(
		--enable-glamor
		$(use_enable udev)
	)
	x11libre_src_configure
}
