class Kittycad < Formula
  desc " is a command-line interface to Zoo for use in your terminal or your scripts."
  homepage "https://zoo.dev/docs/cli/manual"
  url "https://dl.zoo.dev/releases/cli/v0.2.197/kittycad-cli.tar.gz"
  sha256 "e1f0954060a08d38043c24ca34b80a86a7d702ca0bd28e9fd135af12fdd816c9"


  # specify the target architectures for the binary files
  bottle do
    sha256 cellar: :any_skip_relocation, x86_64_darwin:  "bdc41f160a416c2393608474636f682a21240ec9a3985abb455fd59a508b3737"
    sha256 cellar: :any_skip_relocation, aarch64_darwin: "e8818f85eaf59435b3b370ecd65fdc9c6ab56a21ddfdf8f1021fcd62af7b3a46"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "5d663ec7cc04bc1c157ad303798b904fe1dd37b844532b38204f4fafbcd746d9"
    sha256 cellar: :any_skip_relocation, aarch64_linux:  "89ccbdae448d56a57d875b889c11f780689c50935f946c8b2491c4ccbb562c5f"
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
