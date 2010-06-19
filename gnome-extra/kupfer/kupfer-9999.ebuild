# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
inherit git

DESCRIPTION="kupfer, a convenient command and access tool"
HOMEPAGE="http://kaizer.se/wiki/kupfer/"

EGIT_REPO_URI="http://github.com/engla/kupfer.git"

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

#S=${WORKDIR}/${PN}-v${PV}

src_configure() {
	wget -O waf "http://waf.googlecode.com/files/waf-1.5.8"
	chmod a+x waf
	./waf configure --prefix=/usr
}

src_compile() {
	./waf
}

src_install() {
	./waf --destdir="${D}" install
}
