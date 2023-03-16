class Yeager < Formula
  desc "A proxy aims to bypass network restriction"
  homepage "https://github.com/chenen3/yeager"
  url "https://github.com/chenen3/yeager/releases/download/v1.28.2/yeager-macos-amd64.tar.gz"
  version "1.28.2"
  sha256 "2a48b8bd6209ad169c44a76421187c68d68bde9648c6a818eeee283f961cc8a2"

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
