class Yeager < Formula
  desc "A proxy aims to bypass network restriction"
  homepage "https://github.com/chenen3/yeager"
  url "https://github.com/chenen3/yeager/releases/download/v1.30.5/yeager-macos-amd64.tar.gz"
  version "1.30.5"
  sha256 "8b75c16c9de1cf57de6196fcb5c290bd18cdfce64e04890bf8af11fa425503b5"

  def install
    bin.install "yeager"
  end

  service do
    run [bin/"yeager", "-config", etc/"yeager/config.json"]
    keep_alive true
    error_log_path "/usr/local/var/log/yeager.log"
  end
end
