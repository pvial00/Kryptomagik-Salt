nsupdate_script:
    - file.managed:
        - user: root
        - group: root
        - source: salt://hyper/nsupdate.py
        - mode: 750
