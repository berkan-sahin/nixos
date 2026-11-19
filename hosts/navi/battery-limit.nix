{ pkgs, ... }:

{
  systemd.services.battery-charge-limit = {
    description = "Set battery charge limit to 80%";
    wantedBy = [ "multi-user.target" ];
    after = [ "sysinit.target" ];
    serviceConfig = {
      Type = "oneshot";
      ExecStart = "${pkgs.writeShellScript "set-battery-charge-limit" ''
        set -eu
        for battery in /sys/class/power_supply/BAT*/charge_control_end_threshold; do
          [ -e "$battery" ] || continue
          echo 80 > "$battery"
        done
      ''}";
    };
  };
}
