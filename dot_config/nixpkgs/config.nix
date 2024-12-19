{
  allowUnfree = true;
  enableParallelBuildingByDefault = false;

  packageOverrides = pkgs: with pkgs; {
    corePackages = pkgs.buildEnv {
      name = "core-packages";
      paths = [
        # alacritty
        apko
        argocd
        awscli2
        aws-iam-authenticator
        aws-vault
        bat
        bore-cli
        buildkit
        containerd
        chezmoi
        cilium-cli
        click
        clickhouse
        cni-plugins
        coreutils-prefixed
        cosign
        curlie
        crun
        # discord
        difftastic
        direnv
        dive
        docker-compose
        eksctl
        eks-node-viewer
        envoy
        fzf
        ghz
        git
        go-task
        grafana-dash-n-grab
        grafana-loki
        grpcurl
        gum
        kubernetes-helm
        handbrake
        hey
        htop
        httpie
        httpx
        hubble
        hurl
        hyperfine
        ingress2gateway
        istioctl
        # kitty
        just
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
        melange
        micro
        minio-client
        minisign
        mise
        nerdctl
        natscli
        nats-top
        nnn
        nushell
        packer
        podman
        popeye
        pywal
        rclone
        ripgrep
        regclient
        # replibyte
        scaleway-cli
        skaffold
        # slack
        sops
        # spotify
        # spotifyd
        starship
        stern
        usql
        vegeta
        vhs
        vcluster
        viddy
        wtf
        xh
        yq-go
        # yubikey-manager
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
        bun
        # cargo
        # cyber
        chart-testing
        dart
        # deno
        evans
        fnm
        go
        gore
        goreleaser
        helm-ls
        helm-docs
        hugo
        icdiff
        kube-linter
        # nodejs
        # opentofu
        poetry
        # pulumi
        risor
        ruff
        # rustc
        shellcheck
        tenv
        # terraform
        terraform-docs
        terraform-ls
        terraformer
        terraforming
        # terragrunt
        terrascan
        tfk8s
        tflint
        tfsec
        trivy
        uv
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
