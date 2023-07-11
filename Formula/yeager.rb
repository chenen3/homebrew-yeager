class Yeager < Formula
  desc "A proxy aims to bypass network restriction"
  homepage "https://github.com/chenen3/yeager"
  url "https://github.com/chenen3/yeager/releases/download/v1.30.4/yeager-macos-amd64.tar.gz"
  version "1.30.4"
  sha256 "0027b82734d118243ad665c9f9a612c79873ca7f718fc96e563d003a56665bb5"

  def install
    bin.install "yeager"
  end

  service do
    run [bin/"yeager", "-config", etc/"yeager/config.json"]
    keep_alive true
    error_log_path "/usr/local/var/log/yeager.log"
  end
end
