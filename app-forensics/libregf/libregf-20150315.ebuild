# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

PYTHON_COMPAT=( python2_7 )

inherit versionator autotools-utils python-single-r1

MY_DATE="$(get_version_component_range 1)"

DESCRIPTION="Library and tools to access the Windows NT Registry File (REGF) format."
HOMEPAGE="http://github.com/libyal/libregf/"
SRC_URI="https://github.com/libyal/${PN}/releases/download/${MY_DATE}/${PN}-alpha-${MY_DATE}.tar.gz"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~x64-macos ~x86-macos"
IUSE="debug fuse nls python unicode"
REQUIRED_USE="python? ( ${PYTHON_REQUIRED_USE} )"

DEPEND="nls? (
			virtual/libiconv
			virtual/libintl
		)
	fuse? ( sys-fs/fuse )
	python? ( ${PYTHON_DEPS} )
	dev-libs/libuna
	app-forensics/libbfio"

AUTOTOOLS_IN_SOURCE_BUILD=1

pkg_setup() {
	use python && python-single-r1_pkg_setup
}

src_configure() {
	local myeconfargs=(
		$(use_enable nls)
		$(use_with nls libiconv-prefix)
		$(use_with nls libintl-prefix)
		$(use_enable unicode wide-character-type)
		$(use_enable debug verbose-output)
		$(use_enable debug debug-output)
		$(use_enable python)
		$(use_with fuse libfuse)
	)
	autotools-utils_src_configure
}

src_compile() {
	autotools-utils_src_compile
	if use python; then
		emake -C pyregf
	fi
}

src_install() {
	autotools-utils_src_install
	if use python; then
		emake -C pyregf DESTDIR="${D}" install
	fi
}
