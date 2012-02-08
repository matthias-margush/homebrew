require 'formula'

class JsonGlib < Formula
  homepage 'http://live.gnome.org/JsonGlib'
  url 'ftp://ftp.gnome.org/pub/GNOME/sources/json-glib/0.12/json-glib-0.12.6.tar.xz'
  sha256 '4f670fc356e7a30121ade956e93236986952bb2601d6678e94eab7d87c8866ce'

  depends_on 'glib'

  def install
    system "./configure", "--disable-debug", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    system "make install"
  end
end
