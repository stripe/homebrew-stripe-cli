# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Stripe < Formula
  desc "Stripe CLI utility"
  homepage "https://stripe.com"
  version "1.8.9"
  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stripe/stripe-cli/releases/download/v1.8.9/stripe_1.8.9_mac-os_arm64.tar.gz"
      sha256 "f965aa5500c36013e46a0b157f26440f952dabd16f3ddd66e349e05851162899"

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
    if Hardware::CPU.intel?
      url "https://github.com/stripe/stripe-cli/releases/download/v1.8.9/stripe_1.8.9_mac-os_x86_64.tar.gz"
      sha256 "a7a9eb397a0ea1162d80e9d5478e98f054bbaa26ce09a4c4cda70dd41fbdb909"

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
  end

  def caveats; <<~EOS
    ❤ Thanks for installing the Stripe CLI! If this is your first time using the CLI, be sure to run `stripe login` first.
  EOS
  end
end
