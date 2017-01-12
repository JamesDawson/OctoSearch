$here = Split-Path -Parent $PSCommandPath
$srcDir = Resolve-Path $here\..\src
if (!(Test-Path $here\..\bin)) { Push-Location $here\..; mkdir bin; Pop-Location }
$outDir = Resolve-Path $here\..\bin
docker build -t octosearch/buildlinux -f Dockerfile.linux .
docker run -it -v ("{0}:/app/src" -f $srcDir) -v ("{0}:/output" -f $outDir) octosearch/buildlinux