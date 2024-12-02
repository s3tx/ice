from nornir import InitNornir
from nornir_netmiko.tasks import netmiko_send_command
from nornir_utils.plugins.functions import print_result

nr = InitNornir(config_file="config.yaml")

data = []

def pull_info(task, command):
    hostname = task.host.name
    result = task.run(task=netmiko_send_command, command_string=command, use_textfsm=True, textfsm_template="cisco_ios_show_ip_interface_brief.textfsm", read_timeout=200)
    parsed_output = result.result
    for record in parsed_output:
        indata = {"hostname": hostname, **record}
        data.append([indata['hostname'],
                     indata['intf'],
                     indata['ipaddr'],
                     indata['status'],
                     indata['proto']
                     ])

nr.run(task=pull_info, command="show ip interface brief")

print(data)
