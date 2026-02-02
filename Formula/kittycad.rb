class Kittycad < Formula
  desc " is a command-line interface to Zoo for use in your terminal or your scripts."
  homepage "https://zoo.dev/docs/cli/manual"
  url "https://dl.zoo.dev/releases/cli/v0.2.144/kittycad-cli.tar.gz"
  sha256 "7999d6b897a3c4ffcc78a179bbe7994b104b493a47fa1da0ffd416fd161a8794"


  # specify the target architectures for the binary files
  bottle do
    sha256 cellar: :any_skip_relocation, x86_64_darwin:  "f5f878cc808ddd6954ce081cedae189f9ba93a5108b88fdd9bec0845dfda2311"
    sha256 cellar: :any_skip_relocation, aarch64_darwin: "0d01cbc7d886ad0fc750075b6e28494d1ccb224f28559204a6e7e5d2469c7247"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "b00f279d923457420d802f57d8e28940d356c857445246f7cbf09af949149bef"
    sha256 cellar: :any_skip_relocation, aarch64_linux:  "c0f36646309d7c787eb2b3cb2fbc167178da24be46932f9a599296ba74ba7b82"
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
