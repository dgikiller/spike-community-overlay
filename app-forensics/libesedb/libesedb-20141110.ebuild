# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

PYTHON_COMPAT=( python2_7 )

inherit versionator autotools-utils python-single-r1

MY_DATE="$(get_version_component_range 1)"

DESCRIPTION="Library and tools to access the Extensible Storage Engine (ESE) Database File (EDB) format"
HOMEPAGE="http://github.com/libyal/libesedb/"
SRC_URI="http://github.com/libyal/${PN}/releases/download/${MY_DATE}/${PN}-experimental-${MY_DATE}.tar.gz"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~x64-macos ~x86-macos"
IUSE="debug nls python threads unicode"
REQUIRED_USE="python? ( ${PYTHON_REQUIRED_USE} )"

RDEPEND="python? ( ${PYTHON_DEPS} )"

DEPEND="${RDEPEND}
	unicode? (
			virtual/libiconv
			virtual/libintl )
	dev-libs/libuna
	app-forensics/libbfio"

AUTOTOOLS_IN_SOURCE_BUILD=1

pkg_setup() {
	use python && python-single-r1_pkg_setup
}

src_configure() {
	local myeconfargs=(
		$(use_enable unicode wide-character-type)
		$(use_with unicode libiconv-prefix)
		$(use_with unicode libintl-prefix)
		$(use_enable threads multi-threading-support)
		$(use_enable debug debug-output)
		$(use_enable debug verbose-output)
		$(use_enable python)
	)
	autotools-utils_src_configure
}

src_compile() {
	autotools-utils_src_compile
	if use python; then
		emake -C pyesedb
	fi
}

src_install() {
	autotools-utils_src_install
	if use python; then
		emake DESTDIR="${D}" -C pyesedb install
	fi
}
