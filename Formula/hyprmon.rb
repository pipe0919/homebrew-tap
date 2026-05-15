class Hyprmon < Formula
  desc "Hyprland-style system monitor widget for macOS (CPU/RAM/battery/processes/Claude usage)"
  homepage "https://github.com/pipe0919/hyprmon"
  url "https://github.com/pipe0919/hyprmon/releases/download/v0.1.0/hyprmon-0.1.0.tar.gz"
  sha256 "db8372c108593da7921c6099a0336c081de57409d633995a150dadec89337db6"
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
