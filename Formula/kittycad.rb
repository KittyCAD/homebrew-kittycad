class Kittycad < Formula
  desc " is a command-line interface to Zoo for use in your terminal or your scripts."
  homepage "https://zoo.dev/docs/cli/manual"
  url "https://dl.zoo.dev/releases/cli/v0.2.180/kittycad-cli.tar.gz"
  sha256 "b84825463f8b87dc831cfe9787a3e039d60122de493e0c1e39effff42494ac50"


  # specify the target architectures for the binary files
  bottle do
    sha256 cellar: :any_skip_relocation, x86_64_darwin:  "9cdef100841a560c22052ac6cf58b8ccf1596869aed60036b93d5f653245aa3a"
    sha256 cellar: :any_skip_relocation, aarch64_darwin: "3cc9b49f21e7926fb66004d107507c0fb6ae68ef0cb91877d01452880a6c70b8"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "5680a7192e926cfdd2eb7f827836f8928172f1f6cd0c897757f49754abfbee30"
    sha256 cellar: :any_skip_relocation, aarch64_linux:  "699090e951a52f6e013b913444a8f60efe0b1db70addff884c6f16f39ccf031c"
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
