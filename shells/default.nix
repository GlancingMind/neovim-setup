{
  mkShellNoCC,
  git
}:

mkShellNoCC {
  packages = [
    git # required by flake
  ];

  shellHook = ''
  '';
}
