# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit versionator autotools-utils
AUTOTOOLS_IN_SOURCE_BUILD=1
MY_DATE="$(get_version_component_range 1)"

DESCRIPTION="Library and tools to read the Notes Storage Facility (NSF) database file format"
HOMEPAGE="http://code.google.com/p/libnsfdb/"
SRC_URI="https://googledrive.com/host/0B3fBvzttpiiSbkI4d1pRQmdMNWc/${PN}-experimental-${MY_DATE}.tar.gz"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~x86-macos ~x64-macos"
IUSE="debug nls unicode"

DEPEND="
	nls? (
		virtual/libintl
		virtual/libiconv
	)
	dev-libs/libuna
	app-forensics/libbfio
	dev-libs/openssl"
RDEPEND="${DEPEND}"

AUTOTOOLS_IN_SOURCE_BUILD=1

src_configure() {
	local myeconfargs=(
		$(use_enable nls)
		$(use_with nls libiconv-prefix)
		$(use_with nls libintl-prefix)
		$(use_enable unicode wide-character-type)
		$(use_enable debug debug-output)
		$(use_enable debug verbose-output)
	)
	autotools-utils_src_configure
}
