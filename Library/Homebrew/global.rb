require 'extend/pathname'
require 'extend/ARGV'
require 'extend/string'
require 'utils'
require 'exceptions'
require 'system_command'

ARGV.extend(HomebrewArgvExtension)

HOMEBREW_VERSION = '0.8.1'
HOMEBREW_WWW = 'https://github.com/ndevenish/homebrew'

def cache
  if ENV['HOMEBREW_CACHE']
    Pathname.new(ENV['HOMEBREW_CACHE'])
  else
    if SystemCommand.platform == :mac
      root_library = Pathname.new("/Library/Caches/Homebrew")
      if Process.uid == 0
        root_library
      else
        home_library = Pathname.new("~/Library/Caches/Homebrew").expand_path
        if not home_library.writable?
          root_library
        else
          home_library
        end
      end
    else
      Pathname.new("#{ENV['HOME']}/.homebrew/cache")
    end
  end
end

HOMEBREW_CACHE = cache
undef cache

# Where brews installed via URL are cached
HOMEBREW_CACHE_FORMULA = HOMEBREW_CACHE+"Formula"

# Where bottles are cached
HOMEBREW_CACHE_BOTTLES = HOMEBREW_CACHE+"Bottles"

if not defined? HOMEBREW_BREW_FILE
  HOMEBREW_BREW_FILE = ENV['HOMEBREW_BREW_FILE'] || `which brew`.chomp
end

HOMEBREW_PREFIX = Pathname.new(HOMEBREW_BREW_FILE).dirname.parent # Where we link under
HOMEBREW_REPOSITORY = Pathname.new(HOMEBREW_BREW_FILE).realpath.dirname.parent # Where .git is found

# Where we store built products; /usr/local/Cellar if it exists,
# otherwise a Cellar relative to the Repository.
HOMEBREW_CELLAR = if (HOMEBREW_PREFIX+"Cellar").exist?
  HOMEBREW_PREFIX+"Cellar"
else
  HOMEBREW_REPOSITORY+"Cellar"
end
if SystemCommand.platform == :mac
  MACOS_FULL_VERSION = `/usr/bin/sw_vers -productVersion`.chomp
  MACOS_VERSION = /(10\.\d+)(\.\d+)?/.match(MACOS_FULL_VERSION).captures.first.to_f
else
  MACOS_FULL_VERSION = `#{SystemCommand.uname} -r`.strip
  MACOS_VERSION = '2.6'
end

if SystemCommand.platform == :mac
  HOMEBREW_USER_AGENT = "Homebrew #{HOMEBREW_VERSION} (Ruby #{RUBY_VERSION}; Mac OS X #{MACOS_FULL_VERSION})"
else
  HOMEBREW_USER_AGENT = "Homebrew #{HOMEBREW_VERSION} (Ruby #{RUBY_VERSION}; Linux #{MACOS_FULL_VERSION})"
end

HOMEBREW_CURL_ARGS = '-qf#LA'

RECOMMENDED_LLVM = 2326
if SystemCommand.platform == :mac
  RECOMMENDED_GCC_40 = (MACOS_VERSION >= 10.6) ? 5494 : 5493
  RECOMMENDED_GCC_42 = (MACOS_VERSION >= 10.6) ? 5664 : 5577
else 
  RECOMMENDED_GCC_40 = 4
  RECOMMENDED_GCC_42 = 4
end

require 'fileutils'
module Homebrew extend self
  include FileUtils
end

FORMULA_META_FILES = %w[README README.md ChangeLog CHANGES COPYING LICENSE LICENCE COPYRIGHT AUTHORS]
ISSUES_URL = "https://github.com/mxcl/homebrew/wiki/checklist-before-filing-a-new-issue"

unless ARGV.include? "--no-compat" or ENV['HOMEBREW_NO_COMPAT']
  $:.unshift(File.expand_path("#{__FILE__}/../compat"))
  require 'compatibility'
end
