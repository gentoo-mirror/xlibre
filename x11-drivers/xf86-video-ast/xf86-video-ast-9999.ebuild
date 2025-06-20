# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8


inherit xlibre

DESCRIPTION="XLibre driver for ASpeedTech cards"
if [[ ${PV} != 9999* ]]; then
	KEYWORDS="~amd64"
fi
