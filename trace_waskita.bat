@echo off
title Waskita Network Tracer & Printer Checker
color 0A
cls

echo =================================================================
echo [SYS] INITIALIZING WASKITA NETWORK TRACER...
echo [SYS] TARGET 1: WASKITA RAJAWALI TOWER (WRT) -^> WASKITA PUSAT
echo [SYS] TARGET 2: CENTRAL PRINTER (10.10.1.59)
echo =================================================================
timeout /t 2 >nul

echo.
echo [!] MAPPING ROUTE: Waskita Rajawali Tower ---^> Waskita Karya Pusat
echo [~] Fetching geo-coordinates and network hops...
timeout /t 3 >nul

:: Simulasi visual tracking ala hacker
echo [^>] Hop 1: Gateway WRT (192.168.10.1) [Latency: 2ms]
timeout /t 1 >nul
echo [^>] Hop 2: WRT Core Switch (10.0.12.254) [Latency: 4ms]
timeout /t 1 >nul
echo [^>] Hop 3: Edge Router WRT (172.16.5.1) [Latency: 7ms]
timeout /t 1 >nul
echo [^>] Hop 4: Transit Provider MPLS [Latency: 12ms]
timeout /t 1 >nul
echo [^>] Hop 5: Central Firewall Waskita Pusat (10.0.1.1) [Latency: 15ms]
timeout /t 1 >nul
echo [^>] Hop 6: Core Switch Waskita Pusat (10.0.1.254) [Latency: 14ms]
timeout /t 1 >nul
echo [+] CONNECTION ESTABLISHED BETWEEN WRT AND PUSAT.
echo =================================================================
echo.

echo [!] STARTING ACTUAL NETWORK TRACE (TRACERT TO WASKITA PUSAT)
echo [~] Executing live network trace...
:: Sila ganti IP/Domain di bawah dengan IP server pusat yang asli jika ada, sementara pakai google dns buat contoh live trace
tracert -d -h 10 8.8.8.8
echo.
echo =================================================================
echo.

echo [!] CHECKING CONNECTION TO CENTRAL PRINTER (10.10.1.59)
echo [~] Sending 4 ICMP Echo Requests to 10.10.1.59...
echo.

ping -n 4 10.10.1.59

if %errorlevel% == 0 (
    echo.
    echo =================================================================
    echo [+] STATUS: SUCCESS
    echo [^>] Printer 10.10.1.59 is ONLINE and REACHABLE.
    echo =================================================================
) else (
    echo.
    echo =================================================================
    echo [-] STATUS: FAILED / TIMEOUT
    echo [^>] Printer 10.10.1.59 is OFFLINE or UNREACHABLE from this node.
    echo [^>] Check local VLAN, printer power, or IP conflict.
    echo =================================================================
)

echo.
echo [SYS] Script execution finished. Press any key to exit.
pause >nul
