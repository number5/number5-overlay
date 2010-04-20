# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $


# The EAPI variable tells the ebuild format in use.
# Defaults to 0 if not specified. The current PMS draft contains details on
# a proposed EAPI=0 definition but is not finalized yet.
# Eclasses will test for this variable if they need to use EAPI > 0 features.
#EAPI=0

# inherit lists eclasses to inherit functions from. Almost all ebuilds should
# inherit eutils, as a large amount of important functionality has been
# moved there. For example, the epatch call mentioned below wont work
# without the following line:
inherit eutils

# Short one-line description of this package.
DESCRIPTION="uWSGI is a fast (pure C), self-healing, developer-friendly WSGI
server"

# Homepage, not used by Portage directly but handy for developer reference
HOMEPAGE="http://projects.unbit.it/uwsgi"
MY_PV=${PV/_/-}
MY_P=${PN}-${MY_PV}
# Point to any required sources; these will be automatically downloaded by
# Portage.
SRC_URI="http://projects.unbit.it/downloads/${MY_P}.tar.gz"

# License of the package.  This must match the name of file(s) in
# /usr/portage/licenses/.  For complex license combination see the developer
# docs on gentoo.org for details.
LICENSE="GPLv2"

SLOT="0"

KEYWORDS="~x86"

IUSE=""


# Build-time dependencies, such as
#    ssl? ( >=dev-libs/openssl-0.9.6b )
#    >=dev-lang/perl-5.6.1-r1
# It is advisable to use the >= syntax show above, to reflect what you
# had installed on your system when you tested the package.  Then
# other users hopefully won't be caught without the right version of
# a dependency.
DEPEND="dev-libs/libxml2"

# Run-time dependencies. Must be defined to whatever this depends on to run.
# The below is valid if the same run-time depends are required to compile.
RDEPEND="${DEPEND}"

# Source directory; the dir where the sources can be found (automatically
# unpacked) inside ${WORKDIR}.  The default value for S is ${WORKDIR}/${P}
# If you don't need to change it, leave the S= line out of the ebuild
# to keep it tidy.
S="${WORKDIR}/${MY_P}"


# The following src_compile function is implemented as default by portage, so
# you only need to call it, if you need a different behaviour.
#src_compile() {

	#emake || die "emake failed"
#}

src_install() {
	# You must *personally verify* that this trick doesn't install
	# anything outside of DESTDIR; do this by reading and
	# understanding the install part of the Makefiles.
	# This is the preferred way to install.
	#emake DESTDIR="${D}" install || die "emake install failed"

	dobin uwsgi || die "uwsgi install failed"
	# The portage shortcut to the above command is simply:
	#
	#einstall || die "einstall failed"
}
