# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Stripe < Formula
  desc "Stripe CLI utility"
  homepage "https://stripe.com"
  version "1.21.10"
  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stripe/stripe-cli/releases/download/v1.21.10/stripe_1.21.10_mac-os_arm64.tar.gz"
      sha256 "c954a0e06ee3c8049f798c90c9281b2dcd6e6590e48aa7648c5ca841b37d8379"

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
      url "https://github.com/stripe/stripe-cli/releases/download/v1.21.10/stripe_1.21.10_mac-os_x86_64.tar.gz"
      sha256 "a267d8705614b385871c8e64a65c04655c4457d7e3b8b611d605694b497c14c5"

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
