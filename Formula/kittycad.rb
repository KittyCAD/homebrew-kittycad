class Kittycad < Formula
  desc " is a command-line interface to Zoo for use in your terminal or your scripts."
  homepage "https://zoo.dev/docs/cli/manual"
  url "https://dl.zoo.dev/releases/cli/v0.2.147/kittycad-cli.tar.gz"
  sha256 "9c5986ca725b6ee4f34c6a3012a9dcded5850b232b74db4898575a84bff06461"


  # specify the target architectures for the binary files
  bottle do
    sha256 cellar: :any_skip_relocation, x86_64_darwin:  "7b20a6299f14911bb59adc3b5574c13ad1a591d5e2bb812fa7d5cae0b356accd"
    sha256 cellar: :any_skip_relocation, aarch64_darwin: "e325c82aa1fd74ef57382fd2b6fc2776e495ec5f57eadd9234bc1b57b4c5aebb"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "75c09b67cdd78591a76ba27234eaf1de869d61012dde7539076a1b66952cc034"
    sha256 cellar: :any_skip_relocation, aarch64_linux:  "a7c6e28f10a3b62e2baa993bfa8e98b38dfc473069a52ac90ade46825998a762"
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
