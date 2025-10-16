{pkgs, ...}: {
  packages = [pkgs.git];

  languages.python = {
    enable = true;
    uv = {
      enable = true;
      sync.enable = true;
    };
  };

  # https://devenv.sh/scripts/
  scripts.testhello.exec = ''
    uv run pytest
  '';

  enterShell = ''
    git --version # Use packages
  '';

  # https://devenv.sh/tests/
  enterTest = ''
    echo "Running tests"
    git --version | grep --color=auto "${pkgs.git.version}"
  '';

  # See full reference at https://devenv.sh/reference/options/
}
