#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Environment
MKDIR=mkdir
CP=cp
GREP=grep
NM=nm
CCADMIN=CCadmin
RANLIB=ranlib
CC=arm-none-eabi-gcc
CCC=g++
CXX=g++
FC=gfortran
AS=as

# Macros
CND_PLATFORM=GNU-Linux
CND_DLIB_EXT=so
CND_CONF=Release
CND_DISTDIR=dist
CND_BUILDDIR=build

# Include project Makefile
include Makefile

# Object Directory
OBJECTDIR=${CND_BUILDDIR}/${CND_CONF}/${CND_PLATFORM}

# Object Files
OBJECTFILES= \
	${OBJECTDIR}/ccu_control.o \
	${OBJECTDIR}/diskio.o \
	${OBJECTDIR}/display_control.o \
	${OBJECTDIR}/ff.o \
	${OBJECTDIR}/ffunicode.o \
	${OBJECTDIR}/fnirsi_1013d_firmware_backup.o \
	${OBJECTDIR}/font_5.o \
	${OBJECTDIR}/font_7.o \
	${OBJECTDIR}/fwb_display_lib.o \
	${OBJECTDIR}/fwb_fpga_control.o \
	${OBJECTDIR}/fwb_spi_control.o \
	${OBJECTDIR}/fwb_touchpanel.o \
	${OBJECTDIR}/fwb_usb_interface.o \
	${OBJECTDIR}/fwb_variables.o \
	${OBJECTDIR}/icons.o \
	${OBJECTDIR}/interrupt.o \
	${OBJECTDIR}/mass_storage_class.o \
	${OBJECTDIR}/memcmp.o \
	${OBJECTDIR}/memcpy.o \
	${OBJECTDIR}/memmove.o \
	${OBJECTDIR}/memset.o \
	${OBJECTDIR}/sd_card_interface.o \
	${OBJECTDIR}/sin_cos_math.o \
	${OBJECTDIR}/start.o \
	${OBJECTDIR}/timer.o


# C Compiler Flags
CFLAGS=-Wall -Wno-write-strings -Wno-char-subscripts -fno-stack-protector -DNO_STDLIB=1 -O3 -mcpu=cortex-m3 -mthumb

# CC Compiler Flags
CCFLAGS=
CXXFLAGS=

# Fortran Compiler Flags
FFLAGS=

# Assembler Flags
ASFLAGS=

# Link Libraries and Options
LDLIBSOPTIONS=

# Build Targets
.build-conf: ${BUILD_SUBPROJECTS}
	"${MAKE}"  -f nbproject/Makefile-${CND_CONF}.mk ${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}/fnirsi_1013d_firmware_backup

${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}/fnirsi_1013d_firmware_backup: ${OBJECTFILES}
	${MKDIR} -p ${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}
	arm-none-eabi-gcc -o ${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}/fnirsi_1013d_firmware_backup ${OBJECTFILES} ${LDLIBSOPTIONS} -T./stm32f103-64k.ld -nostdlib

${OBJECTDIR}/ccu_control.o: ccu_control.c
	${MKDIR} -p ${OBJECTDIR}
	${RM} "$@.d"
	$(COMPILE.c) -O2 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/ccu_control.o ccu_control.c

${OBJECTDIR}/diskio.o: diskio.c
	${MKDIR} -p ${OBJECTDIR}
	${RM} "$@.d"
	$(COMPILE.c) -O2 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/diskio.o diskio.c

${OBJECTDIR}/display_control.o: display_control.c
	${MKDIR} -p ${OBJECTDIR}
	${RM} "$@.d"
	$(COMPILE.c) -O2 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/display_control.o display_control.c

${OBJECTDIR}/ff.o: ff.c
	${MKDIR} -p ${OBJECTDIR}
	${RM} "$@.d"
	$(COMPILE.c) -O2 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/ff.o ff.c

${OBJECTDIR}/ffunicode.o: ffunicode.c
	${MKDIR} -p ${OBJECTDIR}
	${RM} "$@.d"
	$(COMPILE.c) -O2 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/ffunicode.o ffunicode.c

${OBJECTDIR}/fnirsi_1013d_firmware_backup.o: fnirsi_1013d_firmware_backup.c
	${MKDIR} -p ${OBJECTDIR}
	${RM} "$@.d"
	$(COMPILE.c) -O2 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/fnirsi_1013d_firmware_backup.o fnirsi_1013d_firmware_backup.c

${OBJECTDIR}/font_5.o: font_5.c
	${MKDIR} -p ${OBJECTDIR}
	${RM} "$@.d"
	$(COMPILE.c) -O2 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/font_5.o font_5.c

