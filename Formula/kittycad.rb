class Kittycad < Formula
  desc " is a command-line interface to Zoo for use in your terminal or your scripts."
  homepage "https://zoo.dev/docs/cli/manual"
  url "https://dl.zoo.dev/releases/cli/v0.2.123/kittycad-cli.tar.gz"
  sha256 "b666cf5494b289ece09130de1da34c3c837fa5ebc92773071b46307c1a2d7ec9"


  # specify the target architectures for the binary files
  bottle do
    sha256 cellar: :any_skip_relocation, x86_64_darwin:  "455fe58aef8bb1a073d0f8d1548bda2190972287b734e1b8e0342e46835f3129"
    sha256 cellar: :any_skip_relocation, aarch64_darwin: "f9d4fb6d1d9b667a2b65d1ed6a13dd876c494fb3e80fe6cff8975685492fb68c"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "7a2ee632cd69b98253cc63d5ddae9435b968a289a7ac928e0a6c08390587dfcd"
    sha256 cellar: :any_skip_relocation, aarch64_linux:  "a5d92ce2089fa44c791d095bbf607db985b6f975223cf15e4d1a7bbc93e59f15"
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
