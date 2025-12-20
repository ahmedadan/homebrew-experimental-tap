cask "bluefin-cli" do
  version "0.0.2"

  on_arm do
    on_linux do
      sha256 "5294bbb262aa80fd20d17e00295bf1a2c770f32b1cf1d1ee82b80ba448716e94"
      url "https://github.com/hanthor/bluefin-cli/releases/download/v#{version}/bluefin-cli_#{version}_linux_arm64.tar.gz"
    end
    on_macos do
      sha256 "cbcab08545ac221acea714bfbfff0380762c08f6884d1c3eaed40e309ba3ea7f"
      url "https://github.com/hanthor/bluefin-cli/releases/download/v#{version}/bluefin-cli_#{version}_darwin_arm64.tar.gz"
    end
  end
  on_intel do
    on_linux do
      sha256 "e6fec4f0366d5526f0bb7ab551b17243414deb19bbbecfdc7bd06c91f9cdc061"
      url "https://github.com/hanthor/bluefin-cli/releases/download/v#{version}/bluefin-cli_#{version}_linux_amd64.tar.gz"
    end
    on_macos do
      sha256 "cb6f2f7539dac967b036328eb7feefb0ba931af3b31d643c0491b2a11c5977a9"
      url "https://github.com/hanthor/bluefin-cli/releases/download/v#{version}/bluefin-cli_#{version}_darwin_amd64.tar.gz"
    end
  end

  name "Bluefin CLI"
  desc "Bluefin's CLI tool"
  homepage "https://github.com/hanthor/bluefin-cli"

  livecheck do
    url :homepage
    strategy :github_latest
  end

  binary "bluefin-cli"
end
