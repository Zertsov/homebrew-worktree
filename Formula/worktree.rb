class Worktree < Formula
  desc "Modern CLI tool for managing git worktrees with stack visualization"
  homepage "https://github.com/Zertsov/worktree"
  version "0.0.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Zertsov/worktree/releases/download/v#{version}/worktree-#{version}-macos-arm64.tar.gz"
      sha256 "sha256:ff9b73ea5837e73a744c8df8bdf913b407df410b84660932b2d29c9b5040574c"
    else
      url "https://github.com/Zertsov/worktree/releases/download/v#{version}/worktree-#{version}-macos-x64.tar.gz"
      sha256 "sha256:e94acdb6d1db7514414718acc7567595feacb866d7a97f0ed763a8386ffb5c78"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/Zertsov/worktree/releases/download/v#{version}/worktree-#{version}-linux-x64.tar.gz"
      sha256 "sha256:9544d44bbee176300c59a4acb8d838e3f3072c45165585ecd8e349261e8531ca"
    end
  end

  def install
    if OS.mac?
      if Hardware::CPU.arm?
        bin.install "worktree-macos-arm64" => "worktree"
      else
        bin.install "worktree-macos-x64" => "worktree"
      end
    elsif OS.linux?
      bin.install "worktree-linux-x64" => "worktree"
    end
  end

  test do
    assert_match "worktree", shell_output("#{bin}/worktree --help")
  end
end

