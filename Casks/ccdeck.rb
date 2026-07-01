cask "ccdeck" do
  version "0.1.1"
  sha256 "2d7446e6a317fcff14d08e4709294fcf1718db35ca6bc400fb22165671bf0890"

  url "https://github.com/wzulfikar/ccdeck/releases/download/v#{version}/ccdeck-v#{version}.dmg"
  name "ccdeck"
  desc "macOS menu bar app that juggles multiple Claude subscriptions for Claude Code"
  homepage "https://github.com/wzulfikar/ccdeck"

  depends_on macos: :sonoma

  app "ccdeck.app"

  # ccdeck installs a privileged SMAppService LaunchDaemon; unload it on uninstall.
  uninstall launchctl: "com.wzulfikar.ccdeck.helper",
            quit:      "com.wzulfikar.ccdeck"

  zap trash: [
    "~/Library/Preferences/com.wzulfikar.ccdeck.plist",
    "~/Library/Application Support/ccdeck",
    "~/Library/Caches/com.wzulfikar.ccdeck",
  ]

  caveats <<~EOS
    ccdeck stores per-account Claude credentials in your login Keychain under the
    service "ccdeck". Uninstalling the app does not remove those Keychain items;
    delete them manually in Keychain Access if you want them gone.
  EOS
end
