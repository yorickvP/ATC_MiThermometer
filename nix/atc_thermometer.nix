{ stdenvNoCC, fetchFromGitHub, telink-825x-sdk, tc32-gcc, python3 }:
stdenvNoCC.mkDerivation {
  pname = "ATC_Thermometer";
  version = "20201003";
  src = "${fetchFromGitHub {
    owner = "atc1441";
    repo = "ATC_MiThermometer";
    rev = "772348a2266ea22bd58795314be148a8154e6462";
    sha256 = "05ggw0c61fbhw751c5icpv31i0cjk2nx5nmnkixid07ajsmhb7fw";
  }}/ATC_Thermometer";
  enableParallelBuilding = true;
  nativeBuildInputs = [ tc32-gcc python3 ];
  TEL_PATH = telink-825x-sdk;
  makeFlags = [ "TEL_PATH=${telink-825x-sdk}" ];
  installPhase = ''
    runHook preInstall
    mkdir $out
    cp -r ATC_Thermometer.bin $_
    runHook postInstall
  '';
}
