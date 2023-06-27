class Yeager < Formula
  desc "A proxy aims to bypass network restriction"
  homepage "https://github.com/chenen3/yeager"
  url "https://github.com/chenen3/yeager/releases/download/v1.30.2/yeager-macos-amd64.tar.gz"
  version "1.30.2"
  sha256 "c0f178c237b202aaf661fe6a5a3427091d31a192a628f00ce9d33ec73472d861"

  def install
    bin.install "yeager"
  end

  service do
    run [bin/"yeager", "-config", etc/"yeager/config.json"]
    keep_alive true
    error_log_path "/usr/local/var/log/yeager.log"
  end
end
