class AgeTool < Formula
  desc "A full featured AGE encryption management tool for encrypting, decrypting and managing AGE key pairs with audit logging"
  homepage "https://github.com/anveitch/age-tool"
  version "1.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/anveitch/age-tool/releases/download/v1.2.0/age-tool-macos-arm64"
  sha256 "0c73ce770326014ba7548d8853396187869f70405ec823a13a938e7f806c1a43"
    end

    on_intel do
      url "https://github.com/anveitch/age-tool/releases/download/v1.2.0/age-tool-macos-intel"
  sha256 "927050f1e586c2fbdd1e5af45515d9d3ac7b44c63b73f9eb9195a8f71bd04c76"
    end
  end

  def install
    # Determine the correct binary name based on architecture
    binary_name = if Hardware::CPU.arm?
      "age-tool-macos-arm64"
    else
      "age-tool-macos-intel"
    end

    # Make the binary executable and install it to the Homebrew bin directory
    chmod 0755, binary_name
    bin.install binary_name => "age-tool"
  end

  test do
    # Pipe q to quit immediately and verify the binary runs
    output = pipe_output("#{bin}/age-tool", "q\n", 0)
    assert_match "age-tool", output
  end
end
