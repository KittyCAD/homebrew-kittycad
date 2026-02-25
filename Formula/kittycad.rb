class Kittycad < Formula
  desc " is a command-line interface to Zoo for use in your terminal or your scripts."
  homepage "https://zoo.dev/docs/cli/manual"
  url "https://dl.zoo.dev/releases/cli/v0.2.148/kittycad-cli.tar.gz"
  sha256 "db8fe74d069b03802d621d2b3c583a295352b33a6a6a47be18d6f32d32af0001"


  # specify the target architectures for the binary files
  bottle do
    sha256 cellar: :any_skip_relocation, x86_64_darwin:  "26ff44f58f1f9f4c45cfdf387afe0011b0540782edb1c05c9950bb23561c17cc"
    sha256 cellar: :any_skip_relocation, aarch64_darwin: "44beb0bf665265e77cdcf8037ee896c7d7f79d92360eae004b359642d60ac528"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "81f62651141e47442155afdc802dad57c8b38c824e04fb81e34a9de2d0eac70c"
    sha256 cellar: :any_skip_relocation, aarch64_linux:  "efafe56995c234d40ab13dbb5509a653240f294749f4c840282b82a72e3b65bf"
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
