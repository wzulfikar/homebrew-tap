cask "ccdeck" do
  version "0.1.10"
  sha256 "21531a1ab5e00f2423f161b9a6dce1757572ad6a68c1392cb7600b94ad86bd1b"

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
