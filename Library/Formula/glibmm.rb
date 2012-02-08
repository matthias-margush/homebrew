require 'formula'

class Glibmm < Formula
  url 'http://ftp.gnome.org/pub/GNOME/sources/glibmm/2.30/glibmm-2.30.1.tar.xz'
  homepage 'http://www.gtkmm.org/'
  sha256 '69582b584666cab1dc4253faffee548054730bc058e28466871e6a954d7ff897'

  depends_on 'pkg-config' => :build
  depends_on 'libsigc++'
  depends_on 'glib'

  def install
    system "./configure", "--disable-dependency-tracking", "--prefix=#{prefix}"
    system "make install"
  end
end
