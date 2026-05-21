# typed: strict
# frozen_string_literal: true

cask "phtv" do
  arch arm: "arm64", intel: "intel"

  version "3.1.8"
  if version.to_s == "2.6.6"
    sha256 "ad4132a20aebe701f418a3196a0075ccb91277b4a156932192f91c8fd7f1d045"
    url "https://github.com/PhamHungTien/PHTV/releases/download/v#{version}/PHTV-#{version}.dmg",
        verified: "github.com/PhamHungTien/"
  else
    on_arm do
      sha256 "d1e19f5a74dfc4a141a121a0f6beb6b1c17f2bb61922d8f87d817638cb5e1e5c"
    end

    on_intel do
      sha256 "f9e5ccb2f12ef9b93b59e945314eda5e2aeb9862766e365f6474ff3c98a614b0"
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

  depends_on macos: ">= :ventura"

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
