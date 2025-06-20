# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
X11LIBRE_PACKAGE_NAME="xf86-video-fbdev"
inherit x11libre

DESCRIPTION="video driver for framebuffer device"
if [[ ${PV} != 9999* ]]; then
	KEYWORDS="~amd64"
fi
