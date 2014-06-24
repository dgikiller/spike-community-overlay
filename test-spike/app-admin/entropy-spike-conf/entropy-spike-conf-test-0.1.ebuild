﻿# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $
# if the repo url's change ie mirriors , can quickly be added and deployed...
EAPI=5
inherit eutils 

DESCRIPTION="Entropy Package Manager Spike repo Conf"
HOMEPAGE="http://spike-pentesting.org/"
LICENSE="GPL-2"

SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

cat > /etc/entropy/repositories.conf.d/entropy_spike-pentesting << EOL
line 1, [spike]
line 2,desc = Spike Pentesting Sabayon Repository
line 3,repo = http://repository.spike-pentesting.org#bz2
line 4, enabled = true
line 5, pkg = http://repository.spike-pentesting.org
line ...
EOL



