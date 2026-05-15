class Hyprmon < Formula
  desc "Hyprland-style system monitor widget for macOS (CPU/RAM/battery/processes/Claude usage)"
  homepage "https://github.com/pipe0919/hyprmon"
  url "https://github.com/pipe0919/hyprmon/releases/download/v0.1.0/hyprmon-0.1.0.tar.gz"
  sha256 "bc38dc9ef2de2bd3454c20017aee4803eb3e118d373340ed5f4bd1f1bd693c24"
  license "Apache-2.0"

  depends_on macos: :sonoma

  def install
    prefix.install Dir["Hyprmon.app"]
    bin.write_exec_script prefix/"Hyprmon.app/Contents/MacOS/hyprmon"
  end

  def caveats
    <<~CAVEATS
      To run on login:
        hyprmon --install-agent

      Configuration file:
        ~/.config/hyprmon/config.toml

      To open the widget:
        open -a "#{opt_prefix}/Hyprmon.app"
    CAVEATS
  end

  test do
    system bin/"hyprmon", "--version"
  end
end
