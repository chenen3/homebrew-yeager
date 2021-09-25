class Yeager < Formula
  desc "A proxy aims to bypass network restriction"
  homepage "https://github.com/chenen3/yeager"
  url "https://github.com/chenen3/yeager/releases/download/v1.16.3/yeager-macos-amd64.tar.gz"
  version "1.16.3"
  sha256 "400c73a88459b8920d5c5cbf7b31454c1ce4423b8dfce60f0b57c2b2b322252a"

  def install
    bin.install "yeager"
    pkgshare.install "geosite.dat"
  end

  plist_options manual: "yeager -config=#{HOMEBREW_PREFIX}/etc/yeager/config.json"

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
        <string>#{etc}/yeager/config.json</string>
      </array>
      <key>StandardErrorPath</key>
      <string>/tmp/yeager.log</string>
    </dict>
  </plist>
  EOS
  end

end
