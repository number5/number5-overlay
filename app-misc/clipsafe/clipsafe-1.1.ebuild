# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit perl-app

DESCRIPTION="A Command Line Interface to Password Safe"
HOMEPAGE="http://waxandwane.org/clipsafe.html"
SRC_URI="http://waxandwane.org/download/${P}.tar.gz"

LICENSE="GPLv2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""


DEPEND=""
RDEPEND=">=dev-lang/perl-5.8
           dev-perl/DateTime
		   perl-core/Digest-SHA
		   dev-perl/Crypt-Twofish"

src_install() {
	 dobin clipsafe
}

