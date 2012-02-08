require 'formula'

class GlibNetworking < Formula
  url 'http://ftp.gnome.org/pub/GNOME/sources/glib-networking/2.30/glib-networking-2.30.0.tar.bz2'
  homepage 'http://git.gnome.org/browse/glib-networking/'
  md5 '9f85aef5907f92b6cce10a12aa0a40ae'

  depends_on 'pkg-config' => :build
  depends_on 'intltool' => :build
  depends_on 'glib'
  depends_on 'gnutls'
  #depends_on 'libproxy'

  def install
    system "./configure", "--disable-dependency-tracking",
                          "--prefix=#{prefix}",
                          "--with-gnutls",
                          #"--with-libproxy",
                          "--without-gnome-proxy",
                          "--without-ca-certificates"
    system "make"
    system "make install"
  end

  def test
    # This test will fail and we won't accept that! It's enough to just
    # replace "false" with the main program this formula installs, but
    # it'd be nice if you were more thorough. Test the test with
    # `brew test glib-networking`. Remove this comment before submitting
    # your pull request!
    system "false"
  end
end