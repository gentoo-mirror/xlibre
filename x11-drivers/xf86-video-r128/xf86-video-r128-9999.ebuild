# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8


inherit flag-o-matic xlibre

DESCRIPTION="ATI Rage128 video driver"
if [[ ${PV} != 9999* ]]; then
	KEYWORDS="~amd64"
fi

src_configure() {
	# always use C11 semantics
	append-cflags -std=gnu11

	local XLIBRE_CONFIGURE_OPTIONS=(
		--disable-dri
	)
	xlibre_src_configure
}
