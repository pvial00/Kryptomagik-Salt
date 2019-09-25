dependencies_install:
    pkg.installed:
        - pkgs:
            - libbz2-dev
            - libdivsufsort-dev
            - dieharder
            - ent
            - build-essential
            - gdb

/magik:
    file.directory:
        - user: root
        - group: root
        - mode: 755
        - makedirs: True

NISTSP80090B:
    git.latest:
        - name: https://github.com/usnistgov/SP800-90B_EntropyAssessment
        - target: /magik/nistsp80090b
        - user: root

makeNISTSP80090B:
    cmd.run:
        - name: make
        - cwd: /magik/nistsp80090b/cpp
