let sources = import ./sources.nix; in
import sources.nixpkgs {
  overlays = [ (self: super: {
    tc32-gcc = super.callPackage ./tc32-gcc.nix {};
    telink-825x-sdk = super.callPackage ./telink-825x-sdk.nix {};
    atc_thermometer = super.callPackage ./atc_thermometer.nix {};
  }) ];
}
