cask "proton-pass" do
  version "1.29.2"
  sha256 "6c1187a6b436cea59aefed22824dc8a6911af5690ab086d3e172770c499f1339"

  url "https://proton.me/download/PassDesktop/darwin/universal/ProtonPass_#{version}.dmg"
  name "Proton Pass"
  desc "Desktop client for Proton Pass"
  homepage "https://proton.me/pass"

  livecheck do
    url "https://proton.me/download/PassDesktop/darwin/universal/version.json"
    strategy :json do |json|
      json["Releases"]&.map do |item|
        next unless item["CategoryName"]&.match?("Stable")

        item["Version"]
      end
    end
  end

  auto_updates true
  depends_on macos: ">= :big_sur"

  app "Proton Pass.app"

  zap trash: [
    "~/Library/Application Support/com.apple.sharedfilelist/com.apple.LSSharedFileList.ApplicationRecentDocuments/me.proton.pass.electron..sfl*",
    "~/Library/Application Support/Proton Pass",
    "~/Library/Caches/me.proton.pass.electron",
    "~/Library/Caches/me.proton.pass.electron.ShipIt",
    "~/Library/HTTPStorages/me.proton.pass.electron",
    "~/Library/Logs/Proton Pass",
    "~/Library/Preferences/me.proton.pass.electron.plist",
    "~/Library/Saved Application State/me.proton.pass.electron.savedState",
  ]
end
