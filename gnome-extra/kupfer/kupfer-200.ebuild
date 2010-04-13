# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

DESCRIPTION="kupfer, a convenient command and access tool"
HOMEPAGE="http://kaizer.se/wiki/kupfer/"

SRC_URI="http://kaizer.se/publicfiles/${PN}/${PN}-v${PV}.tar.gz"

LICENSE="GPLv3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="+keybinder"

DEPEND=">=dev-lang/python-2.5
	sys-devel/gcc
	dev-python/pygtk
	dev-python/pyxdg
	dev-python/dbus-python
	dev-python/libwnck-python
	dev-python/pygobject
	dev-python/libgnome-python
	keybinder? ( dev-python/keybinder )"
RDEPEND="${DEPEND}"

S=${WORKDIR}/${PN}-v${PV}

src_configure() {
	./waf configure --prefix=/usr
}

src_compile() {
	./waf
}

src_install() {
	./waf --destdir="${D}" install
}
