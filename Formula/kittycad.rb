class Kittycad < Formula
  desc " is a command-line interface to Zoo for use in your terminal or your scripts."
  homepage "https://zoo.dev/docs/cli/manual"
  url "https://dl.zoo.dev/releases/cli/v0.2.213/kittycad-cli.tar.gz"
  sha256 "8847a5ea4aea8acb99020cd0051b93ecb956bdc191d987e15bd46012ca94b917"


  # specify the target architectures for the binary files
  bottle do
    sha256 cellar: :any_skip_relocation, x86_64_darwin:  "4aece1f915909fc188aac8b5ba4d1974c8c8dff74825a0b6f6bbf8fd371146c9"
    sha256 cellar: :any_skip_relocation, aarch64_darwin: "2eda322c43424284030360813a473d3dc324cebbaeae9d0543853b4c0bba19a1"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "87d457bab6322cc17a846ccec9bf91ca01abbf81e26cb07958e72ec0f5a80cd6"
    sha256 cellar: :any_skip_relocation, aarch64_linux:  "2ea83867ede7d29c3859cf44a48e09b7a68a2292338dddfe4e513f95c6d2ee8c"
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
