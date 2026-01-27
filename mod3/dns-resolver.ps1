param ($IP, $server)

for ($i = 1; $i -le 254; $i++) {
    $HostAddress = "$IP.$i"
    $HostUp = Resolve-DnsName -Name $HostAddress -Server $server -ErrorAction SilentlyContinue

    foreach ($h in $HostUp) {
        if ($h.NameHost) {
        Write-Host "$HostAddress $($h.NameHost)"
        }
    }
}