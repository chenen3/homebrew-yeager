class Yeager < Formula
  desc "A proxy aims to bypass network restriction"
  homepage "https://github.com/chenen3/yeager"
  url "https://github.com/chenen3/yeager/releases/download/v1.31.0/yeager-macos-amd64.tar.gz"
  version "1.31.0"
  sha256 "7db8978751a642c9ba26f746d262b80619e50595ebc0d29c6994e5f25b0e6539"

  def install
    bin.install "yeager"
  end

  service do
    run [bin/"yeager", "-config", etc/"yeager/config.json"]
    keep_alive true
    error_log_path "/usr/local/var/log/yeager.log"
  end
end
