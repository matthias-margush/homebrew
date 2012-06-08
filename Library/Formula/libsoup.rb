require 'formula'

class Libsoup < Formula
  url 'http://ftp.acc.umu.se/pub/gnome/sources/libsoup/2.37/libsoup-2.37.2.tar.bz2'
  homepage 'http://library.gnome.org/devel/libsoup/stable/'
  md5 '6340e103d7ba8a37f1963aad0c605888'

  depends_on 'pkg-config' => :build
  depends_on 'gnutls'
  depends_on 'sqlite'
  depends_on 'glib-networking'

  def install
    system "./configure", "--disable-debug", "--disable-dependency-tracking",
                          "--prefix=#{prefix}",
                          "--without-gnome"
    system "make install"
  end

  def test
    # This test will fail and we won't accept that! It's enough to just
    # replace "false" with the main program this formula installs, but
    # it'd be nice if you were more thorough. Test the test with
    # `brew test libsoup`. Remove this comment before submitting
    # your pull request!
    system "false"
  end
end