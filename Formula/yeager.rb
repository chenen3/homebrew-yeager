class Yeager < Formula
  desc "A proxy aims to bypass network restriction"
  homepage "https://github.com/chenen3/yeager"
  url "https://github.com/chenen3/yeager/releases/download/v1.30.3/yeager-macos-amd64.tar.gz"
  version "1.30.3"
  sha256 "3cd0a6879a46fcc35cba600ed8f4f03221d6ae6870e8c5be7cf69528ef293566"

  def install
    bin.install "yeager"
  end

  service do
    run [bin/"yeager", "-config", etc/"yeager/config.json"]
    keep_alive true
    error_log_path "/usr/local/var/log/yeager.log"
  end
end
