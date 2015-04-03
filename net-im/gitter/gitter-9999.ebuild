# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"

inherit multilib distutils git-r3

MY_PV=${PV/_p/-}
MY_PN=${PN%%-bin-debian}

DESCRIPTION="gitter IM Client"
HOMEPAGE="https://gitter.im/apps"
SRC_URI=""
EGIT_REPO_URI="https://github.com/gitterHQ/desktop.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="Doc"

DEPEND="${RDEPEND}"
RDEPEND="net-libs/nodejs"

S=${WORKDIR}

QA_PREBUILT="usr/lib*/${MY_PN}/*"
src_install() {
	insinto /opt/gitter/linux64
	doins -r *

	fperms +x /opt/gitter/linux64

	dobin "${FILESDIR}/opt/gitter/linux64"
	dosym /opt/Gitter/linux64/Gitter /usr/local/bin/gitter

	make_desktop_entry gitter Gitter \
		"/opt/gitter/linux64logo.png" \
		Network
	distutils-r1_src_install
	use doc && dodoc -r /usr/share/doc/gitter/*	
	echo sid > "${D}"/etc/debian_version || die
}

}
pkg_postinst() {
	elog "Gitter Debian is installed"
}

#https://github.com/gitterHQ/desktop.git
