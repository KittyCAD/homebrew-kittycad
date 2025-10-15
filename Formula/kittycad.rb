class Kittycad < Formula
  desc " is a command-line interface to Zoo for use in your terminal or your scripts."
  homepage "https://zoo.dev/docs/cli/manual"
  url "https://dl.zoo.dev/releases/cli/v0.2.126/kittycad-cli.tar.gz"
  sha256 "cd5db7ca515e0c8389bd11f5f4d4676dbd994fe0a4a1ff406c5cb6b3a9863138"


  # specify the target architectures for the binary files
  bottle do
    sha256 cellar: :any_skip_relocation, x86_64_darwin:  "0b158627a085b8f0170837999883af948ce1464171432c86c097278a30efd7ff"
    sha256 cellar: :any_skip_relocation, aarch64_darwin: "9c7063b4b07e613100a7a2125929ea74199cfa30d161a30195afb66c0f47ca2a"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "e8cef27930774550e67f0d2362c62a6dd1c8db445f78c7852e6db3a0162698ce"
    sha256 cellar: :any_skip_relocation, aarch64_linux:  "c15d62350c8b7c342d17a43a8f97067d871a3b737940f7b848f01532511c5e71"
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
