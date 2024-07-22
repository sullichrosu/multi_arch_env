#
#  This is the global .bashrc file normally sourced from the users .bashrc
#
export DIRPATH=/nfs/multi_arch_env

# Get arch and source file
export ARCH=`uname -i`

#
# Now, source the machine-dependent file
#
source $DIRPATH/etc/std.alias_all.sh				# Source Global alias file
if [ -n "$ARCH" ]; then
        source $DIRPATH/etc/std.bashrc.$ARCH			# Source Global machine-dependent file
        if [ -f "$HOME/.bashrc.$ARCH" ]; then       		#
                source $HOME/.bashrc.$ARCH           		# User home directory machine-dependent shell file
        fi							#
fi

#
#Finalize the shell
#

