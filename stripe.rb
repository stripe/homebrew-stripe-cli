# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Stripe < Formula
  desc "Stripe CLI utility"
  homepage "https://stripe.com"
  version "1.21.0"
  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stripe/stripe-cli/releases/download/v1.21.0/stripe_1.21.0_mac-os_arm64.tar.gz"
      sha256 "c1226bb09a424d26b66534b03b010eeb1d2e998d364b4fccb9ed426e2a1222e6"

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
      url "https://github.com/stripe/stripe-cli/releases/download/v1.21.0/stripe_1.21.0_mac-os_x86_64.tar.gz"
      sha256 "96134a92d3f39987958c5403b7b68f6420bc6e60373bcb50b4b76230c7613404"

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
