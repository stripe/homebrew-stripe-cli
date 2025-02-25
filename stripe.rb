# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Stripe < Formula
  desc "Stripe CLI utility"
  homepage "https://stripe.com"
  version "1.25.0"
  depends_on :macos

  if Hardware::CPU.intel?
    url "https://github.com/stripe/stripe-cli/releases/download/v1.25.0/stripe_1.25.0_mac-os_x86_64.tar.gz"
    sha256 "62c7b94b2b3552d861a3e70f3762ea700fb4b39b3e3ad70369437d0471e346d8"

    def install
      bin.install "stripe"
      rm Dir["#{bin}/{stripe-completion.bash,stripe-completion.zsh}"]
      system bin/"stripe", "completion", "--shell", "bash"
      system bin/"stripe", "completion", "--shell", "zsh"
      bash_completion.install "stripe-completion.bash"
      zsh_completion.install "stripe-completion.zsh"
      (zsh_completion/"_stripe").write <<~EOS
        #compdef stripe
        _stripe () {
          local e
          e=$(dirname ${funcsourcetrace[1]%:*})/stripe-completion.zsh
          if [[ -f $e ]]; then source $e; fi
        }
      EOS
    end
  end
  if Hardware::CPU.arm?
    url "https://github.com/stripe/stripe-cli/releases/download/v1.25.0/stripe_1.25.0_mac-os_arm64.tar.gz"
    sha256 "d8b1b9c7e0a7c29d302386b3c6aa682fd5a9e33c4689eea0f4c2106a7588ba88"

    def install
      bin.install "stripe"
      rm Dir["#{bin}/{stripe-completion.bash,stripe-completion.zsh}"]
      system bin/"stripe", "completion", "--shell", "bash"
      system bin/"stripe", "completion", "--shell", "zsh"
      bash_completion.install "stripe-completion.bash"
      zsh_completion.install "stripe-completion.zsh"
      (zsh_completion/"_stripe").write <<~EOS
        #compdef stripe
        _stripe () {
          local e
          e=$(dirname ${funcsourcetrace[1]%:*})/stripe-completion.zsh
          if [[ -f $e ]]; then source $e; fi
        }
      EOS
    end
  end

  def caveats
    <<~EOS
      ❤ Thanks for installing the Stripe CLI! If this is your first time using the CLI, be sure to run `stripe login` first.
    EOS
  end
end
