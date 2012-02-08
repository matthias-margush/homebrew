require 'formula'

class Gstreamermm < Formula
  url 'http://ftp.gnome.org/pub/GNOME/sources/gstreamermm/0.10/gstreamermm-0.10.9.1.tar.bz2'
  homepage ''
  sha256 '85a07d4d0d67ad527c1fd9bf47c130032db89e9b26f412969a8c8ad6fdebf516'

  # depends_on 'cmake' => :build
  depends_on 'libxml++'
  depends_on 'gtkmm'
  
  def install
    system "./configure", "--disable-debug", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    # system "cmake . #{std_cmake_parameters}"
    system "make install"
  end

  def test
    # This test will fail and we won't accept that! It's enough to just
    # replace "false" with the main program this formula installs, but
    # it'd be nice if you were more thorough. Test the test with
    # `brew test gstreamermm`. Remove this comment before submitting
    # your pull request!
    system "false"
  end
end
