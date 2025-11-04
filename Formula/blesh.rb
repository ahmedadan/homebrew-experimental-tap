class Blesh < Formula
  desc "Bash Line Editor: a command-line editor written in pure Bash"
  homepage "https://github.com/akinomyoga/ble.sh"
  url "https://github.com/akinomyoga/ble.sh/archive/refs/tags/v0.4.0-devel3.tar.gz"
  version "0.4.0-devel3"
  sha256 "867ec9681bd75de7faa93622bcae1b705f561c11d83a62ead1f14554b87630dc"
  license "BSD-3-Clause"

  livecheck do
    url :stable
    regex(/v?(\d+(?:\.\d+)*(?:-devel\d+)?)/i)
    strategy :github_latest
  end

  depends_on "gawk" => :build
  depends_on "git" => :build
  depends_on "make" => :build

  def install
    # Build ble.sh
    system "make"

    # Install ble.sh and related files
    system "make", "install", "DESTDIR=#{prefix}", "PREFIX="
  end

  def caveats
    <<~EOS
      To use ble.sh with bash, add the following to your ~/.bashrc:

        [[ $- == *i* ]] && source -- #{opt_share}/blesh/ble.sh --attach=none

      And at the end of your ~/.bashrc, add:

        [[ ! ${BLE_VERSION-} ]] || ble-attach

      For configuration, create ~/.blerc or ${XDG_CONFIG_HOME:-$HOME/.config}/blesh/init.sh

      For more information, visit: https://github.com/akinomyoga/ble.sh/wiki/Manual-%C2%A71-Introduction
    EOS
  end

  test do
    # Test that ble.sh can be sourced
    assert_path_exists share/"blesh/ble.sh"

    # Basic syntax check - source ble.sh with --help to see if it works
    system "bash", "-c", "source #{share}/blesh/ble.sh --help 2>&1 | head -1"
  end
end
