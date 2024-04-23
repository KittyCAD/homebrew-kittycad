class Kittycad < Formula
  desc " is a command-line interface to Zoo for use in your terminal or your scripts."
  homepage "https://zoo.dev/docs/cli/manual"
  url "https://dl.zoo.dev/releases/cli/v0.2.40/kittycad-cli.tar.gz"
  sha256 "4cc03e9b98ca7bebbe945175b795f20cb025c9a0fb7d67f0be32d7e9d306a5f2"


  # specify the target architectures for the binary files
  bottle do
    sha256 cellar: :any_skip_relocation, x86_64_darwin:  "0d535d42355136266c2540a3410c3ac82e22fcde55c76c3d644b2bc0e7fbb29f"
    sha256 cellar: :any_skip_relocation, aarch64_darwin: "309a036af26a2268b6bac9f9606a7fb8665f74ce35955152fa6899691f1c3a03"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "10bf4df38b267d04f8dd5ad0db93cb4195700b4fa67669c856d3c79e5f035036"
    sha256 cellar: :any_skip_relocation, aarch64_linux:  "d948615024003f5f52135d4b1dba4821425edf6063fa66124b7add149a3fd2a1"
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
