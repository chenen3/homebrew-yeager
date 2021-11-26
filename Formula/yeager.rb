class Yeager < Formula
  desc "A proxy aims to bypass network restriction"
  homepage "https://github.com/chenen3/yeager"
  url "https://github.com/chenen3/yeager/releases/download/v1.20.3/yeager-macos-amd64.tar.gz"
  version "1.20.3"
  sha256 "58f743d91f5fd68f03a7c97a4b0524aedfe1122838d469943fa415c03e3c88be"

  def install
    bin.install "yeager"
    pkgshare.install "geosite.dat"
  end

  plist_options manual: "yeager serve --config #{HOMEBREW_PREFIX}/etc/yeager/config.json"

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
        <string>serve</string>
        <string>--config</string>
        <string>#{etc}/yeager/config.json</string>
      </array>
      <key>StandardErrorPath</key>
      <string>/tmp/yeager.log</string>
    </dict>
  </plist>
  EOS
  end

end
