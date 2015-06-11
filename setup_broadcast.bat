@echo off
setlocal EnableDelayedExpansion

for /f  "tokens=1 skip=1" %%i in ('wmic nic where "name = 'TAP-Windows Adapter V9'" get caption') do (
	set interfaceid=%%i
	set /a interfaceid=10!interfaceid:~1,8! %% 100
	
	route delete 255.255.255.255 if !interfaceid!
	route add 255.255.255.255 mask 255.255.255.255 0.0.0.0 if !interfaceid!
	goto :eof
)
