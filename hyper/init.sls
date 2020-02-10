dependencies_install:
    pkg.installed:
        - pkgs:
            - qemu-kvm
            - libvirt-clients
            - libvirt-daemon-system
            - bridge-utils
            - nfs-common
            - salt-minion
            - dnsutils

nsupdate_script:
    - file.managed:
        - user: root
        - group: root
        - source: salt://hyper/nsupdate.py
        - mode: 750


