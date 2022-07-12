#!../../bin/linux-x86_64/IC101App


epicsEnvSet("ENGINEER",  "J. Arzate")
epicsEnvSet("LOCATION", "XF28ID2")

epicsEnvSet("PREFIX",         "TEST")
epicsEnvSet("DEVICE",         "-IC101:")
epicsEnvSet("PORT",      "IC101")

epicsEnvSet("EPICS_CA_ADDR_LIST", "127.0.0.255")
epicsEnvSet("EPICS_CA_ADDR_LIST", "127.0.0.1")
epicsEnvSet("EPICS_CA_AUTO_ADDR_LIST", "NO")
# epicsEnvSet("EPICS_CA_ADDR_LIST", "127.0.0.255")
# epicsEnvSet("EPICS_CAS_ADDR_LIST", "127.0.0.255")
# epicsEnvSet("EPICS_CAS_BEACON_AUTO_ADDR_LIST", "NO")
# epicsEnvSet("EPICS_CAS_BEACON_ADDR_LIST", "127.0.0.255")
# epicsEnvSet("EPICS_CAS_INTF_ADDR_LIST", "127.0.0.1")


# export epicsEnvSet("EPICS_CA_ADDR_LIST", "127.0.0.1")

< envPaths

## configuration for stream
epicsEnvSet ("STREAM_PROTOCOL_PATH", "../../IC101App/src")

## Register all support components
dbLoadDatabase("../../dbd/IC101App.dbd", 0, 0)
IC101App_registerRecordDeviceDriver(pdbbase) 

# Configure IP Port connection via telnet to machine
# drvAsynIPPortConfigure("$(PORT)", "192.168.127.254:443", 0, 0, 0)
drvAsynIPPortConfigure("$(PORT)", "192.168.127.254:4001", 0, 0, 0)

asynOctetSetInputEos("$(PORT)",0,"\r\n")
asynOctetSetOutputEos("$(PORT)",0,"\n")
#asynSetOption ("$(PORT)", 0, "baud", "115200")
#asynSetOption ("$(PORT)", 0, "bits", "8")
#asynSetOption ("$(PORT)", 0, "parity", "none")
#asynSetOption ("$(PORT)", 0, "stop", "1")
#asynSetOption ("$(PORT)", 0, "clocal", "Y")
#asynSetOption ("$(PORT)", 0, "crtscts", "N")

## dbLoadDatabase("../../db/IC101.db", "P=$(PREFIX), R=$(DEVICE), PORT=$(PORT), ADDR=0, OMAX=0, IMAX=0")

## Load record instances
dbLoadRecords("../../db/IC101.db", "P=$(PREFIX), R=$(DEVICE), PORT=$(PORT), ADDR=2, OMAX=0, IMAX=0")
dbLoadRecords("$(EPICS_BASE)/db/asynRecord.db",  "P=$(PREFIX), R=$(DEVICE), PORT=$(PORT), ADDR=2, OMAX=0, IMAX=0")

# dbLoadRecords("$(IOCSTATS)/db/iocAdminSoft.db", "IOC=$(PREFIX)$(DEVICE), PORT=$(PORT), ADDR = 0, OMAX=0, IMAX = 0")

iocInit()

#var streamDebug 1 

