class Kittycad < Formula
  desc " is a command-line interface to Zoo for use in your terminal or your scripts."
  homepage "https://zoo.dev/docs/cli/manual"
  url "https://dl.zoo.dev/releases/cli/v0.2.64/kittycad-cli.tar.gz"
  sha256 "6f5bbdb166793ea1e01b8f1e2fed196f3fceaf2b9be0985f95a4b049f79ea70e"


  # specify the target architectures for the binary files
  bottle do
    sha256 cellar: :any_skip_relocation, x86_64_darwin:  "cbd99f1631f10ef31cf273d6519b1db9655eac816ba6534358ab6c3bbca9c0df"
    sha256 cellar: :any_skip_relocation, aarch64_darwin: "224ad8105883af740c9a023e79625a356f12f4e3abeed6df206a5065bd74c036"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "3d9aeb58d9f9fa4a6bf00f00711b5bd4c1862c53c4d366d6d929610e38c9ebf1"
    sha256 cellar: :any_skip_relocation, aarch64_linux:  "1eb5cabb1a966031530133fcb05fd74c81104dd530074d059816fff1083573ac"
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
