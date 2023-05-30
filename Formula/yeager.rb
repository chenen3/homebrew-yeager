class Yeager < Formula
  desc "A proxy aims to bypass network restriction"
  homepage "https://github.com/chenen3/yeager"
  url "https://github.com/chenen3/yeager/releases/download/v1.29.3/yeager-macos-amd64.tar.gz"
  version "1.29.3"
  sha256 "4918a5ecf48c3463dc98919f25c3f5461949f43ad2aa2622873ba56f8f35143c"

  def install
    bin.install "yeager"
  end

  service do
    run [bin/"yeager", "-config", etc/"yeager/config.json"]
    keep_alive true
    error_log_path "/usr/local/var/log/yeager.log"
  end
end
