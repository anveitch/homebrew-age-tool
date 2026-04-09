class AgeTool < Formula
  desc "A full featured AGE encryption management tool for encrypting, decrypting and managing AGE key pairs with audit logging"
  homepage "https://github.com/anveitch/age-tool"
  version "1.1.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/anveitch/age-tool/releases/download/v1.1.1/age-tool-macos-arm64"
  sha256 "3a754e983a4b10c2d0db68c6af2f22ca00e6dccc4d027d553bbd9e8b32bb0b2c"
    end

    on_intel do
      url "https://github.com/anveitch/age-tool/releases/download/v1.1.1/age-tool-macos-intel"
  sha256 "3963a174b1bee88220a9392ce82adc87f16dcf59d3d984d5b7c234bf14623ef7"
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
