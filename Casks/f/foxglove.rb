cask "foxglove" do
  version "2.29.0"
  sha256 "ea955bfaf19ad5252e0b82a2c16f8e385e8e947c4c6f9bbd1ca7abb94a723334"

  url "https://get.foxglove.dev/desktop/latest/foxglove-#{version}-mac-universal.dmg"
  name "Foxglove"
  desc "Visualisation and debugging tool for robotics"
  homepage "https://foxglove.dev/"

  livecheck do
    url "https://get.foxglove.dev/desktop/latest/stable-mac.yml"
    strategy :electron_builder
  end

  auto_updates true
  depends_on macos: ">= :big_sur"

  app "Foxglove.app"

  zap trash: [
    "~/Library/Application Scripts/dev.foxglove.studio.quicklook",
    "~/Library/Application Support/com.apple.sharedfilelist/com.apple.LSSharedFileList.ApplicationRecentDocuments/dev.foxglove.studio.sfl*",
    "~/Library/Application Support/Foxglove Studio",
    "~/Library/Caches/dev.foxglove.studio",
    "~/Library/Caches/dev.foxglove.studio.ShipIt",
    "~/Library/Containers/dev.foxglove.studio.quicklook",
    "~/Library/Preferences/dev.foxglove.studio.plist",
    "~/Library/Saved Application State/dev.foxglove.studio.savedState",
  ]
end
