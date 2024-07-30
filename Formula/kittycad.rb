class Kittycad < Formula
  desc " is a command-line interface to Zoo for use in your terminal or your scripts."
  homepage "https://zoo.dev/docs/cli/manual"
  url "https://dl.zoo.dev/releases/cli/v0.2.68/kittycad-cli.tar.gz"
  sha256 "a62c4de2bc90445fd30ad3f7cecd6d96ab1baaad7a42241b8984120fd40b051d"


  # specify the target architectures for the binary files
  bottle do
    sha256 cellar: :any_skip_relocation, x86_64_darwin:  "b082ddeb9388055a360fc205a2fffe3b603745e8978d51cb82ed24198086eb8a"
    sha256 cellar: :any_skip_relocation, aarch64_darwin: "fb1388cba1ef18cf8ff0d48dbeb0b1f20d0ff078cf7aaca1b218b5eb1bde7232"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "4d098f696cb585e91642e5df8976bb1f79dc068d24e6198dbfdb6b165c9255d2"
    sha256 cellar: :any_skip_relocation, aarch64_linux:  "f68cf3310bb46efa102fa245a8a61ffa1a2ddcc56d567ecb7f48477e5da5911b"
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
