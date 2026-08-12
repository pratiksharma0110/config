{ pkgs, config, lib, ... }:
let
  srcPath = "/home/protikbruhh/Documents/fan/DivAcerManager 0.5.0";
  
  dam-kernel-module = pkgs.stdenv.mkDerivation {
    pname = "acer_nitro_gaming_driver2";
    version = "0.5.0";
    src = "${srcPath}/Daemon/NitroDrivers";
    
    nativeBuildInputs = config.boot.kernelPackages.kernel.moduleBuildDependencies;

    buildPhase = ''
      make -C ${config.boot.kernelPackages.kernel.dev}/lib/modules/${config.boot.kernelPackages.kernel.modDirVersion}/build M=$(pwd) modules
    '';
    
    installPhase = ''
      install -D -m 644 acer_nitro_gaming_driver2.ko $out/lib/modules/${config.boot.kernelPackages.kernel.modDirVersion}/misc/acer_nitro_gaming_driver2.ko
    '';
  };

  dam-binaries = pkgs.stdenv.mkDerivation {
    pname = "dam-fan-controls";
    version = "0.5.0";
    src = srcPath;

    nativeBuildInputs = [ pkgs.autoPatchelfHook pkgs.makeWrapper ];
    
    buildInputs = with pkgs; [ 
      stdenv.cc.cc.lib 
      zlib 
      openssl 
      icu
    ];

    installPhase = ''
      mkdir -p $out/bin $out/opt/dam-fan-controls $out/share/applications $out/share/icons/hicolor/256x256/apps

      cp Daemon/DAMFC_daemon $out/opt/dam-fan-controls/
      chmod +x $out/opt/dam-fan-controls/DAMFC_daemon

      cp DAM-FC $out/bin/DAM-FC
      chmod +x $out/bin/DAM-FC
      
      wrapProgram $out/bin/DAM-FC \
        --set DOTNET_BUNDLE_EXTRACT_BASE_DIR "\$HOME/.cache/damfc_extract"

      if [ -f fan-control-icon.png ]; then
        cp fan-control-icon.png $out/share/icons/hicolor/256x256/apps/dam-fan-controls.png
      fi
      
      cat > $out/share/applications/dam-fan-controls.desktop <<EOF
      [Desktop Entry]
      Name=DAM Fan Controls
      Comment=Div Acer Manager Fan Controls GUI Application
      Exec=$out/bin/DAM-FC
      Icon=dam-fan-controls
      Terminal=false
      Type=Application
      Categories=System;Utility;Settings;HardwareSettings;
      EOF
    '';
  };
in
{
  environment.systemPackages = [ dam-binaries ];

  boot.extraModulePackages = [ dam-kernel-module ];
  boot.kernelModules = [ "acer_nitro_gaming_driver2" ];

  systemd.services.dam-fan-controls-daemon = {
    description = "Div Acer Manager Fan Controls Daemon Service";
    after = [ "network.target" ];
    wantedBy = [ "multi-user.target" ];
    serviceConfig = {
      Type = "simple";
      ExecStart = "${dam-binaries}/opt/dam-fan-controls/DAMFC_daemon";
      WorkingDirectory = "${dam-binaries}/opt/dam-fan-controls";
      Restart = "on-failure";
      User = "root";
    };
  };
}
