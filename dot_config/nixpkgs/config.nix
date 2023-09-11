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
        cilium-cli
        curlie
        # discord
        docker-compose
        eksctl
        fzf
        # go-task
        google-cloud-sdk
        grpcurl
        kubernetes-helm
        htop
        httpie
        hubble
        infracost
        istioctl
        # kitty
        kustomize
        kubectl
        kubie
        mage
        minio-client
        minisign
        nushell
        packer
        pywal
        # replibyte
        skaffold
        # slack
        sops
        # spotify
        spotifyd
        starship
        steam
        yq-go
        zellij
        zoxide
      ];
    };
    devPackages = pkgs.buildEnv {
      name = "dev-packages";
      paths = [
        bazel
        bazelisk
        # cyber
        go
        gore
        helm-ls
        helm-docs
        hugo
        kube-linter
        nodejs
        pulumi
        shellcheck
        terraform
        terraform-docs
        terraform-ls
        terraformer
        terraforming
        terragrunt
        terrascan
        tflint
        tfsec
        trivy
        # vscode
      ];
    };
    webPackages = pkgs.buildEnv {
      name = "web-packages";
      paths = [
        chromium
        # firefox no video accel
      ];
    };
  };
  pathsToLink = ["/share" "/bin" "/Applications" ];
}
