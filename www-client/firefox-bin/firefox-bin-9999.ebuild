# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header:

inherit eutils mozilla-launcher multilib mozextension

MY_PV="3.6.4pre"
MY_PN="${PN/-bin}"
MY_P="${MY_PN}-${MY_PV}.en-US.linux-i686"

DESCRIPTION="Firefox Web Browser"
NIGHTLY_URI="http://ftp.mozilla.org/pub/mozilla.org/firefox/nightly/latest-mozilla-1.9.2/"
SRC_URI="${NIGHTLY_URI}/${MY_P}.tar.bz2"

#_PKG="firefox-3.6.4pre.en-US.linux-i686.tar.bz2"
#SRC_URI="http://ftp.mozilla.org/pub/mozilla.org/firefox/nightly/latest-mozilla-1.9.2/$_PKG"
HOMEPAGE="http://www.mozilla.com/firefox"
RESTRICT="strip nomirror"

KEYWORDS="-* ~amd64 ~x86"
SLOT="0"
LICENSE="|| ( MPL-1.1 GPL-2 LGPL-2.1 )"
IUSE="restrict-javascript"


DEPEND="app-arch/unzip"
RDEPEND="dev-libs/dbus-glib
	x11-libs/libXrender
	x11-libs/libXt
	x11-libs/libXmu
	x86? (
		>=x11-libs/gtk+-2.2
		 >=media-libs/alsa-lib-1.0.16
	)
	amd64? (
		>=app-emulation/emul-linux-x86-baselibs-20081109
		>=app-emulation/emul-linux-x86-gtklibs-20081109
		>=app-emulation/emul-linux-x86-soundlibs-20081109
	)"

PDEPEND="restrict-javascript? ( www-plugins/noscript )"

S="${WORKDIR}/${MY_PN}"

pkg_setup() {
	# This is a binary x86 package => ABI=x86
	# Please keep this in future versions
	# Danny van Dyk <kugelfang@gentoo.org> 2005/03/26
	has_multilib_profile && ABI="x86"
}


src_unpack() {
	unpack ${MY_P}.tar.bz2

}

src_install() {
	declare MOZILLA_FIVE_HOME=/opt/firefox

	# Install icon and .desktop for menu entry
	newicon "${S}"/chrome/icons/default/default48.png ${PN}-icon.png
	domenu "${FILESDIR}"/${PN}.desktop


	# Install firefox in /opt
	dodir ${MOZILLA_FIVE_HOME%/*}
	mv "${S}" "${D}"${MOZILLA_FIVE_HOME}


		# Create /usr/bin/firefox-bin
		dodir /usr/bin/
		cat <<EOF >"${D}"/usr/bin/${PN}
#!/bin/sh
unset LD_PRELOAD
LD_LIBRARY_PATH="/opt/firefox/"
exec /opt/${MY_PN}/${MY_PN} "\$@"
EOF
		fperms 0755 /usr/bin/${PN}

	# revdep-rebuild entry
	insinto /etc/revdep-rebuild
	doins "${FILESDIR}"/10${PN} || die

	rm -rf "${D}"${MOZILLA_FIVE_HOME}/plugins
	dosym /usr/"$(get_libdir)"/nsbrowser/plugins ${MOZILLA_FIVE_HOME}/plugins || die
}

pkg_postinst() {
	if use x86; then
		if ! has_version 'gnome-base/gconf' || ! has_version 'gnome-base/orbit' \
			|| ! has_version 'net-misc/curl'; then
			einfo
			einfo "For using the crashreporter, you need gnome-base/gconf,"
			einfo "gnome-base/orbit and net-misc/curl emerged."
			einfo
		fi
		if has_version 'net-misc/curl' && built_with_use --missing \
			true 'net-misc/curl' nss; then
			einfo
			einfo "Crashreporter won't be able to send reports"
			einfo "if you have curl emerged with the nss USE-flag"
			einfo
		fi
	else
		einfo
		einfo "NB: You just installed a 32-bit ${MY_P}"
		einfo
		einfo "Crashreporter won't work on amd64"
		einfo
	fi
	update_mozilla_launcher_symlinks
}

pkg_postrm() {
	update_mozilla_launcher_symlinks
}
