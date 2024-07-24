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
# Options for different programs being run below. 
#
INSTALLDIR=/nfs/multi_arch_env
SEDDIR=$(subst /,\/,$(INSTALLDIR))

#
# Directory List For Checking or Creating
#
DIRECTORIES=etc bin aarch64 aarch64/bin aarch64/lib64 aarch64/include x86_64 x86_64/bin x86_64/lib64 x86_64/include ppc64le ppc64le/bin ppc64le/lib64 ppc64le/include
RMDIRS=etc bin aarch64 x86_64 ppc64le

all: mkdirs
	@echo ""
	@echo "\tUpdating the Directory Path to $(INSTALLDIR):"
	@cp -prf src/* $(INSTALLDIR)/etc/
	@sed -i -e "s/\/nfs\/multi_arch_env/$(SEDDIR)/g" $(INSTALLDIR)/etc/std.bashrc 
	@sed -i -e "s/\/nfs\/multi_arch_env/$(SEDDIR)/g" $(INSTALLDIR)/etc/skel/.bashrc 
	@echo "\t\tUpdating: $(INSTALLDIR)/etc/std.bashrc"
	@echo "\t\tUpdating: $(INSTALLDIR)/etc/skel/.bashrc"
	@sed -i -e "s/\/nfs\/multi_arch_env/$(SEDDIR)/g" $(INSTALLDIR)/etc/std.cshrc
	@sed -i -e "s/\/nfs\/multi_arch_env/$(SEDDIR)/g" $(INSTALLDIR)/etc/skel/.cshrc
	@echo "\t\tUpdating: $(INSTALLDIR)/etc/std.cshrc"
	@echo "\t\tUpdating: $(INSTALLDIR)/etc/skel/.cshrc"
	@sed -i -e "s/\/nfs\/multi_arch_env/$(SEDDIR)/g" $(INSTALLDIR)/etc/std.zshrc
	@sed -i -e "s/\/nfs\/multi_arch_env/$(SEDDIR)/g" $(INSTALLDIR)/etc/skel/.zshrc
	@echo "\t\tUpdating: $(INSTALLDIR)/etc/std.zshrc"
	@echo "\t\tUpdating: $(INSTALLDIR)/etc/skel/.zshrc"
	@echo ""

mkdirs:
	@echo ""
	@echo "\tChecking Directories:"
	@for dir in $(DIRECTORIES); do \
	! test -d $(INSTALLDIR)/$${dir} && echo "\t\tMaking: $(INSTALLDIR)/$${dir}";\
	test -d $(INSTALLDIR)/$${dir} || mkdir -p $(INSTALLDIR)/$${dir};\
	done;

clean: 
	@echo ""
	@echo "\tRemoving Created folders"
	@for dir in $(RMDIRS); do \
	/bin/rm -r $(INSTALLDIR)/$${dir} && echo "\t\tRemoving: $(INSTALLDIR)/$${dir}" ;\
	done;
	@/bin/rm -r $(INSTALLDIR) && echo "\t\tRemoving: $(INSTALLDIR)"
	@echo ""
