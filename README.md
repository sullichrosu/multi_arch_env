<p align="center">
  <img width="495" height="311" src="/images/MultiArch_Cloud.png">
</p>



**Introduction:**
========================================================================================

The multi_arch_env folder is an open-source set of shell scripts used within a Linux / UNIX system to set user environment variables in a heterogeneous or multi-architecture infrastructure (HPC cluster for example). These scripts leverage the system tool "uname" to enable separation between different architectures like Intel/AMD based x86_64, ARM/NVIDIA based aarch64 and IBM/POWER based ppc64le. Many groups are moving to heterogeneous computing to embrace new technologies and enable faster compute. These new technologies include NVIDIA Grace Hopper Superchip (aarch64) or possibly IBM POWER 10 (ppc64le). These set of tools allow groups to incorporate new technologies with our traditional Intel/AMD based x86_64 based hardware. These shell scripts help separate binaries compiled to run on these separate architectures. Reminder that you will need to compile the binaries and put them into the separated paths for each of the architectures you have within your infrastructure. The global files will also call users specific files for each architecture within the users home directory allow them to maintain their own separation for tools like python using "conda" environments.



**Dependencies:**
========================================================================================

1) UNIX / Linux Shell Environments
2) Compiled binaries for each architecture needed to support your infrastructure.



**Installation:**
========================================================================================

1) Extract the downloaded zip file or git clone the repository.
```bash
git clone https://github.com/sullichrosu/multi_arch_env
```
```bash
unzip multi_arch_env.zip
```
2) Move the folder to the path you plan to have users source long term. Generally a NFS based path like the example below where the folder /nfs is mounted to the infrastructure with different architecture types. These can be used locally on machines without NFS however you will need to have a copy on every machine over a central copy.
```bash
mv multi_arch_env /nfs/
```
3) Using the terminal, navigate to the path above where you have the extracted directory.
```bash
cd /nfs/multi_arch_env
```
4) Edit the INSTALLDIR variable in the top of the Makefile and set it to the path of the folder if you have install it in a different path then /nfs/multi_arch_env. You can also change the value of the INSTALLDIR var from the command line by adding the variable after the make command (example: make INSTALLDIR=/usr/local).

| Files to edit INSTALLDIR if different then above path /nfs/multi_arch_env |
| :-----------------------------------------------------------------------: |
| /nfs/multi_arch_env/Makefile |

5) Install all the scripts and setup the directories for the binaries by typing "make" in the download directory. This will create all the folders needed in the path used under INSTALLDIR and copy and update the needed files.
```bash
make
```

6) Once you are done typing "make" you will be able to have users point at the global files for their specific shell in the install directory under the etc folder. For example if the INSTALLDIR was /nfs/multi_arch_env the global run config (rc) file for bash would be "/nfs/multi_arch_env/etc/std.bashrc". Users can 

| Global file folders and files found under your INSTALLDIR folder |
| :--------------------------------------------------------------: |
| /nfs/multi_arch_env/etc/std.bashrc |
| /nfs/multi_arch_env/etc/std.cshrc |
| /nfs/multi_arch_env/etc/std.zshrc |

7) Compile binaries for each architecture needed within your infrastructure. These binaries need to be installed into the separate paths set in each of the global files above based on the architecture. The folders below will be found under your INSTALLDIR if different then /nfs/multi_arch_env.


| Compile Binaries | Architecture | Path |
| ---------------- | ------------ | :--: |
| Intel / AMD Binaries | x86_64 | /nfs/multi_arch_env/x86_64/bin |
| NVIDIA Arm Neoverse V2 | aarch64 | /nfs/multi_arch_env/aarch64/bin |
| IBM POWER 10 | ppc64le | /nfs/multi_arch_env/ppc64le/bin |


<br>

<p align="left">
  <img width="326" height="245" src="/images/MultiArch_Prompt.png">
</p>


**Using Files / CLI**
========================================================================================

1) You can update the users dot files to point at the global shell files installed in the local or global path directory using the commands below based on shell being used. The $USER is the user account login and matches the users environment variable so they can run the command below to enable the global settings. The files below will be found under your INSTALLDIR if different then /nfs/multi_arch_env.  
	
| Files to add source of global ($USER is the user account login)|
| :------------------------------------------------------------: |
| echo "source /nfs/multi_arch_env/etc/std.cshrc" >> /nfs/home/$USER/.cshrc |
| echo "source /nfs/multi_arch_env/etc/std.bashrc" >> /nfs/home/$USER/.bashrc |
| echo "source /nfs/multi_arch_env/etc/std.zshrc" >> /nfs/home/$USER/.zshrc |


2) Using the Command Line Interface (CLI) you can source the global file using the following command examples. You will need to change the path to the global files directory if different then /nfs/multi_arch_env. The files below will be found under your INSTALLDIR if different then /nfs/multi_arch_env.
```bash
source /nfs/multi_arch_env/etc/std.bashrc
```
<p align="left">
  <img width="609" height="280" src="/images/MultiArch_BASH.png">
</p>

```bash
source /nfs/multi_arch_env/etc/std.cshrc
```
<p align="left">
  <img width="609" height="276" src="/images/MultiArch_CSH.png">
</p>

```bash
source /nfs/multi_arch_env/etc/std.zshrc
```


3) There is a SKEL folder under the etc folder downloaded with standard dot files to support sourcing of the these global files. If you plan to use the files under the SKEL folder you will need to edit the following and change the path to source the global files directory if different then /nfs/multi_arch_env. The SKEL files can be used as default files for new users when accounts are created. The files below will be found under your INSTALLDIR if different then /nfs/multi_arch_env.

| Global SKEL file to edit global path |
| :---------------------------: |
| /nfs/multi_arch_env/etc/skel/.bashrc |
| /nfs/multi_arch_env/etc/skel/.cshrc |
| /nfs/multi_arch_env/etc/skel/.zshrc |


4) The global files will also call user specific machine dependent dot files if needed within the users home directory. This allow users to maintain their own separation for tools like python using "conda" environments.

| Shell | User Home Directory Files |
| ----- | :-------------------------------: |
| BASH   | $HOME/.bashrc |
|        | $HOME/.bashrc.x86_64 |
|        | $HOME/.bashrc.aarch64 |
|        | $HOME/.bashrc.ppc64le |
| (T)CSH | $HOME/.cshrc |
|        | $HOME/.cshrc.x86_64 |
|        | $HOME/.cshrc.aarch64 |
|        | $HOME/.cshrc.ppc64le |
| ZSH    | $HOME/.zshrc |
|        | $HOME/.zshrc.x86_64 |
|        | $HOME/.zshrc.aarch64 |
|        | $HOME/.zshrc.ppc64le |


----------------------------------------------------------------------------------------------------------------------
