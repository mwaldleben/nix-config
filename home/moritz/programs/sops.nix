{ inputs, pkgs, ... }: {
  imports = [ inputs.sops-nix.homeManagerModules.sops ];

  sops = {
    age.sshKeyPaths = [ /persist/etc/ssh/ssh_host_ed25519_key ];
    defaultSymlinkPath = "/run/user/1000/secrets";
    defaultSecretsMountPoint = "/run/user/1000/secrets.d";
  };
}
