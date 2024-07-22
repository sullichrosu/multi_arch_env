#
#  This is the global .cshrc file normally sourced from the users .cshrc
#
set DIRPATH = "/nfs/multi_arch_env"

# Get arch of current machine
set ARCH = "`uname -i`"

#
# Now, source the machine-dependent file
#
if (${?ARCH}) then
        source ${DIRPATH}/etc/std.cshrc.${ARCH}			# Source Global machine-dependent file
        if (-f $HOME/.cshrc.${ARCH}) then       		# 
                source $HOME/.cshrc.${ARCH}			# User home directory machine-dependent shell file
        endif							#
endif

#
#Finalize the shell and source any other files
#

