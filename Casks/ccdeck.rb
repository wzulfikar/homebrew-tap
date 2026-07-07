cask "ccdeck" do
  version "0.1.11"
  sha256 "daa79950a461ab8010673848311a3a028a9bd35f73a3b04b6d483f0d34326c40"

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
