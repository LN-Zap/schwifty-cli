{ pkgs, lib, ... }:

{
  # https://devenv.sh/packages/
  packages = [
    pkgs.git
    pkgs.jq
    pkgs.tree
    pkgs.stdenv.cc.cc.lib
  ] ++ lib.optionals pkgs.stdenv.isLinux [
    pkgs.libstdcxx5
  ];

  enterTest = ''
    make build
    make test
  '';

  # https://devenv.sh/scripts/
  scripts.schwifty.exec = "$DEVENV_ROOT/dist/schwifty $@";
  scripts.schwifty-src.exec = "$DEVENV_ROOT/.venv/bin/python $DEVENV_ROOT/schwifty-cli/__main__.py $@";

  # https://devenv.sh/languages/
  languages.python.enable = true;
  languages.python.venv.enable = true;
  languages.python.poetry.enable = true;

  # https://devenv.sh/integrations/codespaces-devcontainer/
  devcontainer.enable = true;
}