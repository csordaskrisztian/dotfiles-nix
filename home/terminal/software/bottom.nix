{pkgs, ...}: {
  programs.bottom = {
    enable = true;
    settings = {
      flags.group_processes = true;
    };
  };
}
