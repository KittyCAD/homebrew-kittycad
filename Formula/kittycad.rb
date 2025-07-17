class Kittycad < Formula
  desc " is a command-line interface to Zoo for use in your terminal or your scripts."
  homepage "https://zoo.dev/docs/cli/manual"
  url "https://dl.zoo.dev/releases/cli/v0.2.114/kittycad-cli.tar.gz"
  sha256 "d1198cc91ffb24f95574e1e9071056a08b37fa3f5a313bd5b7d552e9c8410cec"


  # specify the target architectures for the binary files
  bottle do
    sha256 cellar: :any_skip_relocation, x86_64_darwin:  "a18172c5911899a9cc399efae8b310f5d376417545fe8e24656b5cd622e95667"
    sha256 cellar: :any_skip_relocation, aarch64_darwin: "d97e342e93807f67c4e2eec170ed04ceb142f2e2a56367f844b23e42e37b054e"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "4e7bc6043e997edacb5502991f602da72040ec78e8357c02f7dad79ee5a62b12"
    sha256 cellar: :any_skip_relocation, aarch64_linux:  "7f5d61126b90f980b9c25de2847820df73d308dd92d202f516ebc27683f76664"
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
