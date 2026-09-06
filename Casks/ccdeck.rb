cask "ccdeck" do
  version "0.1.18"
  sha256 "c9e6f103673a3849f78e6be05d383f2fe9347392fb9755d1e5492d436b31cbdd"

  url "https://github.com/wzulfikar/ccdeck/releases/download/v#{version}/ccdeck.dmg"
  name "ccdeck"
  desc "macOS menu bar app that juggles multiple Claude subscriptions for Claude Code"
  homepage "https://github.com/wzulfikar/ccdeck"

  depends_on macos: :sonoma

  app "CC Deck.app"

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
    service "ccdeck". Uninstalling the app does not remove those Keychain items. Delete them manually in Keychain Access if you want them gone.
  EOS
end
