################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../forbackup/src/lr-wpan/model/lr-wpan-csmaca.cc \
../forbackup/src/lr-wpan/model/lr-wpan-error-model.cc \
../forbackup/src/lr-wpan/model/lr-wpan-interference-helper.cc \
../forbackup/src/lr-wpan/model/lr-wpan-lqi-tag.cc \
../forbackup/src/lr-wpan/model/lr-wpan-mac-header.cc \
../forbackup/src/lr-wpan/model/lr-wpan-mac-trailer.cc \
../forbackup/src/lr-wpan/model/lr-wpan-mac.cc \
../forbackup/src/lr-wpan/model/lr-wpan-net-device.cc \
../forbackup/src/lr-wpan/model/lr-wpan-phy.cc \
../forbackup/src/lr-wpan/model/lr-wpan-spectrum-signal-parameters.cc \
../forbackup/src/lr-wpan/model/lr-wpan-spectrum-value-helper.cc 

CC_DEPS += \
./forbackup/src/lr-wpan/model/lr-wpan-csmaca.d \
./forbackup/src/lr-wpan/model/lr-wpan-error-model.d \
./forbackup/src/lr-wpan/model/lr-wpan-interference-helper.d \
./forbackup/src/lr-wpan/model/lr-wpan-lqi-tag.d \
./forbackup/src/lr-wpan/model/lr-wpan-mac-header.d \
./forbackup/src/lr-wpan/model/lr-wpan-mac-trailer.d \
./forbackup/src/lr-wpan/model/lr-wpan-mac.d \
./forbackup/src/lr-wpan/model/lr-wpan-net-device.d \
./forbackup/src/lr-wpan/model/lr-wpan-phy.d \
./forbackup/src/lr-wpan/model/lr-wpan-spectrum-signal-parameters.d \
./forbackup/src/lr-wpan/model/lr-wpan-spectrum-value-helper.d 

OBJS += \
./forbackup/src/lr-wpan/model/lr-wpan-csmaca.o \
./forbackup/src/lr-wpan/model/lr-wpan-error-model.o \
./forbackup/src/lr-wpan/model/lr-wpan-interference-helper.o \
./forbackup/src/lr-wpan/model/lr-wpan-lqi-tag.o \
./forbackup/src/lr-wpan/model/lr-wpan-mac-header.o \
./forbackup/src/lr-wpan/model/lr-wpan-mac-trailer.o \
./forbackup/src/lr-wpan/model/lr-wpan-mac.o \
./forbackup/src/lr-wpan/model/lr-wpan-net-device.o \
./forbackup/src/lr-wpan/model/lr-wpan-phy.o \
./forbackup/src/lr-wpan/model/lr-wpan-spectrum-signal-parameters.o \
./forbackup/src/lr-wpan/model/lr-wpan-spectrum-value-helper.o 


# Each subdirectory must supply rules for building sources it contributes
forbackup/src/lr-wpan/model/%.o: ../forbackup/src/lr-wpan/model/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


