{
  nixpkgs = {
    url = github:NixOS/nixpkgs?branch=release-23.11;
  };
  home-manager = {
    url = github:nix-community/home-manager?branch=release-23.11;
    # home-manager's nixpkgs dependency is the same as ours
    inputs.nixpkgs.follows = "nixpkgs";
  };
}
