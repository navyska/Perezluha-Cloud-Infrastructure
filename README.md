# Perezluha-Cloud-Infrastructure

## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

[Perezluha-Cloud-Infrastructure](https://github.com/navyska/Perezluha-Cloud-Infrastructure/tree/master/Diagrams)

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the filebeat-playbook.yml file may be used to install only certain pieces of it, such as Filebeat.

  [Filebeat Playbook](https://github.com/navyska/Perezluha-Cloud-Infrastructure/tree/master/Ansible)

This document contains the following details:
- Description of the Topologu
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build


### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly available, in addition to restricting access to the network.
- _What aspect of security do load balancers protect? **Load balancers help to eliminate single points of failure, reduce the attack surface, and make it harder to exhaust resources and saturate links.** 
- _What is the advantage of a jump box?_ **A jumpbox is a secure computer that admins first connect to before launching any adminstrative task or is used as an origination point to connect to other servers or untrusted environments. It is basically a secure admin workstations.**

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the files and system logs.

- _What does Filebeat watch for?_ **Filebeat monitors the log files or locations that you specify, collects log events, and forwards them either to Elasticsearch or Logstash for indexing.**
- _What does Metricbeat record?_ **Metricbeat collects machine metrics, such as uptime.**

The configuration details of each machine may be found below.
_Note: Use the [Markdown Table Generator](http://www.tablesgenerator.com/markdown_tables) to add/remove values from the table_.

| Name       | Function   | IP Address | Operating Syste |
|------------|------------|------------|-----------------|
| Jump Box   | Gateway    | 10.0.0.4   | Linux           |
| DVWA       | Pentesting | 10.0.0.6   | Linux           |
| Elk Server | Monitoring | 10.0.0.7   | Linux           |

### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the JumpBox machine can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses:
- **76.99.18.212**

Machines within the network can only be accessed by SSH.
- _Which machine did you allow to access your ELK VM? What was its IP address?_ **Jumpbox / 10.0.0.4**

A summary of the access policies in place can be found in the table below.

| Name     | Publicly Accessible | Allowed IP Addresses |
|----------|---------------------|----------------------|
| Jump Box | Yes                 | 76.99.18.212         |
| DVWA     | No                  | 10.0.0.4             |
| ELK      | Yes                 | 10.0.0.4/76.99.18.212|

### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because...
- _What is the main advantage of automating configuration with Ansible?_ **Ansible is free, simple to use, powerful, flexible, agentless, and efficient. It allows you to streamline installation of commands or files to a VM.**

The playbook implements the following tasks:
- **Add ELK server IP to ansible-configuration.yml**
- **Create new playbook titled install-elk.yml with correct parameters (this will install the following: docker.io, python-pip, docker, downloads docker container sebp/elk, configures ports to 5601:5601, 9200:9200, and 5044:5044)**
- **Run playbook you just created**
- **SSH to ELK server**
- **Run the following command to ensure ELK is loaded: sudo docker ps**
- **Add rule to Network Security Group to allow access from your public IP to ELK server.**

The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.

[Succesful Docker](https://github.com/navyska/Perezluha-Cloud-Infrastructure/blob/master/ELK.png)

[Succesful Webpage](https://github.com/navyska/Perezluha-Cloud-Infrastructure/blob/master/Module%20Start.png)

### Target Machines & Beats
This ELK server is configured to monitor the following machines:
- _List the IP addresses of the machines you are monitoring_ **(10.0.0.6)**

We have installed the following Beats on these machines:
- _Specify which Beats you successfully installed_ **Metricbeat**

These Beats allow us to collect the following information from each machine:
- **Filebeat monitors the log files or locations that you specify, collects log events, and forwards them to either Elasticsearch or Logstash for indexing. Filebeat can be used to monitor user login successes or failures or changes that have been made to the system.**
- **Metricbeat periodically collects metrics from the operating system and from services running on the server. Metricbeat can show statistics on CPU usage, memory, and networks.** 

### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
- **Copy the source file to destination file.**
- **Update the configuration playbook file to include the IP address of the ELK server.**
- **Run the playbook, and navigate to the ELK server to check that the installation worked as expected by running sudo docker ps.**

_Answer the following questions to fill in the blanks:_
- _Which file is the playbook? Where do you copy it?_
- **metricbeat.yml; this is copied to /etc/metricbeat/metricbeat.yml on the ELK server**

- _Which file do you update to make Ansible run the playbook on a specific machine?_ **The ansible-configuration file is updated.** 
- _How do I specify which machine to install the ELK server on versus which to install Filebeat on?_ **In the configuration file you specify [elkservers] and the ELK server IP address. Filebeat points to the [webservers] IP address.**

- _Which URL do you navigate to in order to check that the ELK server is running?_ **http://[public IP of ELK server]:5601

_As a **Bonus**, provide the specific commands the user will need to run to download the playbook, update the files, etc._
