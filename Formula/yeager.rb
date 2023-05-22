class Yeager < Formula
  desc "A proxy aims to bypass network restriction"
  homepage "https://github.com/chenen3/yeager"
  url "https://github.com/chenen3/yeager/releases/download/v1.29.2/yeager-macos-amd64.tar.gz"
  version "1.29.2"
  sha256 "c97718d22e99ee3af5d4fd3db8056ffbc5f01900197e1912479372670f017b6a"

  def install
    bin.install "yeager"
  end

  service do
    run [bin/"yeager", "-config", etc/"yeager/config.json"]
    keep_alive true
    error_log_path "/usr/local/var/log/yeager.log"
  end
end
