cask "ccdeck" do
  version "0.1.15"
  sha256 "ec00df96d0252a340ada15b2bd32cee4921d6526f3e4dd89968a7a9f3c8dfc9f"

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
