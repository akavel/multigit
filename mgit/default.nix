
#
# TODO(akavel): migrate to 'whatever/default.nix' in: https://github.com/akavel/multigit/archive/3.6.1-nix.tar.gz
# to be able to install with simple:
#  $ nix-env -i -f https://github.com/akavel/multigit/archive/3.6.1-nix.tar.gz
#

with import <nixpkgs> {};

stdenv.mkDerivation {
  name = "mgit-3.6.1";
  # FIXME(akavel): verify hash
  src = fetchFromGitHub {
    owner = "akavel";
    repo = "multigit";
    rev = "3.6.1";
    # NOTE(akavel): sha256 retrieved with:
    #  $ nix-prefetch-url --unpack https://github.com/akavel/multigit/archive/3.6.1.tar.gz
    sha256 = "1hc7rzg29bl9myxlr0hn0vx3hlrpcrs2mhl76i4xjrb6m04pax52";
  };
  # TODO(akavel): find out how installPhase works, who handles it?
  #installPhase = "install -D $src/mgit $out/mgit";
  installPhase = "install -D $src/mgit $out/bin/mgit";
}
