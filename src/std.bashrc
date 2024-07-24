#####################################################################
#
#  OSU Multi Architecture Environment System (multi_arch_env)
#                                                                   
#  Copyright 2024
#
#  Christopher M. Sullivan
#
#  College of Earth, Ocean, and Atmospheric Sciences
#  Oregon State University
#  Corvallis, OR 97331
#
#  email: chris.sullivan@oregonstate.edu
#
# This program is not free software; you can not redistribute it
# and/or modify it at all.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
#
#####################################################################

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

