class Kittycad < Formula
  desc " is a command-line interface to Zoo for use in your terminal or your scripts."
  homepage "https://zoo.dev/docs/cli/manual"
  url "https://dl.zoo.dev/releases/cli/v0.2.204/kittycad-cli.tar.gz"
  sha256 "9932c7113448ba69de14075d5807704f22f05d466ab0e0bb363ae3acd6bbfc36"


  # specify the target architectures for the binary files
  bottle do
    sha256 cellar: :any_skip_relocation, x86_64_darwin:  "7f33a14e46540352e684641a1ee537a18b7fefe8b39cee8dd21c5d5385abfd28"
    sha256 cellar: :any_skip_relocation, aarch64_darwin: "f5632478118c4baec6125abf67eacf0df99d8f04bb88a95fca660882f935f5c1"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "72c2185de9a62ad32c1b70133f60dcfbc030d330933fb9c2582913cbc2b9678a"
    sha256 cellar: :any_skip_relocation, aarch64_linux:  "adec1f06d7115835d7accf1c5838bb6538fee6b0dccb39eaf53198f4cea9b28f"
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
