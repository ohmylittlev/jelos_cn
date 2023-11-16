# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)
# Copyright (C) 2019-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="exfat"
PKG_VERSION="0b41c6d"
PKG_LICENSE="GPLv2+"
PKG_SITE="https://github.com/relan/exfat"
PKG_URL="${PKG_SITE}/archive/${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain fuse2 fuse"
PKG_DEPENDS_INIT="toolchain exfat"
PKG_LONGDESC="This project aims to provide a full-featured exFAT file system implementation for GNU/Linux other Unix-like systems as a FUSE module."
PKG_TOOLCHAIN="autotools"

make_init() {
  : # reuse make_target()
}

makeinstall_init() {
  mkdir -p ${INSTALL}/usr/sbin
  cp ../.install_pkg/usr/sbin/exfatfsck ${INSTALL}/usr/sbin
  ln -sf exfatfsck ${INSTALL}/usr/sbin/fsck.exfat
}
