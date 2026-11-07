{ pkgs, ... }: {
  home.packages = with pkgs; [
    timewarrior
    taskwarrior3
  ];

  home.file.".task/hooks/on-modify.timewarrior" = {
    source = ./hooks/timewarrior.py;
    executable = true;
  };
}
