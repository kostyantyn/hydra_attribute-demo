# hydra attribute (demo website)

## Installation
1. Install [VirtualBox](https://www.virtualbox.org/wiki/Downloads)
2. Install [Vagrant](http://www.vagrantup.com/downloads.html)
3. Clone project ```git clone git@github.com:kostyantyn/hydra_attribute-demo.git```
4. Run bash script ```cd hydra_attribute-demo && ./chef/vagrant_bootstrap.sh```.
   Notice, this script might ask you to enter root password.
   This is a **Vagrant** requirement to export NFS share folder.
   This command can take a while so be patient.
5. Open [http://localhost:8080](http://localhost:8080) in your browser.