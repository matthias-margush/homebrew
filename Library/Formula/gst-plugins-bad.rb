require 'formula'

class GstPluginsBad < Formula
  homepage 'http://gstreamer.freedesktop.org/'
  url 'http://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad-0.10.22.tar.bz2'
  sha256 'd8f7102f43ffea076646427115ffdccb3975954f1e9367bd304f7ee01e12070c'

  depends_on 'pkg-config' => :build
  depends_on 'gettext'
  depends_on 'gst-plugins-base'
  depends_on 'gst-plugins-good'

  # These optional dependencies are based on the intersection of
  # gst-plugins-bad-0.10.21/REQUIREMENTS and Homebrew formulas
  depends_on 'dirac' => :optional
  depends_on 'libdvdread' => :optional
  depends_on 'libmms' => :optional

  # These are not mentioned in REQUIREMENTS, but configure look for them
  depends_on 'libexif' => :optional
  depends_on 'faac' => :optional
  depends_on 'faad2' => :optional
  depends_on 'libsndfile' => :optional
  depends_on 'schroedinger' => :optional
  depends_on 'rtmpdump' => :optional

  def install
    ENV.append "CFLAGS", "-no-cpp-precomp -funroll-loops -fstrict-aliasing"
    system "./configure", "--prefix=#{prefix}", "--disable-debug",
                          "--disable-dependency-tracking", "--disable-sdl"

#   "--disable-examples",
#   "--disable-adpcmdec",
#   "--disable-adpcmenc",
#   "--disable-aiff",
#   "--disable-asfmux",
#   "--disable-autoconvert",
#   "--disable-bayer",
#   "--disable-camerabin",
#   "--disable-camerabin2",
#   "--disable-cdxaparse",
#   "--disable-coloreffects",
#   # --disable-colorspace    disable dependency-less colorspace plugin
#   "--disable-dataurisrc",
#   "--disable-dccp",
#   "--disable-debugutils",
#   "--disable-dtmf",
#   "--disable-dvbsuboverlay",
#   "--disable-dvdspu",
#   "--disable-festival",
#   "--disable-fieldanalysis",
#   "--disable-freeze",
#   "--disable-frei0r",
#   "--disable-gaudieffects",
#   "--disable-geometrictransform",
#   "--disable-h264parse",
#   "--disable-hdvparse",
#   "--disable-hls",
#   "--disable-id3tag",
#   "--disable-interlace",
#   "--disable-invtelecine",
#   "--disable-ivfparse",
#   "--disable-jp2kdecimator",
#   "--disable-jpegformat",
#   "--disable-legacyresample",
#   "--disable-librfb",
#   "--disable-liveadder",
#   "--disable-mpegdemux",
#   "--disable-mpegtsdemux",
# #  --disable-mpegtsmux     disable dependency-less mpegtsmux plugin
#   "--disable-mpegpsmux",
#   "--disable-mpeg4videoparse",
#   "--disable-mpegvideoparse",
#   "--disable-mve",
#   "--disable-mxf",
#   "--disable-nsf",
#   "--disable-nuvdemux",
#   "--disable-patchdetect",
#   "--disable-pcapparse",
#   "--disable-pnm",
#   "--disable-rawparse",
#   "--disable-real",
#   "--disable-rtpmux",
#   "--disable-rtpvp8",
#   "--disable-scaletempo",
#   "--disable-sdi",
#   "--disable-sdp",
#   "--disable-segmentclip",
#   "--disable-siren",
#   "--disable-speed",
#   "--disable-subenc",
#   "--disable-stereo",
#   "--disable-tta",
#   "--disable-videofilters",
#   "--disable-videomaxrate",
#   "--disable-videomeasure",
#   "--disable-videoparsers",
#   "--disable-videosignal",
#   "--disable-vmnc",
#   "--disable-y4m",
#   "--disable-directsound",
#   "--disable-directdraw",
#   "--disable-apple_media",
#   "--disable-osx_video",
#   "--disable-quicktime",
#   "--disable-shm",
#   "--disable-vcd",
#   "--disable-assrender",
#   "--disable-amrwb",
#   "--disable-apexsink",
#   "--disable-bz2",
#   "--disable-cdaudio",
#   "--disable-celt",
#   "--disable-cog",
#   "--disable-curl",
#   "--disable-dc1394",
#   "--disable-decklink",
#   "--disable-directfb",
#   "--disable-dirac",
#   "--disable-dts",
#   "--disable-divx",
#   "--disable-resindvd",
#   # --disable-faac               disable AAC encoder plug-in: faac
#   "--disable-faad",
#   "--disable-fbdev",
#   "--disable-flite",
#   "--disable-gsm",
#   "--disable-jp2k",
#   "--disable-kate",
#   "--disable-ladspa",
#   "--disable-lv2",
#   "--disable-libmms",
#   "--disable-linsys",
#   "--disable-modplug",
#   "--disable-mimic",
#   "--disable-mpeg2enc",
#   "--disable-mplex",
#   "--disable-musepack",
#   "--disable-musicbrainz",
#   "--disable-mythtv",
#   "--disable-nas",
#   "--disable-neon",
#   "--disable-ofa",
#   "--disable-opencv",
#   "--disable-rsvg",
#   "--disable-timidity",
#   "--disable-wildmidi",
#   "--disable-sdl",
#   "--disable-sdltest",
#   "--disable-sndfile",
#   "--disable-soundtouch",
#   "--disable-spc",
#   "--disable-gme",
#   "--disable-swfdec",
#   "--disable-xvid",
#   "--disable-dvb",
#   "--disable-wininet",
#   "--disable-acm",
#   "--disable-vdpau",
#   "--disable-schro",
#   "--disable-zbar",
#   "--disable-vp8"
  # --disable-rtmp               disable rtmp library: rtmp
  # --disable-gsettings          disable GSettings plugin: gsettings
    system "make"
    system "make install"
  end
end
