# multi_arch_env Makefile
# Date: July 2024
#
# Options for different programs being run below. 
DIRPATH=/nfs/multi_arch_env
SEDDIR=$(subst /,\/,$(DIRPATH))

#
# Directory List For Checking or Creating
#
DIRECTORIES=etc bin aarch64 aarch64/bin aarch64/lib64 aarch64/include x86_64 x86_64/bin x86_64/lib64 x86_64/include ppc64le ppc64le/bin ppc64le/lib64 ppc64le/include
RMDIRS=etc bin aarch64 x86_64 ppc64le

all: mkdirs

install: mkdirs
	@echo ""
	@echo "\tUpdating the Directory Path to $(DIRPATH):"
	@cp -prf src/* $(DIRPATH)/etc/
	@sed -i -e "s/\/nfs\/multi_arch_env/$(SEDDIR)/g" $(DIRPATH)/etc/std.bashrc 
	@sed -i -e "s/\/nfs\/multi_arch_env/$(SEDDIR)/g" $(DIRPATH)/etc/skel/.bashrc 
	@echo "\t\tUpdating: $(DIRPATH)/etc/std.bashrc"
	@echo "\t\tUpdating: $(DIRPATH)/etc/skel/.bashrc"
	@sed -i -e "s/\/nfs\/multi_arch_env/$(SEDDIR)/g" $(DIRPATH)/etc/std.cshrc
	@sed -i -e "s/\/nfs\/multi_arch_env/$(SEDDIR)/g" $(DIRPATH)/etc/skel/.cshrc
	@echo "\t\tUpdating: $(DIRPATH)/etc/std.cshrc"
	@echo "\t\tUpdating: $(DIRPATH)/etc/skel/.cshrc"
	@sed -i -e "s/\/nfs\/multi_arch_env/$(SEDDIR)/g" $(DIRPATH)/etc/std.zshrc
	@sed -i -e "s/\/nfs\/multi_arch_env/$(SEDDIR)/g" $(DIRPATH)/etc/skel/.zshrc
	@echo "\t\tUpdating: $(DIRPATH)/etc/std.zshrc"
	@echo "\t\tUpdating: $(DIRPATH)/etc/skel/.zshrc"
	@echo ""

mkdirs:
	@echo ""
	@echo "\tChecking Directories:"
	@for dir in $(DIRECTORIES); do \
	! test -d $(DIRPATH)/$${dir} && echo "\t\tMaking: $(DIRPATH)/$${dir}";\
	test -d $(DIRPATH)/$${dir} || mkdir -p $(DIRPATH)/$${dir};\
	done;
	@echo ""

vars:
	@echo ""
	@echo "\tDefault Variables and Current Values:"
	@echo "\t\tDIRPATH       =  $(DIRPATH)"
	@echo "\t\tSEDDIR        =  $(SEDDIR)"
	@echo ""

clean: 
	@echo ""
	@echo "\tRemoving Created folders"
	@for dir in $(RMDIRS); do \
	/bin/rm -r $(DIRPATH)/$${dir} && echo "\t\tRemoving: $(DIRPATH)/$${dir}" ;\
	done;
	@/bin/rm -r $(DIRPATH) && echo "\t\tRemoving: $(DIRPATH)"
	@echo ""
