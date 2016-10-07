#!/bin/bash

__create_user() {
# Create a user to SSH into as.
useradd user
SSH_USERPASS=newpass
echo -e "$SSH_USERPASS\n$SSH_USERPASS" | (passwd --stdin user)
echo ssh user password: $SSH_USERPASS
}

__install_hdp_demo() {
  export host_count=1  #set to number of nodes in your cluster (including Ambari-server node)
  export hdp_ver=2.5
  export install_nifidemo=true
  #point nifi_flow to a gist with your the flow.xml you wish to deploy
  export nifi_flow="https://gist.githubusercontent.com/abajwa-hw/3a3e2b2d9fb239043a38d204c94e609f/raw"
  #run script below to deploy
  curl -sSL https://gist.github.com/abajwa-hw/3f2e211d252bba6cad6a6735f78a4a93/raw | bash
}
# Call all functions
__create_user
__install_hdp_demo
