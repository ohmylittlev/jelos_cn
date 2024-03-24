# SPDX-License-Identifier: GPL-2.0-or-later

PKG_NAME="wiliwili"
PKG_VERSION="2183dd1bf3ca2648961be47cc11499edce1d018f"
PKG_ARCH="any"
PKG_LICENSE="CUSTOM"
PKG_SITE="https://github.com/xfangfang/wiliwili"
PKG_URL="${PKG_SITE}.git"
PKG_DEPENDS_TARGET="boost toolchain SDL2 freetype curl freeimage bash rapidjson SDL2_mixer fping p7zip alsa vlc drm_tool pugixml mpv"
GET_HANDLER_SUPPORT="git"
PKG_SHORTDESC="Wiliwili"
PKG_LONGDESC="Watch bilibili videos on your handheld"

if [ ! "${OPENGL}" = "no" ]; then
  PKG_DEPENDS_TARGET+=" ${OPENGL} glu"
  PKG_CMAKE_OPTS_TARGET+=" -DGL=1"
fi

PKG_CMAKE_OPTS_TARGET+=" -DPLATFORM_DESKTOP=ON \
                         -DGLFW_BUILD_WAYLAND=true \
                         -DGLFW_BUILD_X11=false \
                         -DCMAKE_BUILD_TYPE=Release \
                         -DUSE_GL2=ON \
                         -DMPV_NO_FB=ON \
                         -DMPV_INCLUDE_DIR=${SYSROOT_PREFIX}/usr/include \
                         -DMPV_LIBRARY=${SYSROOT_PREFIX}/usr/lib \
                         -DX11_Xrandr_INCLUDE_PATH=${SYSROOT_PREFIX}/usr/include \
                         -DX11_Xinerama_INCLUDE_PATH=${SYSROOT_PREFIX}/usr/include \
                         -DX11_Xcursor_INCLUDE_PATH=${SYSROOT_PREFIX}/usr/include"

makeinstall_target() {
  mkdir -p ${INSTALL}/usr/bin
  cp wiliwili ${INSTALL}/usr/bin
}
