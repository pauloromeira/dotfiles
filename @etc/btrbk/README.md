### Backup configuration

2. Override `btrbk.service`
    ```sh
    sudo systemctl edit btrbk.service  # edits /etc/systemd/system/btrbk.service.d/override.conf
    ```

2. Add this after the first set of comments to exclude usb group:
    ```
    [Service]
    ExecStart=
    ExecStart=/usr/bin/btrbk --exclude=usb run
    ```
