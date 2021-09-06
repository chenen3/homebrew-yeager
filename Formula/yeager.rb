class Yeager < Formula
  desc "A proxy aims to bypass network restriction"
  homepage "https://github.com/chenen3/yeager"
  url "https://github.com/chenen3/yeager/releases/download/v1.15.1/yeager-macos-amd64.tar.gz"
  version "1.15.1"
  sha256 "2940b68cfa39697aac6a1ee13fa2ae102c3981602c35fba953184afce0550c73"

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
