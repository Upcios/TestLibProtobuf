@echo off

set PATH_PROTOC=D:\Dev\THIRD_PARTY\protobuf-3.3.0\bin

for %%f in (*.proto) do (
	%PATH_PROTOC%\protoc.exe --cpp_out=generated %%f
)

REM pause