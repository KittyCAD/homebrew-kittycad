class Kittycad < Formula
  desc " is a command-line interface to Zoo for use in your terminal or your scripts."
  homepage "https://zoo.dev/docs/cli/manual"
  url "https://dl.zoo.dev/releases/cli/v0.2.176/kittycad-cli.tar.gz"
  sha256 "685e719c1aa2c9ddc5de8b564eff3961df2f5302c86435413548d3d060f62eea"


  # specify the target architectures for the binary files
  bottle do
    sha256 cellar: :any_skip_relocation, x86_64_darwin:  "f846b89ec2d5645cfccc5661f4d4ef92bac1931d98dba38cc08920e9ab50563a"
    sha256 cellar: :any_skip_relocation, aarch64_darwin: "b51f91058082656aefff3e1b4d9683207960bb1912ac01856182240c55758150"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "7966d36780262a09677b2c2ad4d18337cdbd0584350deddf608e99e334fb8ffe"
    sha256 cellar: :any_skip_relocation, aarch64_linux:  "11a56aa2f37ca62931063d83b094c1b20489de2b768e516a1d91dc240e0d1541"
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
