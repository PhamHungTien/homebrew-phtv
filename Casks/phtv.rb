# typed: strict
# frozen_string_literal: true

cask "phtv" do
  arch arm: "arm64", intel: "intel"

  version "3.5.0"
  if version.to_s == "2.6.6"
    sha256 "ad4132a20aebe701f418a3196a0075ccb91277b4a156932192f91c8fd7f1d045"
    url "https://github.com/PhamHungTien/PHTV/releases/download/v#{version}/PHTV-#{version}.dmg",
        verified: "github.com/PhamHungTien/"
  else
    on_arm do
      sha256 "2583924f1c5e674605191f224d77b24420cd7d19f2887ae0c9f7494b3f00aebc"
    end

    on_intel do
      sha256 "bfbf37e543a107650dcd70ab68cf1be4fabd985c33484e48e3ea599b72fb5be6"
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
