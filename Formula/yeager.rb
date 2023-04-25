class Yeager < Formula
  desc "A proxy aims to bypass network restriction"
  homepage "https://github.com/chenen3/yeager"
  url "https://github.com/chenen3/yeager/releases/download/v1.28.3/yeager-macos-amd64.tar.gz"
  version "1.28.3"
  sha256 "c7fea2343af3ec2f8c64b6af09dab23336d25e563f487dc0363d661a89044dd3"

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
