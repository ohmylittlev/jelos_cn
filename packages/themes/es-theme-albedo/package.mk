# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2020 Shanti Gilbert (https://github.com/shantigilbert)
# Copyright (C) 2020 351ELEC team (https://github.com/fewtarius/351ELEC)
# Copyright (C) 2023 JELOS (https://github.com/JustEnoughLinuxOS)

PKG_NAME="es-theme-albedo"
PKG_VERSION="3b159a7a2b14a91b38cf6bd28773267104a51788"
PKG_ARCH="any"
PKG_LICENSE="CUSTOM"
PKG_SITE="https://github.com/ohmylittlev/es-theme-albedo"
PKG_URL="${PKG_SITE}.git"
GET_HANDLER_SUPPORT="git"
PKG_SHORTDESC="es-theme-albedo"
PKG_LONGDESC="es-theme-albedo"
PKG_TOOLCHAIN="manual"

makeinstall_target() {
  mkdir -p ${INSTALL}/usr/share/themes/${PKG_NAME}
  cp -rf * ${INSTALL}/usr/share/themes/${PKG_NAME}
}
