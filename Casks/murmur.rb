cask "murmur" do
  version "0.2.0"
  sha256 "32b119a41f9bed45ef387e4e9014f17273e504bd16934c279cf2edce404e5971"

  url "https://github.com/anubhavitis/murmur/releases/download/v#{version}/murmur-#{version}-aarch64-apple-darwin.tar.gz"
  name "Murmur"
  desc "Local speech-to-text from your menubar"
  homepage "https://github.com/anubhavitis/murmur"

  depends_on arch: :arm64

  preflight do
    system_command "/bin/mkdir", args: ["-p", "#{Dir.home}/.murmur/bin"]
  end

  artifact "murmur", target: "#{Dir.home}/.murmur/bin/murmur"

  postflight do
    system_command "/usr/bin/xattr", args: ["-cr", "#{Dir.home}/.murmur/bin/murmur"]

    plist_content = <<~XML
      <?xml version="1.0" encoding="UTF-8"?>
      <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
      <plist version="1.0">
      <dict>
          <key>Label</key>
          <string>com.murmur.app</string>
          <key>Program</key>
          <string>#{Dir.home}/.murmur/bin/murmur</string>
          <key>RunAtLoad</key>
          <true/>
          <key>KeepAlive</key>
          <dict>
              <key>SuccessfulExit</key>
              <false/>
          </dict>
          <key>ThrottleInterval</key>
          <integer>30</integer>
          <key>ProcessType</key>
          <string>Interactive</string>
          <key>StandardOutPath</key>
          <string>#{Dir.home}/.murmur/murmur.log</string>
          <key>StandardErrorPath</key>
          <string>#{Dir.home}/.murmur/murmur.log</string>
      </dict>
      </plist>
    XML

    plist_path = "#{Dir.home}/Library/LaunchAgents/com.murmur.app.plist"
    File.write(plist_path, plist_content)
    system_command "/bin/launchctl", args: ["load", plist_path]
  end

  uninstall script: {
    executable: "/bin/launchctl",
    args: ["unload", "#{Dir.home}/Library/LaunchAgents/com.murmur.app.plist"],
  },
  delete: [
    "#{Dir.home}/.murmur/bin/murmur",
    "#{Dir.home}/Library/LaunchAgents/com.murmur.app.plist",
  ]

  zap delete: "#{Dir.home}/.murmur"
end
