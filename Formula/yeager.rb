class Yeager < Formula
  desc "A proxy aims to bypass network restriction"
  homepage "https://github.com/chenen3/yeager"
  url "https://github.com/chenen3/yeager/releases/download/v1.28.4/yeager-macos-amd64.tar.gz"
  version "1.28.4"
  sha256 "7f50c6cd896c3d8f17ece527821a2d31ae0052657d9725fe7ee4909abdf0517f"

  def install
    bin.install "yeager"
    pkgshare.install "geosite.dat"
  end

  service do
    run [bin/"yeager", "-config", etc/"yeager/config.json"]
    keep_alive true
    error_log_path "/usr/local/var/log/yeager.log"
  end
end
