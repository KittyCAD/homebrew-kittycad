class Kittycad < Formula
  desc " is a command-line interface to Zoo for use in your terminal or your scripts."
  homepage "https://zoo.dev/docs/cli/manual"
  url "https://dl.zoo.dev/releases/cli/v0.2.91/kittycad-cli.tar.gz"
  sha256 "b90d1184ceca44fab5ef848521872d7a7771c52d6b8fb4ee43f9545170ed8c32"


  # specify the target architectures for the binary files
  bottle do
    sha256 cellar: :any_skip_relocation, x86_64_darwin:  "70230ded149af0baac367776885783ead3b26ec9355d341233410b1b15771438"
    sha256 cellar: :any_skip_relocation, aarch64_darwin: "d20a9a38c36fe67eb89937a92b89427976565e2f94c425289060c0f57e612d48"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "8eb185700546fb7b07c631f5aadaf1d46dc14d9f81b6bd63813a1e3dc9aaaec8"
    sha256 cellar: :any_skip_relocation, aarch64_linux:  "41b525f6354c3d91312e897c4d7970892b5608d5a3534d6d42aeec9f1f2f41df"
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
