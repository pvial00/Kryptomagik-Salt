import sys, subprocess

def getip(iface):
    ip_cmd = ['ip', 'a']
    out = subprocess.check_output(ip_cmd)
    lines = out.split('\n')
    c = 0
    for line in lines:
        if iface in line:
            ip = line.split()[1].split('/')[0]
        c += 1
    return ip

def gennsupdate(hostname, server, zone, iface, secs, key):
    ip = getip(iface)
    f = open("nsupdate.txt", "w")
    srvstr = "server " + server + "\n"
    zonestr = "zone " + zone + "\n"
    udstr = "update delete " + hostname + "." + zone + "." + " A" + "\n"
    uastr = "update add " + hostname + "." + zone + ". " + str(secs) + " A " + ip + "\n"
    sendstr = "send\n"
    f.write(srvstr)
    f.write(zonestr)
    f.write(udstr)
    f.write(uastr)
    f.write(sendstr)
    f.close()
    nsupdate_cmd = ['nsupdate', '-k', key, 'nsupdate.txt']
    out = subprocess.check_output(nsupdate_cmd)
    print(out)

hostname = sys.argv[1]
key = "virt.key"
server = "10.6.0.1"
zone = "krypto.knet"
secs = 600
iface = "ens3"
gennsupdate(sys.argv[1], server, zone, iface, secs, key)
