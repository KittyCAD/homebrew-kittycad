class Kittycad < Formula
  desc " is a command-line interface to Zoo for use in your terminal or your scripts."
  homepage "https://zoo.dev/docs/cli/manual"
  url "https://dl.zoo.dev/releases/cli/v0.2.199/kittycad-cli.tar.gz"
  sha256 "8a5ef9129793686dfba7f8709a86b7a5057ab3c86be0e0bad575075b51928d18"


  # specify the target architectures for the binary files
  bottle do
    sha256 cellar: :any_skip_relocation, x86_64_darwin:  "62633e379245742120982294ffa1535a45b1d64f8f8e711801af6fd611c5cf4e"
    sha256 cellar: :any_skip_relocation, aarch64_darwin: "2b98efc74cc3eb537b27751a729cad79ca3705d27ef05124af0267a0dee8d1f0"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "db7c3ebc75b7ed61dd401c8c6701076ea65968a9f58aa8033a36972ce4820835"
    sha256 cellar: :any_skip_relocation, aarch64_linux:  "a1f4647a7513d78ab75faa833bc55187c45071e51bb0d8989765bf4f5bdbecc5"
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
