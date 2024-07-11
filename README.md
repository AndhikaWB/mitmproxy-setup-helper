# mitmproxy Setup Helper

Simple batch scripts to quickly setup/remove [mitmproxy](https://mitmproxy.org/) necessities (such as proxy and certificate). Inspired by [HTTP Toolkit](https://httptoolkit.com/) zero setup. For now, it only supports Windows and Firefox

## Auto Setup for Windows and Firefox

Use the provided `bat` files to setup proxy or install certificate easily:
- `proxy_windows_set.bat`: add certificate and set proxy on Windows
- `proxy_windows_unset.bat`: delete certificate and unset proxy on Windows
- `cert_firefox_add.bat`: add certificate to Firefox and set Firefox to use Windows proxy
- `cert_firefox_delete.bat`: delete certificate from Firefox and unset Firefox proxy settings

Notes:
1. Download `mar-tools` from [Tor Project](https://dist.torproject.org/torbrowser) first (required for Firefox certificate setup)
2. Certificate is installed for the current user/profile only (not local machine)
3. It assumes that Firefox only has 1 default profile

<details>
  <summary>Manual setup (the original way)</summary>

## Manual Setup for Windows and Firefox

1. Download and install `mitmproxy` then start it
2. Go to Windows settings and search for "Proxy settings"
3. Edit it to use the IP address `127.0.0.1` and port `8080`, and don't forget to turn it on
4. Open Firefox, and go to Options -> General -> Network Settings
5. Choose the "Use system proxy settings" (or use the same IP and port as above)
6. Visit http://mitm.it/ then click the Windows icon to download the certificate
7. Follow the install instructions that appears after clicking the icon
8. After that, also download the Firefox certificate from http://mitm.it/
9. Go to Firefox Options -> Privacy & Security -> View Certificates -> Authorities
10. Import the previously downloaded Firefox certificate
11. Check "This certificate can identify websites"
12. Click ok and you're done

Notes:
- If you don't want to access http://mitm.it, you can import the certificates from `.mitmproxy` (on `%UserProfile%`) folder
- To delete the certificate on Firefox just the same as above but click "Delete" instead of "Import"
- To delete the certificate on Windows, run `certmgr.msc` and go to "Trusted Root CA" to remove `mitmproxy`

## Manual Setup for Android

1. Visit http://mitm.it and follow the instructions for Android
2. Restart the device in case you use the root (e.g. Magisk) approach
3. Go to your current Wi-Fi settings and click the edit button
4. Edit the proxy to use your computer IP (where `mitmproxy` is running) with port `8080`
5. Click save

Notes:
- Make sure your router doesn't have IP isolation enabled (or just use your own hotspot)
- In case your Android ignored the certificate, see [this issue](https://github.com/NVISOsecurity/MagiskTrustUserCerts/issues/31) for starter

</details>

## Access the Web UI

Run `mitmweb` and you should be able to access the UI via `localhost:8081`