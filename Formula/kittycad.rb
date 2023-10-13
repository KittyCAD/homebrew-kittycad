class Kittycad < Formula
  desc " is a command-line interface to KittyCAD for use in your terminal or your scripts."
  homepage "https://kittycad.io/docs/cli/manual"
  url "https://dl.kittycad.io/releases/cli/v0.2.12/kittycad-cli.tar.gz"
  sha256 "31349bdb826a2965363f8245ae76448f848fb55167fb7632025dfb82783c7de8"


  # specify the target architectures for the binary files
  bottle do
    sha256 cellar: :any_skip_relocation, x86_64_darwin:  "62d63c3c976b4c55393bd4d569c02436217f3e92e600bcca6d4558b4cc68cfe6"
    sha256 cellar: :any_skip_relocation, aarch64_darwin: "790fb862696d261e957f83057b0ec4b9f123f65f807d715e52f520456aa32423"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "c2927b936b0ee39414f65a0c73ef8c7dbd8a80e434e991fdffc29ab143b64238"
    sha256 cellar: :any_skip_relocation, aarch64_linux:  "26792d31ad7ac0c38ef298115c6e40cf3c083eecccdedecd382049b7fe0e1da2"
  end

  def install
    # check if the user is using Linux and their hardware and install the appropriate binary
    if OS.linux?
      if Hardware::CPU.type == :intel
        bin.install "x86_64_linux/kittycad"
      elsif Hardware::CPU.type == :arm
        bin.install "aarch64_linux/kittycad"
      end
    else
      if Hardware::CPU.type == :intel
        bin.install "x86_64_darwin/kittycad"
      elsif Hardware::CPU.type == :arm
        bin.install "aarch64_darwin/kittycad"
      end
    end
  end
end
