logman create counter server_cpu -f bincirc
logman update counter server_cpu -cf metric\metric_server_cpu.txt
logman update counter server_cpu -si 15 -v mmddhhmm

logman create counter server_ram -f bincirc
logman update counter server_ram -cf metric\metric_server_ram.txt
logman update counter server_ram -si 15 -v mmddhhmm

logman create counter server_net -f bincirc
logman update counter server_net -cf metric\metric_server_net.txt
logman update counter server_net -si 15 -v mmddhhmm

logman create counter server_io -f bincirc
logman update counter server_io -cf metric\metric_server_io.txt
logman update counter server_io -si 15 -v mmddhhmm

logman create counter server_process -f bincirc
logman update counter server_process -cf metric\metric_server_process.txt
logman update counter server_process -si 15 -v mmddhhmm

logman create counter was -f bincirc
logman update counter was -cf metric\metric_was.txt
logman update counter was -si 15 -v mmddhhmm
                                        
logman create counter iis -f bincirc
logman update counter iis -cf metric\metric_iis.txt
logman update counter iis -si 15 -v mmddhhmm

logman create counter httpsys -f bincirc
logman update counter httpsys -cf metric\metric_httpsys.txt
logman update counter httpsys -si 15 -v mmddhhmm

logman create counter w3wp -f bincirc
logman update counter w3wp -cf metric\metric_w3wp.txt
logman update counter w3wp -si 15 -v mmddhhmm

logman create counter w3svc -f bincirc
logman update counter w3svc -cf metric\metric_w3svc.txt
logman update counter w3svc -si 15 -v mmddhhmm

logman create counter aspnet -f bincirc
logman update counter aspnet -cf metric\metric_aspnet.txt
logman update counter aspnet -si 15 -v mmddhhmm

logman create counter aspnet_latency -f bincirc
logman update counter aspnet_latency -cf metric\metric_aspnet_latency.txt
logman update counter aspnet_latency -si 15 -v mmddhhmm