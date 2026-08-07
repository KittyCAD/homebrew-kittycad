class Kittycad < Formula
  desc " is a command-line interface to Zoo for use in your terminal or your scripts."
  homepage "https://zoo.dev/docs/cli/manual"
  url "https://dl.zoo.dev/releases/cli/v0.2.187/kittycad-cli.tar.gz"
  sha256 "3515bc4ff3ea24ea40ded8d61485cbd6d179b229f76fdd1ee86b2c09afb6b139"


  # specify the target architectures for the binary files
  bottle do
    sha256 cellar: :any_skip_relocation, x86_64_darwin:  "fe5a0fd7c1b6332ef4ba5811131a097972523c0165ae3eb379677d9ad46b7ebc"
    sha256 cellar: :any_skip_relocation, aarch64_darwin: "9822dec04348447a44bb06d829a773a6c59272a227468f2a4afd6b8f88c8ec5a"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "09525ad54d68a8c28e209a3eff034b0962bb5c913856e0310bcdf295dc24262c"
    sha256 cellar: :any_skip_relocation, aarch64_linux:  "f09c9313f13606c2ec818a03ea6c2dd2ca3160469aea7f08d6138e71897c23bb"
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
