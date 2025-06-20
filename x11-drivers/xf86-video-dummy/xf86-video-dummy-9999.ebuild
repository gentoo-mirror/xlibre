# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8


inherit xlibre

DESCRIPTION="X.Org driver for dummy cards"
if [[ ${PV} != 9999* ]]; then
	KEYWORDS="~amd64"
fi
