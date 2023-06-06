class Yeager < Formula
  desc "A proxy aims to bypass network restriction"
  homepage "https://github.com/chenen3/yeager"
  url "https://github.com/chenen3/yeager/releases/download/v1.30.1/yeager-macos-amd64.tar.gz"
  version "1.30.1"
  sha256 "b6291f778e997712b4f57944ad2b5191c706468b2fa8f7f4b773f318e75fa0cd"

  def install
    bin.install "yeager"
  end

  service do
    run [bin/"yeager", "-config", etc/"yeager/config.json"]
    keep_alive true
    error_log_path "/usr/local/var/log/yeager.log"
  end
end
