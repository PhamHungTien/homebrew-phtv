# typed: strict
# frozen_string_literal: true

cask "phtv" do
  arch arm: "arm64", intel: "intel"

  version "3.0.7"
  if version.to_s == "2.6.6"
    sha256 "ad4132a20aebe701f418a3196a0075ccb91277b4a156932192f91c8fd7f1d045"
    url "https://github.com/PhamHungTien/PHTV/releases/download/v#{version}/PHTV-#{version}.dmg",
        verified: "github.com/PhamHungTien/"
  else
    on_arm do
      sha256 "8a3d865ddaa04a15c51a7cbdfd5a061c514b0beb50fcf2c46f39703c9120bde4"
    end

    on_intel do
      sha256 "66786aeabeb5e15774e00e943a1e516291957dab85f8c90946f67d43809272c0"
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
