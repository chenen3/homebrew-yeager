class Yeager < Formula
  desc "A proxy aims to bypass network restriction"
  homepage "https://github.com/chenen3/yeager"
  url "https://github.com/chenen3/yeager/releases/download/v1.31.1/yeager-macos-amd64.tar.gz"
  version "1.31.1"
  sha256 "fc434e1df03507b0cca258354469456f440570b808e20d8c1fb3d651f4f87b0f"

  def install
    bin.install "yeager"
  end

  service do
    run [bin/"yeager", "-config", etc/"yeager/config.json"]
    keep_alive true
    error_log_path "/usr/local/var/log/yeager.log"
  end
end
