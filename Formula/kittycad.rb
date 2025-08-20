class Kittycad < Formula
  desc " is a command-line interface to Zoo for use in your terminal or your scripts."
  homepage "https://zoo.dev/docs/cli/manual"
  url "https://dl.zoo.dev/releases/cli/v0.2.118/kittycad-cli.tar.gz"
  sha256 "6d73ed22dd9ce258612ece66224e34e928a1110414e438d83971798527e95689"


  # specify the target architectures for the binary files
  bottle do
    sha256 cellar: :any_skip_relocation, x86_64_darwin:  "71c2f1b2b4a8028ebdfc20b668dcfa204d77166adbef76d79f9736df567e0fb1"
    sha256 cellar: :any_skip_relocation, aarch64_darwin: "5fe42e5e7bc10efdd8a35255f981dd87a65dc1b47b1d9a47a4950e3ea30db3ff"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "111524e62d0bb6954efb79a4b90a7e1e5d3b6d8d3c788bef911e409d951d8ba8"
    sha256 cellar: :any_skip_relocation, aarch64_linux:  "40184f591376b065724448a92c96525c5271daed99f1101e35ee96a40e06b877"
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
