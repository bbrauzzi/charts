[main]
encoding = utf-8
version = 1.0.0
serverAddress = http://127.0.0.1
language = en-US
lang = fr-FR,en-CA,en-US
tmpPath={{ .Values.persistence.tmpPath }}
tmpUrl = http://localhost:8080/temp/
dataPath = /usr/com/zoo-project
cacheDir ={{ .Values.persistence.tmpPath }}
templatesPath = /var/www/

[identification]
title = The ZOO-Project with DRU support for CWL deployment through OGC API - Processes - Part 2: Deploy, Replace, Undeploy
abstract = Developement version of the ZOO-Project with support for:<br><ul><li>OGC API - Processes: Part1: Core standard</li><li>OGC API - Processes - Part 2: Deploy, Replace, Undeploy draft</li></ul><br> See <a target="_blank" href="http://www.zoo-project.org">http://zoo-project.org</a> for more informations. <br/>You can access the current <a href="https://docs.ogc.org/DRAFTS/20-044.html" target="_blank">OGC API - Processes - Part 2: Deploy, Replace, Undeploy draft specification</a>.
fees = None
accessConstraints = none
keywords = WPS,GIS,buffer

[provider]
providerName=ZOO-Project
providerSite=http://www.zoo-project.org
individualName=Gerald FENOY
positionName=Developer
role=Dev
addressDeliveryPoint=1280, avenue des Platanes
addressCity=Lattes
addressAdministrativeArea=False
addressPostalCode=34970
addressCountry=fr
addressElectronicMailAddress=gerald.fenoy@geolabs.fr
phoneVoice=False
phoneFacsimile=False


[env]
PYTHONPATH=/usr/miniconda3/envs/ades-dev/lib/python3.8/site-packages
CONTEXT_DOCUMENT_ROOT=/usr/lib/cgi-bin/

[database]
dbname=zoo
port=5432
user=zoo
password=zoo
host={{ .Release.Name }}-postgresql
type=PG
schema=public

[metadb]
dbname=zoo
port=5432
user=zoo
password=zoo
host={{ .Release.Name }}-postgresql
type=PG
schema=public

[security]
attributes=Authorization,Cookie,User-Agent
hosts=*

[cookiecutter]
configurationFile={{ .Values.persistence.tmpPath }}/cookiecutter_config.yaml
templatesPath={{ .Values.persistence.tmpPath }}/cookiecutter-templates
templateUrl={{ .Values.cookiecutter.templateUrl }}
templateBranch={{ .Values.cookiecutter.templateBranch }}


[servicesNamespace]
path= {{ .Values.persistence.servicesNamespacePath }}
deploy_service_provider=DeployProcess
undeploy_service_provider=UndeployProcess
required_files=securityOut.zcfg,security_service.py,DeployProcess.zcfg,DeployProcess.py,UndeployProcess.zcfg,UndeployProcess.py,deploy_util.py

[rabbitmq]
host={{ .Release.Name }}-rabbitmq
port=5672
user=guest
passwd=guest
exchange=amq.direct
routingkey=zoo
queue=zoo_service_queue

[server]
async_worker=20

[HPC]
preview_max_pixels=820800
preview_max_features=100000
preview_conf=hpc-config-2
fullres_conf=hpc-config-1

[hpc-config-1]
ssh_host=anvil.rcac.purdue.edu
ssh_port=22
ssh_user=x-gfenoy
ssh_key=/var/www/.ssh/id_rsa.pub
essh_password=
remote_data_path=/home/x-gfenoy/wps_executions/data
remote_persitent_data_path=/home/x-gfenoy/wps_executions/datap
remote_work_path=/home/x-gfenoy/wps_executions/script
jobscript_header=/usr/lib/cgi-bin/config-hpc1_header.txt
jobscript_body=/usr/lib/cgi-bin/config-hpc1_body.txt
sbatch_substr=Submitted batch job
billing_nb_cpu=1
remote_command_opt=Account%30,AdminComment%30,AllocCPUS%30,AllocNodes%30,AllocTRES%30,AssocID%30,AveCPU%30,AveCPUFreq%30,AveDiskRead%30,AveDiskWrite%30,AvePages%30,AveRSS%30,AveVMSize%30,BlockID%30,Cluster%30,Comment%30,Constraints%30,ConsumedEnergy%30,ConsumedEnergyRaw%30,Container%30,CPUTime%30,CPUTimeRAW%30,DBIndex%30,DerivedExitCode%30,Elapsed%30,ElapsedRaw%30,Eligible%30,End%30,ExitCode%30,Extra%30,FailedNode%30,Flags%30,GID%30,Group%30,JobID%30,JobIDRaw%30,JobName%30,Layout%30,Licenses%30,MaxDiskRead%30,MaxDiskReadNode%30,MaxDiskReadTask%30,MaxDiskWrite%30,MaxDiskWriteNode%30,MaxDiskWriteTask%30,MaxPages%30,MaxPagesNode%30,MaxPagesTask%30,MaxRSS%30,MaxRSSNode%30,MaxRSSTask%30,MaxVMSize%30,MaxVMSizeNode%30,MaxVMSizeTask%30,McsLabel%30,MinCPU%30,MinCPUNode%30,MinCPUTask%30,NCPUS%30,NNodes%30,NodeList%30,NTasks%30,Partition%30,Planned%30,PlannedCPU%30,PlannedCPURAW%30,Priority%30,QOS%30,QOSRAW%30,Reason%30,ReqCPUFreq%30,ReqCPUFreqGov%30,ReqCPUFreqMax%30,ReqCPUFreqMin%30,ReqCPUS%30,ReqMem%30,ReqNodes%30,ReqTRES%30,Reservation%30,ReservationId%30,Start%30,State%30,Submit%30,SubmitLine%30,Suspended%30,SystemComment%30,SystemCPU%30,Timelimit%30,TimelimitRaw%30,TotalCPU%30,TRESUsageInAve%30,TRESUsageInMax%30,TRESUsageInMaxNode%30,TRESUsageInMaxTask%30,TRESUsageInMin%30,TRESUsageInMinNode%30,TRESUsageInMinTask%30,TRESUsageInTot%30,TRESUsageOutAve%30,TRESUsageOutMax%30,TRESUsageOutMaxNode%30,TRESUsageOutMaxTask%30,TRESUsageOutMin%30,TRESUsageOutMinNode%30,TRESUsageOutMinTask%30,TRESUsageOutTot%30,UID%30,User%30,UserCPU%30,WCKey%30,WCKeyID%30,WorkDir%30

