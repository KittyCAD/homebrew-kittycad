class Kittycad < Formula
  desc " is a command-line interface to KittyCAD for use in your terminal or your scripts."
  homepage "https://kittycad.io/docs/cli/manual"
  url "https://dl.kittycad.io/releases/cli/v0.2.13/kittycad-cli.tar.gz"
  sha256 "07f945a08a93a6a9e982de400722ceb51fa6b06533772d4be59e33fddd918622"


  # specify the target architectures for the binary files
  bottle do
    sha256 cellar: :any_skip_relocation, x86_64_darwin:  "c96b479ea3572c1a63f9a7e098d94215e85ee1fc3fa3fbaaf8f4fdc1a2bd2eae"
    sha256 cellar: :any_skip_relocation, aarch64_darwin: "42ecc995808921e784ef185b729af87acb6dbfcba8d233adc2298300fc382208"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "885e9b636832b93718f67bb1430b7eb4e9fd8e0911545d0156598ca5a9774640"
    sha256 cellar: :any_skip_relocation, aarch64_linux:  "3a76e97613b3c7ac352e88e1d1bda0f6aba164a03e5a985ee957fb7efd2a162c"
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
