class ScreenlyCli < Formula
  desc "Command line interface is intended for quick interaction with Screenly through terminal."
  homepage "https://github.com/Screenly/cli"
  url "https://github.com/Screenly/cli.git",
      tag: "v1.0.3"
  version "v1.0.3"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--bin", "screenly", *std_cargo_args
  end

  test do
    system "true"
  end
end