[hpc-config-2]
ssh_host=anvil.rcac.purdue.edu
ssh_port=22
ssh_user=x-gfenoy
ssh_key=/var/www/.ssh/id_rsa.pub
essh_password=
remote_data_path=/home/x-gfenoy/wps_executions/data
remote_persitent_data_path=/home/x-gfenoy/wps_executions/datap
remote_work_path=/home/x-gfenoy/wps_executions/script
jobscript_header=/usr/lib/cgi-bin/config-hpc1_header.txt
jobscript_body=/usr/lib/cgi-bin/config-hpc1_body.txt
sbatch_substr=Submitted batch job
billing_nb_cpu=1
remote_command_opt=Account%30,AdminComment%30,AllocCPUS%30,AllocNodes%30,AllocTRES%30,AssocID%30,AveCPU%30,AveCPUFreq%30,AveDiskRead%30,AveDiskWrite%30,AvePages%30,AveRSS%30,AveVMSize%30,BlockID%30,Cluster%30,Comment%30,Constraints%30,ConsumedEnergy%30,ConsumedEnergyRaw%30,Container%30,CPUTime%30,CPUTimeRAW%30,DBIndex%30,DerivedExitCode%30,Elapsed%30,ElapsedRaw%30,Eligible%30,End%30,ExitCode%30,Extra%30,FailedNode%30,Flags%30,GID%30,Group%30,JobID%30,JobIDRaw%30,JobName%30,Layout%30,Licenses%30,MaxDiskRead%30,MaxDiskReadNode%30,MaxDiskReadTask%30,MaxDiskWrite%30,MaxDiskWriteNode%30,MaxDiskWriteTask%30,MaxPages%30,MaxPagesNode%30,MaxPagesTask%30,MaxRSS%30,MaxRSSNode%30,MaxRSSTask%30,MaxVMSize%30,MaxVMSizeNode%30,MaxVMSizeTask%30,McsLabel%30,MinCPU%30,MinCPUNode%30,MinCPUTask%30,NCPUS%30,NNodes%30,NodeList%30,NTasks%30,Partition%30,Planned%30,PlannedCPU%30,PlannedCPURAW%30,Priority%30,QOS%30,QOSRAW%30,Reason%30,ReqCPUFreq%30,ReqCPUFreqGov%30,ReqCPUFreqMax%30,ReqCPUFreqMin%30,ReqCPUS%30,ReqMem%30,ReqNodes%30,ReqTRES%30,Reservation%30,ReservationId%30,Start%30,State%30,Submit%30,SubmitLine%30,Suspended%30,SystemComment%30,SystemCPU%30,Timelimit%30,TimelimitRaw%30,TotalCPU%30,TRESUsageInAve%30,TRESUsageInMax%30,TRESUsageInMaxNode%30,TRESUsageInMaxTask%30,TRESUsageInMin%30,TRESUsageInMinNode%30,TRESUsageInMinTask%30,TRESUsageInTot%30,TRESUsageOutAve%30,TRESUsageOutMax%30,TRESUsageOutMaxNode%30,TRESUsageOutMaxTask%30,TRESUsageOutMin%30,TRESUsageOutMinNode%30,TRESUsageOutMinTask%30,TRESUsageOutTot%30,UID%30,User%30,UserCPU%30,WCKey%30,WCKeyID%30,WorkDir%30

[headers]
X-Powered-By=ZOO-Project-HPGC
Access-Control-Allow-Origin=*
Access-Control-Allow-Methods=GET,PUT,POST,DELETE
Access-Control-Allow-Headers=Content-Type,Authorization
