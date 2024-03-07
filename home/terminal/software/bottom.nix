{pkgs, ...}: {
  programs.bottom = {
    enable = true;
    settings = {
      flags.group_processes = true;
      row = [
        {
          ratio = 4;
          child = [
            {
              type = "proc";
              ratio = 1;
              default = true;
            }
          ];
        }
        {
          ratio = 3;
          child = [
            {type = "mem";}
            {type = "cpu";}
          ];
        }
      ];
    };
  };
}
