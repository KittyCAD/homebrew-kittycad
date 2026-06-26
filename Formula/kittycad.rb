class Kittycad < Formula
  desc " is a command-line interface to Zoo for use in your terminal or your scripts."
  homepage "https://zoo.dev/docs/cli/manual"
  url "https://dl.zoo.dev/releases/cli/v0.2.179/kittycad-cli.tar.gz"
  sha256 "55946613225f287a7e8442c396277da30979c5674f3c22b76d02220583069641"


  # specify the target architectures for the binary files
  bottle do
    sha256 cellar: :any_skip_relocation, x86_64_darwin:  "2f6935d21337a4b321dcf31fe5d4bf3556c8001f738697c2e9fa3af372426a8d"
    sha256 cellar: :any_skip_relocation, aarch64_darwin: "cdaacc006915e4db5af1155c34ad20f5b752706f7b4938750d2f1093398edca6"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "c5fa3eeef1c598c87048aa7a6500bd8512b2982f06f7a7df7a08a5e5a1a1020e"
    sha256 cellar: :any_skip_relocation, aarch64_linux:  "0fe4f89c1892f9a79dd40ed972885b8689062f98703bc5613ad62409f9e526a7"
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
