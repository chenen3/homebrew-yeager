class Yeager < Formula
  desc "A proxy aims to bypass network restriction"
  homepage "https://github.com/chenen3/yeager"
  url "https://github.com/chenen3/yeager/releases/download/v1.29.0/yeager-macos-amd64.tar.gz"
  version "1.29.0"
  sha256 "665b7d72d7f4dc888b3ddb759a0dfb75ab18326cea2f885fbba489228f9750e2"

  def install
    bin.install "yeager"
  end

  service do
    run [bin/"yeager", "-config", etc/"yeager/config.json"]
    keep_alive true
    error_log_path "/usr/local/var/log/yeager.log"
  end
end
