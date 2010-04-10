# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

inherit eutils


DESCRIPTION="A simple screenshot utility, lets you capture entire screen \ 
or just a region."
HOMEPAGE="http://www.softcraft.org/gsnapshot/"
#SRC_URI="http://downloads.sourceforge.net/sourceforge/gould/${P}.tar.gz"
SRC_URI="mirror://sourceforge/gould/${P}.tar.gz"
KEYWORDS="x86"
SLOT="0"

RDEPEND="x11-libs/libSM
         x11-libs/gtk+"
DEPEND="${RDEPEND}"


src_unpack() {
	unpack ${A}
	cd "${S}"
	epatch "${FILESDIR}"/001-src.Makefile.am.patch
	epatch "${FILESDIR}"/002-common.Makefile.am.patch
	epatch "${FILESDIR}"/003-programs.Makefile.am.patch
}

src_compile() {
	einfo "Generating configure script"
	./autogen.sh 2>/dev/null 1>/dev/null || die "error running autogen.sh"

	econf || die "econf failed"
	emake || die "emake failed"
}

src_install() {
	emake DESTDIR="${D}" install || die "install failed"
}


