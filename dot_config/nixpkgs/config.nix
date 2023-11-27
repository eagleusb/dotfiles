{
  allowUnfree = true;
  enableParallelBuildingByDefault = false;

  packageOverrides = pkgs: with pkgs; {
    corePackages = pkgs.buildEnv {
      name = "core-packages";
      paths = [
        # alacritty
        argocd
        awscli2
        aws-iam-authenticator
        aws-vault
        chezmoi
        cilium-cli
        curlie
        # discord
        dive
        docker-compose
        eksctl
        eks-node-viewer
        fzf
        # go-task
        google-cloud-sdk
        grafana-loki
        grpcurl
        gum
        kubernetes-helm
        handbrake
        htop
        httpie
        hubble
        hyperfine
        istioctl
        # kitty
        k9s
        krew
        kubeconform
        kubeval
        kubescape
        kubernetes-helmPlugins.helm-diff
        kubernetes-helmPlugins.helm-secrets
        kustomize
        kubectl
        kubectl-klock
        kubectl-gadget
        kubectl-explore
        kubectx
        kubie
        lf
        mage
        mcfly
        minio-client
        minisign
        natscli
        nats-top
        nnn
        nushell
        packer
        popeye
        pywal
        ripgrep
        regclient
        replibyte
        scaleway-cli
        skaffold
        # slack
        sops
        # spotify
        spotifyd
        starship
        stern
        vcluster
        viddy
        wtf
        yq-go
        zellij
        zoxide
      ];
    };
    devPackages = pkgs.buildEnv {
      name = "dev-packages";
      paths = [
        act
        bazel
        bazel-buildtools
        bazelisk
        buildpack
        cargo
        # cyber
        chart-testing
        dart
        evans
        go
        gore
        goreleaser
        helm-ls
        helm-docs
        hugo
        kube-linter
        nodejs
        opentofu
        pulumi
        risor
        rustc
        shellcheck
        terraform
        terraform-docs
        terraform-ls
        terraformer
        terraforming
        terragrunt
        terrascan
        tfk8s
        tflint
        tfsec
        trivy
        via
        # vscode
        werf
      ];
    };
    webPackages = pkgs.buildEnv {
      name = "web-packages";
      paths = [
        # chromium
        # firefox no video accel
      ];
    };
  };
  #pathsToLink = [ "/share" "/bin" "/Applications" "/etc" "/lib" ];
}
