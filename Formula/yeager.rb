class Yeager < Formula
  desc "A proxy aims to bypass network restriction"
  homepage "https://github.com/chenen3/yeager"
  url "https://github.com/chenen3/yeager/releases/download/v1.26.6/yeager-macos-amd64.tar.gz"
  version "1.26.6"
  sha256 "ef61a218dd3ab47c2b6e8b8d2c094949582399ce1663da2633e7b7be7bda14d0"

  def install
    bin.install "yeager"
    pkgshare.install "geosite.dat"
  end

  plist_options manual: "yeager -config #{HOMEBREW_PREFIX}/etc/yeager/config.yaml"

  def plist; <<~EOS
  <?xml version="1.0" encoding="UTF-8"?>
  <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
  <plist version="1.0">
    <dict>
      <key>KeepAlive</key>
      <dict>
          <key>SuccessfulExit</key>
          <false/>
      </dict>
      <key>RunAtLoad</key>
      <true/>
      <key>Label</key>
      <string>#{plist_name}</string>
      <key>ProgramArguments</key>
      <array>
        <string>#{bin}/yeager</string>
        <string>-config</string>
        <string>#{etc}/yeager/config.yaml</string>
      </array>
      <key>StandardErrorPath</key>
      <string>/usr/local/var/log/yeager.log</string>
    </dict>
  </plist>
  EOS
  end

end