${OBJECTDIR}/font_7.o: font_7.c
	${MKDIR} -p ${OBJECTDIR}
	${RM} "$@.d"
	$(COMPILE.c) -O2 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/font_7.o font_7.c

${OBJECTDIR}/fwb_display_lib.o: fwb_display_lib.c
	${MKDIR} -p ${OBJECTDIR}
	${RM} "$@.d"
	$(COMPILE.c) -O2 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/fwb_display_lib.o fwb_display_lib.c

${OBJECTDIR}/fwb_fpga_control.o: fwb_fpga_control.c
	${MKDIR} -p ${OBJECTDIR}
	${RM} "$@.d"
	$(COMPILE.c) -O2 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/fwb_fpga_control.o fwb_fpga_control.c

${OBJECTDIR}/fwb_spi_control.o: fwb_spi_control.c
	${MKDIR} -p ${OBJECTDIR}
	${RM} "$@.d"
	$(COMPILE.c) -O2 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/fwb_spi_control.o fwb_spi_control.c

${OBJECTDIR}/fwb_touchpanel.o: fwb_touchpanel.c
	${MKDIR} -p ${OBJECTDIR}
	${RM} "$@.d"
	$(COMPILE.c) -O2 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/fwb_touchpanel.o fwb_touchpanel.c

${OBJECTDIR}/fwb_usb_interface.o: fwb_usb_interface.c
	${MKDIR} -p ${OBJECTDIR}
	${RM} "$@.d"
	$(COMPILE.c) -O2 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/fwb_usb_interface.o fwb_usb_interface.c

${OBJECTDIR}/fwb_variables.o: fwb_variables.c
	${MKDIR} -p ${OBJECTDIR}
	${RM} "$@.d"
	$(COMPILE.c) -O2 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/fwb_variables.o fwb_variables.c

${OBJECTDIR}/icons.o: icons.c
	${MKDIR} -p ${OBJECTDIR}
	${RM} "$@.d"
	$(COMPILE.c) -O2 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/icons.o icons.c

${OBJECTDIR}/interrupt.o: interrupt.c
	${MKDIR} -p ${OBJECTDIR}
	${RM} "$@.d"
	$(COMPILE.c) -O2 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/interrupt.o interrupt.c

${OBJECTDIR}/mass_storage_class.o: mass_storage_class.c
	${MKDIR} -p ${OBJECTDIR}
	${RM} "$@.d"
	$(COMPILE.c) -O2 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/mass_storage_class.o mass_storage_class.c

${OBJECTDIR}/memcmp.o: memcmp.s
	${MKDIR} -p ${OBJECTDIR}
	$(AS) $(ASFLAGS) -o ${OBJECTDIR}/memcmp.o memcmp.s

${OBJECTDIR}/memcpy.o: memcpy.s
	${MKDIR} -p ${OBJECTDIR}
	$(AS) $(ASFLAGS) -o ${OBJECTDIR}/memcpy.o memcpy.s

${OBJECTDIR}/memmove.o: memmove.s
	${MKDIR} -p ${OBJECTDIR}
	$(AS) $(ASFLAGS) -o ${OBJECTDIR}/memmove.o memmove.s

${OBJECTDIR}/memset.o: memset.s
	${MKDIR} -p ${OBJECTDIR}
	$(AS) $(ASFLAGS) -o ${OBJECTDIR}/memset.o memset.s

${OBJECTDIR}/sd_card_interface.o: sd_card_interface.c
	${MKDIR} -p ${OBJECTDIR}
	${RM} "$@.d"
	$(COMPILE.c) -O2 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/sd_card_interface.o sd_card_interface.c

${OBJECTDIR}/sin_cos_math.o: sin_cos_math.c
	${MKDIR} -p ${OBJECTDIR}
	${RM} "$@.d"
	$(COMPILE.c) -O2 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/sin_cos_math.o sin_cos_math.c

${OBJECTDIR}/start.o: start.s
	${MKDIR} -p ${OBJECTDIR}
	$(AS) $(ASFLAGS) -o ${OBJECTDIR}/start.o start.s

${OBJECTDIR}/timer.o: timer.c
	${MKDIR} -p ${OBJECTDIR}
	${RM} "$@.d"
	$(COMPILE.c) -O2 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/timer.o timer.c

# Subprojects
.build-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r ${CND_BUILDDIR}/${CND_CONF}

# Subprojects
.clean-subprojects:

# Enable dependency checking
.dep.inc: .depcheck-impl

include .dep.inc
