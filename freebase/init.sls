freebsd_dependencies_install:
    pkg.installed:
        - pkgs:
            - sudo

/usr/local/etc/sudoers:
    file.managed:
        - owner: root
        - group: wheel
        - mode: 440
        - source: salt://freebase/sudoers
