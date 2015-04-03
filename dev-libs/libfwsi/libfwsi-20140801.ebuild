# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit versionator

MY_DATE="$(get_version_component_range 1)"

DESCRIPTION="Library to access the Windows Shell Item format"
HOMEPAGE="https://code.google.com/p/libfwsi"
SRC_URI="https://googledrive.com/host/0B3fBvzttpiiSajVqblZQT3FYZzg/${PN}-experimental-${MY_DATE}.tar.gz"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="~amd64 ~hppa ~ppc ~x86"
IUSE="python"

DEPEND=" python? ( dev-lang/python )
	dev-libs/libcerror
	dev-libs/libcthreads
	dev-libs/libcdata
	dev-libs/libclocale
	dev-libs/libcnotify
	dev-libs/libfdatetime
	dev-libs/libfguid
	dev-libs/libuna"
RDEPEND="${DEPEND}"

S="${WORKDIR}/${PN}-${MY_DATE}"

src_configure() {
    econf $(use_enable python)
}
