cask "bluefin-cli" do
  arch arm: "_arm64", intel: "_amd64"

  version "0.0.1"

  os_map = { linux: "linux", macos: "darwin" }

  on_linux do
    sha256 arm:   "8ba6aa87ef00a3f0d05051d143e625227cbb7dec720804364e8cc8f5402a3449",
           intel: "edd352b9de6bd05d5248b63daecb6d0bc6252eb0ad500fdb3d7d790083a429d5"
  end

  on_macos do
    sha256 arm:   "c930feab1acd0fb6bfc632356acb54f56428ee980455f2e358e79f9880a8dca7",
           intel: "fcfd4bcf9723ad03b9fe1591da286242cf7651ea7b9f7c20f5ec087201cf3815"
  end

  url "https://github.com/hanthor/bluefin-cli/releases/download/v#{version}/bluefin-cli_#{version}_#{os_map[Homebrew::SimulateSystem.current_os]}#{arch}.tar.gz"
  name "Bluefin CLI"
  desc "Bluefin's CLI tool"
  homepage "https://github.com/hanthor/bluefin-cli"

  livecheck do
    url :homepage
    strategy :github_latest
  end

  binary "bluefin-cli"
end
