security_dependencies_install:
    pkg.installed:
        - order: 1
        - pkgs:
            - sudo

/etc/sudoers:
    file.managed:
        - order: 2
        - user: root
        - group: root
        - mode: 440
        - source: salt://security/sudoers

sudo:
    group.present:
        - order: 3
        - members:
            - n
