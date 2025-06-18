# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

X11LIBRE_PACKAGE_NAME="xf86-input-libinput"
inherit linux-info x11libre

DESCRIPTION="X.org input driver based on libinput"
if [[ ${PV} != 9999* ]]; then
	KEYWORDS="~amd64"
fi

RDEPEND=">=dev-libs/libinput-1.23.0:0="
DEPEND="${RDEPEND}
	>=x11-base/xorg-proto-2021.5"

DOCS=( "README.md" )

pkg_pretend() {
	CONFIG_CHECK="~TIMERFD"
	check_extra_config
}
