# SSH config notes

Use correct permissions for `~/.ssh`

```sh
chmod 700 ~/.ssh
chmod 600 ~/.ssh/*
```

## Private GitLab over SSH

Generate an identity file, upload the public key to your GitLab profile, then
add a host block:

```sshconfig
Host gitlab.kypo.fiit.stuba.sk
    HostName gitlab.kypo.fiit.stuba.sk
    IdentityFile ~/.ssh/kypo
```

Some private GitLab instances also require an active VPN before `git@` clones
will work.

## Password auth (skip pubkey)

```sh
ssh -o PreferredAuthentications=password -o PubkeyAuthentication=no kono@192.168.1.94
```

## Proxy jumping

```sshconfig
Host *.demo-cert.sk
    ProxyJump gw.demo-cert.sk
    # ProxyJump none   # -> run this on gw.demo-cert.sk itself
```

## X11 forwarding

```sshconfig
Host example
    ForwardX11 yes
    ForwardX11Trusted yes
```

## Port forwarding

```sshconfig
Host example
    DynamicForward 8080          # SOCKS proxy, routes traffic through local port 8080
    LocalForward 1337 127.0.0.1:80  # local port 1337 -> remote port 80
```

## VPN / tunnels used alongside SSH

```sh
# WireGuard (config lives in /opt/homebrew/etc/wireguard, not in this repo)
wg-quick up vpn

# OpenVPN
sudo /opt/homebrew/opt/openvpn/sbin/openvpn --config ./eu-central-1-Mushishy-premium.ovpn

# capture remote traffic and view it locally in Wireshark
ssh web.demo-cert.sk 'sudo tcpdump -U -w -' | sudo wireshark -k -i -

# copy a remote directory down
scp -r ludus:/home/slizik/ela .
```