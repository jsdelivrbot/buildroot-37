#############################################################
#
# MultiBench
#
#############################################################
EEMBC_MULTIBENCH_VERSION = master
EEMBC_MULTIBENCH_SITE = git@gitsnps.internal.synopsys.com:arc_oss/eembc_multibench.git
# EEMBC_MULTIBENCH_SITE = https://gitsnps.internal.synopsys.com/abrodkin/eembc_multibench/repository
# EEMBC_MULTIBENCH_SOURCE = archive.tar.gz
EEMBC_MULTIBENCH_SITE_METHOD = git
# EEMBC_MULTIBENCH_DL_OPTS = '--header "Private-Token: "'
# MULTIBENCH_INSTALL_STAGING = YES
EEMBC_MULTIBENCH_DEPENDENCIES = expect
define EEMBC_MULTIBENCH_BUILD_CMDS
    $(MAKE) -C $(@D) build TARGET=linux TOOLCHAIN=arc_linux TOOLS=$(HOST_DIR)/usr/
endef
# define MULTIBENCH_INSTALL_STAGING_CMDS
#     $(INSTALL) -D -m 0755 $(@D)/libfoo.a $(STAGING_DIR)/usr/lib/libfoo.a
#     $(INSTALL) -D -m 0644 $(@D)/foo.h $(STAGING_DIR)/usr/include/foo.h
#     $(INSTALL) -D -m 0755 $(@D)/libfoo.so* $(STAGING_DIR)/usr/lib
# endef
define EEMBC_MULTIBENCH_INSTALL_TARGET_CMDS
	-mkdir -m 0755 $(TARGET_DIR)/root/multibench/
	cp -r $(@D)/builds/linux/bin/ $(TARGET_DIR)/root/multibench/
	cp -r $(@D)/builds/linux/data/ $(TARGET_DIR)/root/multibench/
	cp $(@D)/multibench.sh $(TARGET_DIR)/root/multibench/bin/
endef
$(eval $(generic-package))
