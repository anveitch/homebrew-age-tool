class AgeTool < Formula
  desc "A full featured AGE encryption management tool for encrypting, decrypting and managing AGE key pairs with audit logging"
  homepage "https://github.com/anveitch/age-tool"
  version "1.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/anveitch/age-tool/releases/download/v1.1.0/age-tool-macos-arm64"
  sha256 "78c2246e6fedbc8bde4f75c715ae160f99abd8bba1643b181236b67d7b4e27d2"
    end

    on_intel do
      url "https://github.com/anveitch/age-tool/releases/download/v1.1.0/age-tool-macos-intel"
  sha256 "afe9aa8d8b8657e5b69cfaa9e606a8d5ef2399590aaf774ec0711ae3f5fd664d"
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
