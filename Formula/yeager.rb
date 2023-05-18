class Yeager < Formula
  desc "A proxy aims to bypass network restriction"
  homepage "https://github.com/chenen3/yeager"
  url "https://github.com/chenen3/yeager/releases/download/v1.29.1/yeager-macos-amd64.tar.gz"
  version "1.29.1"
  sha256 "8a2814d54ca2c788af33d94176f80cad9dc770a529339ebb6e54150cd09cb11a"

  def install
    bin.install "yeager"
  end

  service do
    run [bin/"yeager", "-config", etc/"yeager/config.json"]
    keep_alive true
    error_log_path "/usr/local/var/log/yeager.log"
  end
end
