# Technical Test
## Task
a) Launch 3 separate linux nodes using the tool/distro of your choice  
* 2 x application nodes
* 1 x web node

b) Using a configuration management tool (contractors MUST use Chef)  
* Deploy the sample application to the application nodes
* Install Nginx on the web node and balance requests to the application nodes in a round-robin fashion
* Demonstrate the round-robin mechanism is working correctly

## Goal

Sending a HTTP request to the web node should return the response
> Hi there, I'm served from &lt;application node hostname&gt;!


## Usage
### Prerequisite
Installed software:
* docker-compose
* wget

### Execution
```bash
wget -O- https://raw.githubusercontent.com/dunse/two-tier-web-app/master/run.sh | bash
```
> To rebuild, run "docker-compose build" in the current working directory

### Validation
Run more than once:  
```bash
wget -q -O- http://localhost:8084/
```
You will see the &lt;application node hostname&gt; change between runs.
