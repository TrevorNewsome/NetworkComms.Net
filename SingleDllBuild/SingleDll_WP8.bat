md "./%1"

COPY ..\Platforms\WP8\NetworkCommsDotNet\bin\%1\NetworkCommsDotNet.dll .\%1\NetworkCommsDotNet.dll
COPY ..\Platforms\WP8\NetworkCommsDotNet\bin\%1\NetworkCommsDotNet.pdb .\%1\NetworkCommsDotNet.pdb

COPY ..\DLL\WP8\protobuf-net.dll .\%1\protobuf-net.dll

COPY ..\Platforms\WP8\DPSBase\bin\%1\DPSBase.dll .\%1\DPSBase.dll
COPY ..\Platforms\WP8\DPSBase\bin\%1\DPSBase.pdb .\%1\DPSBase.pdb

COPY ..\Platforms\WP8\SevenZipLZMACompressor\bin\%1\SevenZipLZMACompressor.dll .\%1\SevenZipLZMACompressor.dll
COPY ..\Platforms\WP8\SevenZipLZMACompressor\bin\%1\SevenZipLZMACompressor.pdb .\%1\SevenZipLZMACompressor.pdb

COPY ..\DLL\WP8\NLog.dll .\%1\NLog.dll

md ".\WP8"
md ".\WP8\%1\Core"

.\ILMerge.exe /lib:"%ProgramFiles(x86)%\Reference Assemblies\Microsoft\Framework\WindowsPhone\v8.0" /targetplatform:v4,"%ProgramFiles(x86)%\Reference Assemblies\Microsoft\Framework\Silverlight\v4.0\Profile\WindowsPhone71" /out:.\WP8\%1\Core\NetworkCommsDotNetCore.dll .\%1\NetworkCommsDotNet.dll .\%1\SevenZipLZMACompressor.dll .\%1\DPSBase.dll .\%1\protobuf-net.dll .\%1\NLog.dll

REM DEL .\%1\*.dll .\%1\*.pdb
REM DEL .\WP8\%1\Complete\*.pdb .\WP8\%1\Core\*.pdb

