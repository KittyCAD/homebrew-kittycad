class Kittycad < Formula
  desc " is a command-line interface to Zoo for use in your terminal or your scripts."
  homepage "https://zoo.dev/docs/cli/manual"
  url "https://dl.zoo.dev/releases/cli/v0.2.140/kittycad-cli.tar.gz"
  sha256 "cace46a59463241b84f6a6e951cb48dbe54708185256db7a0b53675d8dbd5122"


  # specify the target architectures for the binary files
  bottle do
    sha256 cellar: :any_skip_relocation, x86_64_darwin:  "b5966a6daa35a5a4b0e4c106791eeadba756785d4ff0f4b6ad12b3854e1c798b"
    sha256 cellar: :any_skip_relocation, aarch64_darwin: "47ac416d341e475d3a765a6c6a57d876e42c8b98711bf8414cda1a6c7d44bd71"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "5f7b4a5a8e1b600938ebb732db3756d7ea9461bb731fd859bacbc1e13f0359c7"
    sha256 cellar: :any_skip_relocation, aarch64_linux:  "3d4a6978e19efd776a2178bde73eb77226a84e3a1e03b2af3dae18e6de8eb7b4"
  end

  def install
    # check if the user is using Linux and their hardware and install the appropriate binary
    if OS.linux?
      if Hardware::CPU.type == :intel
        bin.install "x86_64_linux/zoo"
      elsif Hardware::CPU.type == :arm
        bin.install "aarch64_linux/zoo"
      end
    else
      if Hardware::CPU.type == :intel
        bin.install "x86_64_darwin/zoo"
      elsif Hardware::CPU.type == :arm
        bin.install "aarch64_darwin/zoo"
      end
    end
  end
end
