dependencies_install:
    pkg.installed:
        - order: 1
        - pkgs:
            - libssl-dev
            - libbz2-dev
            - libdivsufsort-dev
            - dieharder
            - ent
            - build-essential
            - gdb
            - libgmp-dev
            - libmpfr-dev
            - libmpc-dev
            - vim
            - git

/magik:
    file.directory:
        - user: root
        - group: root
        - mode: 755
        - makedirs: True
        - order: 2

NISTSP80090B:
    git.latest:
        - name: https://github.com/usnistgov/SP800-90B_EntropyAssessment
        - target: /magik/nistsp80090b
        - user: root
        - order: 3

makeNISTSP80090B:
    cmd.run:
        - name: make
        - cwd: /magik/nistsp80090b/cpp
        - order: 4

