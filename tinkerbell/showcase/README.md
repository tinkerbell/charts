#### tinkerbell/charts: introduce `showcase` chart

- `showcase` is a chart that, based on values.yaml dictionaries:
    - generates Tinkerbell CRs (Hardware/Template/Workflow) for both standard (UEFI) & exotic (supported by Armbian) devices
    - generates download/process jobs for multiple Hook flavors (see https://github.com/tinkerbell/hook/pull/205)
    - generates download/process jobs for a few OS images (Ubuntu Cloud Images, Armbian, etc)
    - should be independent of how one deployed Tinkerbell itself (stack chart, individual components, etc)
- A few features:
    - validates values.yaml for common mistakes; arch must match, etc.
    - validates & handles rootDisk differences (re-invents "formatPartition()" a bit)
    - avoids re-downloading Hooks and Images that are already on disk, even if Job re-runs
    - allows easy way to use
        - custom Hooks
        - custom Kernel cmdline parameters at both the Hook & device level
            - for example `acpi=off` at Hook level and `console=ttyS0` at board level
        - custom OS images for deployment
        - reboot or kexec to finish deployment
        - different partition numbers for OS image's rootfs (some images have ESP, some have a separate `/boot`, etc)
        - control if growpart and/or ssh/user setup is done during provisioning or not
        - conversion of OS images (`qemu-to-raw-gzip` and `xz-to-gz`)
    - has a "merge" mechanism with a common way to set parameters like net gateway, UEFI, etc (also easy to override per-device)
    - default values have everything `enabled: false` thus showcase should produce nothing by default.
        - Hooks & Images can be forced `enabled: true` in values.yaml, or
            - `enabled: true` Devices automatically enable their Hook & Image
- Probably missing:
    - More validations
    - Currently pointing to my Tinkerbell Actions, which I haven't PR'ed yet
- How to use:
    - Clone it, edit the values.yaml to your liking, and deploy.

Signed-off-by: Ricardo Pardini <ricardo@pardini.net>