# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
inherit autotools git-2

DESCRIPTION="A tool similar to grep which searches text in PDFs"
HOMEPAGE="http://pdfgrep.sourceforge.net/"
SRC_URI=""
EGIT_REPO_URI="git://gitorious.org/pdfgrep/pdfgrep.git"

SLOT="0"
LICENSE="GPL-2"
KEYWORDS="~amd64 ~x86"
IUSE="unac zsh-completion"

RDEPEND="app-text/poppler
	unac? ( app-text/unac )
	zsh-completion? ( app-shells/zsh )"
DEPEND="${RDEPEND}
	app-text/asciidoc
	virtual/pkgconfig"

DOCS="AUTHORS NEWS README TODO"

src_prepare() {
	eautoreconf
}

src_configure() {
	econf $(use_with unac)
}

src_install() {
	default
	if use zsh-completion ; then
		insinto /usr/share/zsh/site-functions
		doins completion/_pdfgrep
	fi
}
