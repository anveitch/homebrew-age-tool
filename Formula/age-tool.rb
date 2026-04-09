class AgeTool < Formula
  desc "A full featured AGE encryption management tool for encrypting, decrypting and managing AGE key pairs with audit logging"
  homepage "https://github.com/anveitch/age-tool"
  version "1.0.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/anveitch/age-tool/releases/download/v1.0.0/age-tool-macos-arm64"
      sha256 "653158a71c27ca620b95f5fd401635bea6099a1e911ccc1c01fcd1707427fc37"
    end

    on_intel do
      url "https://github.com/anveitch/age-tool/releases/download/v1.0.0/age-tool-macos-intel"
      sha256 "0e2dc21b8c488d1bf11526ae7710f0b1dcf5fb3cbdcce351353b4e0a577a1500"
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
