class Kittycad < Formula
  desc " is a command-line interface to Zoo for use in your terminal or your scripts."
  homepage "https://zoo.dev/docs/cli/manual"
  url "https://dl.zoo.dev/releases/cli/v0.2.62/kittycad-cli.tar.gz"
  sha256 "4ce36e05db0b5f9149dbbae7a83108a97697273f8134cbe1da3bf258834ffa32"


  # specify the target architectures for the binary files
  bottle do
    sha256 cellar: :any_skip_relocation, x86_64_darwin:  "41a57127beca0e553a81f0614f47288cf563050cf8c66a2ec837768610602401"
    sha256 cellar: :any_skip_relocation, aarch64_darwin: "4588280733f3588a4b4caee4a801282aaa0f797ac1013bc75135ace3f0ada6c6"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "8243aa36bc534eaa496cc14eb187516e240c91ee227db56cf360cb726aec5501"
    sha256 cellar: :any_skip_relocation, aarch64_linux:  "711c35e22debed7667ef31855fe93ec5c2622cc259ae34f2c4d37dc2f06ff083"
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
