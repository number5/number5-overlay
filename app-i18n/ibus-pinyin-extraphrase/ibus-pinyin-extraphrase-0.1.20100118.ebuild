# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

DESCRIPTION="Chinese extra phrases for ibus-pinyin"
HOMEPAGE="http://code.google.com/p/ibus/"
SRC_URI="http://hslinuxextra.googlecode.com/files/${P}.tar.xz"

LICENSE="SOHU SOGOU"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=">app-i18n/ibus-pinyin-1.2.6"
RDEPEND=""

src_unpack() {
        tar -xf ${DISTDIR}/${A}
} 

src_install() {
	mkdir -p "${D}"/usr/share/ibus-pinyin-extraphrase
	cp "${S}"/data/* "${D}"/usr/share/ibus-pinyin-extraphrase
}

pkg_postinst() {
	ln -sf /usr/share/ibus-pinyin-extraphrase/sougou-full.db /usr/share/ibus-pinyin/db/local.db
        ewarn "Default IBus Pinyin phrase is link to /usr/share/ibus-pinyin/extraphrase/sougou-full.db,"
        ewarn "you can choice other phrase db file using those command:"
	ewarn "#ln -sf /usr/share/ibus-pinyin-extraphrase/[any .db file] /usr/share/ibus-pinyin/db/local.db"
	ewarn ""
	ewarn "All the phrase files owned by Sohu."
	elog
}

