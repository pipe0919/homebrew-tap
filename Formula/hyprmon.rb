class Hyprmon < Formula
  desc "Hyprland-style system monitor widget for macOS (CPU/RAM/battery/processes/Claude usage)"
  homepage "https://github.com/pipe0919/hyprmon"
  url "https://github.com/pipe0919/hyprmon/releases/download/v0.2.0/hyprmon-0.2.0.tar.gz"
  sha256 "10675b5e04edd730737579587b7218a7f5295fd915257dc0f1ac5c137c3077e4"
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
