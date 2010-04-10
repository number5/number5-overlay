# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

inherit python git autotools

EGIT_REPO_URI="git://github.com/engla/python-keybinder.git"

DESCRIPTION="python module for gtk-based applications registering global key
bindings"
HOMEPAGE="http://kaizer.se/wiki/python-keybinder/"

LICENSE="LGPL"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=">=dev-lang/python-2.5"
RDEPEND="${DEPEND}"

src_configure() {
	${S}/autogen.sh
}
src_install() {
	emake DESTDIR="${D}" install
}
