class Kittycad < Formula
  desc " is a command-line interface to Zoo for use in your terminal or your scripts."
  homepage "https://zoo.dev/docs/cli/manual"
  url "https://dl.zoo.dev/releases/cli/v0.2.115/kittycad-cli.tar.gz"
  sha256 "576a5abbf8cf5ac1bf82f37fcd37faa45c2c1e2e16925ebd67c5fbf7642978bd"


  # specify the target architectures for the binary files
  bottle do
    sha256 cellar: :any_skip_relocation, x86_64_darwin:  "1804829a9d0879b2574eb26113b9e4cde703219a5179627b409e61d9e2837950"
    sha256 cellar: :any_skip_relocation, aarch64_darwin: "74c847fdc86714dbfffe76e4db4c96116f4daa78a29954226b301acd23ea72d3"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "cd561d93f62fc238c8d046225ef5c748bd674be68d2c5fa990f79b33203ceca2"
    sha256 cellar: :any_skip_relocation, aarch64_linux:  "966d045c22b7a07cac19e61e5c04656df95556735a27ef3c58c4d83ce7b4665b"
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
