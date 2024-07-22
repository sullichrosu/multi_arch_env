#
#  This is the global .zshrc file normally sourced from the users .zshrc
#
export DIRPATH=/nfs/multi_arch_env

# Get arch and source file
export ARCH=`uname -i`

#
# Now, source the machine-dependent file
#
if [ -n "$ARCH" ]; then
        source $DIRPATH/etc/std.zshrc.$ARCH			# Source Global machine-dependent file
        if [ -f "$HOME/.zshrc.$ARCH" ]; then    		# 
                source $HOME/.zshrc.$ARCH       		# User home directory machine-dependent shell file 
        fi							#
fi

#
#Finalize the shell
#

