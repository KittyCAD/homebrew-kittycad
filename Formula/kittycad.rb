class Kittycad < Formula
  desc " is a command-line interface to Zoo for use in your terminal or your scripts."
  homepage "https://zoo.dev/docs/cli/manual"
  url "https://dl.zoo.dev/releases/cli/v0.2.211/kittycad-cli.tar.gz"
  sha256 "3202cc9c88cd3b0ccfd37e91915e3ecc09369419d88a2b8ab33d2420b2c0fb14"


  # specify the target architectures for the binary files
  bottle do
    sha256 cellar: :any_skip_relocation, x86_64_darwin:  "6162a6e427478b6dee1e74240b07137bd8c31f6b5a25dc547f5d058b82eec03e"
    sha256 cellar: :any_skip_relocation, aarch64_darwin: "4e80960792bb9b356b1b97b000a2f323ee4c7618e5438c1a5cae929333087a06"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "14b2c49e8270a723bb5da10acb4970fe8a3ae2f57168d4209d9ae9ce70ca996f"
    sha256 cellar: :any_skip_relocation, aarch64_linux:  "77196736bcdd9be3324708fb046ba290d8898b992d3410bfceb20708319178c4"
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
