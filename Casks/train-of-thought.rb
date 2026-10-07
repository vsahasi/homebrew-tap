cask "train-of-thought" do
  version "0.1.0"
  sha256 "b4543de8bbb3fdf5d2514379f12e9fbc27be5183b849398a4b276dbe0e6d365d"

  url "https://github.com/vsahasi/train-of-thought/releases/download/v#{version}/Train-of-Thought-#{version}.zip"
  name "Train of Thought"
  desc "Tiny train along the bottom of the screen that grows while you stay in one app"
  homepage "https://github.com/vsahasi/train-of-thought"

  depends_on macos: ">= :ventura"

  app "Train of Thought.app"

  # The build is not notarized; clear the quarantine flag so it opens on first launch.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Train of Thought.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Application Support/Train of Thought",
    "~/Library/Preferences/com.vsahasi.TrainOfThought.plist",
  ]
end
