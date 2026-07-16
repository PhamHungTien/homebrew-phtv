# typed: strict
# frozen_string_literal: true

cask "phtv" do
  arch arm: "arm64", intel: "intel"

  version "3.3.7"
  if version.to_s == "2.6.6"
    sha256 "ad4132a20aebe701f418a3196a0075ccb91277b4a156932192f91c8fd7f1d045"
    url "https://github.com/PhamHungTien/PHTV/releases/download/v#{version}/PHTV-#{version}.dmg",
        verified: "github.com/PhamHungTien/"
  else
    on_arm do
      sha256 "d0d88f5d08c8f8c3bc5e09d4d9dac19245dcb55ded91342d335f71e06b95cb1f"
    end

    on_intel do
      sha256 "c3e52ba11d6079927d7d7b106e39862670dfc74d1d428850628775ca3d2a8365"
    end

    url "https://github.com/PhamHungTien/PHTV/releases/download/v#{version}/PHTV-#{version}-#{arch}.dmg",
        verified: "github.com/PhamHungTien/"
  end

  name "PHTV"
  name "Precision Hybrid Typing Vietnamese"
  desc "Modern Vietnamese input method"
  homepage "https://phamhungtien.github.io/PHTV/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sonoma

  app "PHTV.app"

  zap trash: [
    "~/Library/Application Support/PHTV",
    "~/Library/Caches/com.phamhungtien.phtv",
    "~/Library/Logs/PHTV",
    "~/Library/Preferences/com.phamhungtien.phtv.plist",
  ]

  caveats <<~EOS
    PHTV requires Accessibility permission to function.

    To grant permission:
    1. Open System Settings
    2. Go to Privacy & Security > Accessibility
    3. Enable PHTV

    For more information, visit: https://phamhungtien.github.io/PHTV/
  EOS
end
