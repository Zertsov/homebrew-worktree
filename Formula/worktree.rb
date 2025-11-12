class Worktree < Formula
  desc "Modern CLI tool for managing git worktrees with stack visualization"
  homepage "https://github.com/Zertsov/worktree"
  version "0.0.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Zertsov/worktree/releases/download/v#{version}/worktree-#{version}-macos-arm64.tar.gz"
      sha256 "231acfdd6a57f4156be93277a16e54639d611c16f2e2edc5e1d408ebc56f275c"
    else
      url "https://github.com/Zertsov/worktree/releases/download/v#{version}/worktree-#{version}-macos-x64.tar.gz"
      sha256 "b79bf2c4018bada4758cf395562582d1c4fe7b418b1886c0b8b5f2796e0268ee"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/Zertsov/worktree/releases/download/v#{version}/worktree-#{version}-linux-x64.tar.gz"
      sha256 "edde8bc38cc13aa16ee162d3f02d15a62509806e5d7ed033fc809d9cd2f4b55d"
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
