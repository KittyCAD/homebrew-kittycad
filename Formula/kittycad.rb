class Kittycad < Formula
  desc " is a command-line interface to Zoo for use in your terminal or your scripts."
  homepage "https://zoo.dev/docs/cli/manual"
  url "https://dl.zoo.dev/releases/cli/v0.2.130/kittycad-cli.tar.gz"
  sha256 "a29da9898eb1f074e43a4859e2eb51d66275d3b54f8326b8bbf9e46620c54acb"


  # specify the target architectures for the binary files
  bottle do
    sha256 cellar: :any_skip_relocation, x86_64_darwin:  "0a5ccc7e7959d54a18c3133d9742a844ca7cb3fa230d69fc625a431e4e98ae29"
    sha256 cellar: :any_skip_relocation, aarch64_darwin: "4e87800f3eb1af0d39ae9b2bc7dd09994e07034967f75e5719076e789e17361f"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "081e368cfac3073564de947d19fe83384d6d99674d5a59ff552c1dd05bd984c4"
    sha256 cellar: :any_skip_relocation, aarch64_linux:  "371d64ffed04d13291f4eeeb9f880ff1dd9b577b1952f1cdff786f0e9e760dcc"
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
