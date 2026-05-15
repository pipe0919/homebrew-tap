class Hyprmon < Formula
  desc "macOS menubar widget: CPU, RAM, battery, top processes, Claude Code usage"
  homepage "https://github.com/pipe0919/hyprmon"
  url "https://github.com/pipe0919/hyprmon/releases/download/v0.5.0/hyprmon-0.5.0.tar.gz"
  sha256 "269c048a0e728dc2656c21acc61b94036a23400532546c1474176763080faaad"
  license "Apache-2.0"

  depends_on macos: :sonoma

  def install
    prefix.install Dir["Hyprmon.app"]
    bin.write_exec_script prefix/"Hyprmon.app/Contents/MacOS/hyprmon"
  end

  def caveats
    <<~CAVEATS
      Launch the widget once and it installs a LaunchAgent automatically
      so it restarts at login. Toggle this from the menubar item's
      right-click menu (Launch at Login).

      Open it:
        open -a "#{opt_prefix}/Hyprmon.app"

      Configuration file:
        ~/.config/hyprmon/config.toml

      Theme picker:
        Right-click the menubar icon → Theme.
    CAVEATS
  end

  test do
    system bin/"hyprmon", "--version"
  end
end
