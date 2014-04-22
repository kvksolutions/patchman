patchman
========
Proof of Concept Chef cookbook to impliment a patch management strategy for Linux systems.

Currently built to work with Debian and Redhat family of Linux OS's Only.

CentOS
----------------
Utilizes cron-yum to determine exclusion list. It then uses cron to run at set time based on environment.


Ubuntu
----------------
Utilizes unattented-upgrades to determine type of patches, packages for exclusion lists and whether to reboot if needed. It then utilizes cron to run based on environment.
