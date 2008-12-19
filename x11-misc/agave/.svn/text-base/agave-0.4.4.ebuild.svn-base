# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="Agave is a GTK color scheme generator"
HOMEPAGE="http://home.gna.org/colorscheme/"
SRC_URI="http://download.gna.org/colorscheme/releases/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 x86"
IUSE=""

DEPEND=">=dev-cpp/gtkmm-2.6.0
>=gnome-base/libgnomeui-2.0
>=dev-cpp/gconfmm-2.6.0
dev-libs/boost
>=dev-util/cppunit-1.10
dev-cpp/libglademm"
RDEPEND=">=gnome-base/libgnomeui-2.0
>=dev-cpp/gconfmm-2.6.0
>=dev-cpp/gtkmm-2.6.0"

src_install() {
    emake DESTDIR=${D} install || die "emake install failed"
    
    dodoc AUTHORS ChangeLog README NEWS TODO
}
