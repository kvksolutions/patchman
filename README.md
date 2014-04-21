patchman
========
Proof of Concept Chef cookbook to impliment a patch management strategy for Linux systems.

Currently built to work with Debian and Redhat family of Linux OS's Only.


Ubuntu
----------------
Utilizes unattented-upgrades to determine type of patches, packages for exclusion lists and whether to reboot if needed. It then utilizes cron to run based on environment.
