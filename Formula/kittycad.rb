class Kittycad < Formula
  desc " is a command-line interface to Zoo for use in your terminal or your scripts."
  homepage "https://zoo.dev/docs/cli/manual"
  url "https://dl.zoo.dev/releases/cli/v0.2.158/kittycad-cli.tar.gz"
  sha256 "1b8d7b1ba1f71eb5f2548932760d846b8ca81169c87f8b16867629083c2dcf16"


  # specify the target architectures for the binary files
  bottle do
    sha256 cellar: :any_skip_relocation, x86_64_darwin:  "4572c77dcff005708e386b5e8a23482f09b1673737adf887c1ecdf2a315e4e75"
    sha256 cellar: :any_skip_relocation, aarch64_darwin: "f11858209f45427d2f60a243d6b0da2a9dc3009bdf6fea58ddd5a2ded4cc770b"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "33b2e22590b3bcea4a2ad1522d53584272e57654d95190cdcee93c768d999918"
    sha256 cellar: :any_skip_relocation, aarch64_linux:  "1ef62c340fcd100529d56580dc1cf368eb1ff8d7332ae6a59c9902b52e61f88f"
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
