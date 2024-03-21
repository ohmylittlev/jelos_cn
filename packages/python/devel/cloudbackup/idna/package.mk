# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2021-present 351ELEC (https://github.com/351elec)
# Copyright (C) 2023 JELOS (https://github.com/JustEnoughLinuxOS)

PKG_NAME="idna"
PKG_VERSION="1cdf175e259b299be76f49c3ddc8794214f9931f"
PKG_LICENSE="BSD"
PKG_SITE="https://github.com/kjd/idna"
PKG_URL="${PKG_SITE}.git"
PKG_DEPENDS_TARGET="toolchain Python3"
PKG_SHORTDESC="idna"
PKG_TOOLCHAIN="manual"

pre_make_target() {
  export PYTHONXCPREFIX="${SYSROOT_PREFIX}/usr"
  export LDSHARED="${CC} -shared"
}

make_target() {
	python3 setup.py build --cross-compile
}

makeinstall_target() {
	python3 setup.py install --root=${INSTALL} --prefix=/usr
}
