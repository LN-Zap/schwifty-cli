{ pkgs, ... }:

{
  # https://devenv.sh/packages/
  packages = [
    pkgs.git
    pkgs.jq
  ];

  # https://devenv.sh/scripts/
  scripts.build.exec = "pyinstaller --clean schwifty.spec --noconfirm";
  scripts.schwifty.exec = "$DEVENV_ROOT/dist/schwifty/schwifty $@";
  scripts.schwifty-src.exec = "$DEVENV_ROOT/.venv/bin/python $DEVENV_ROOT/schwifty-cli/__main__.py $@";

  # https://devenv.sh/languages/
  languages.python.enable = true;
  languages.python.venv.enable = true;
  languages.python.poetry.enable = true;

  # https://devenv.sh/integrations/codespaces-devcontainer/
  devcontainer.enable = true;
}