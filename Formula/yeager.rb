# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Yeager < Formula
  desc "A proxy aims to bypass network restriction"
  homepage "https://github.com/chenen3/yeager"
  url "https://github.com/chenen3/yeager/releases/download/v1.6.2/yeager-macos-amd64.tar.gz"
  version "1.6.2"
  sha256 "fa795d66a7af2afdfecf1e79dce94d145b5d90cb6ddbc90eee56b25f20353f7f"
  license "GPL-3.0"

  def install
    bin.install "yeager"
    pkgshare.install "geosite.dat"
    pkgshare.install "geoip.dat"
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
