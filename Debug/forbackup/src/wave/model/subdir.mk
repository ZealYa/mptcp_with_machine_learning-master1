################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../forbackup/src/wave/model/bsm-application.cc \
../forbackup/src/wave/model/channel-coordinator.cc \
../forbackup/src/wave/model/channel-manager.cc \
../forbackup/src/wave/model/channel-scheduler.cc \
../forbackup/src/wave/model/default-channel-scheduler.cc \
../forbackup/src/wave/model/higher-tx-tag.cc \
../forbackup/src/wave/model/ocb-wifi-mac.cc \
../forbackup/src/wave/model/vendor-specific-action.cc \
../forbackup/src/wave/model/vsa-manager.cc \
../forbackup/src/wave/model/wave-mac-low.cc \
../forbackup/src/wave/model/wave-net-device.cc 

CC_DEPS += \
./forbackup/src/wave/model/bsm-application.d \
./forbackup/src/wave/model/channel-coordinator.d \
./forbackup/src/wave/model/channel-manager.d \
./forbackup/src/wave/model/channel-scheduler.d \
./forbackup/src/wave/model/default-channel-scheduler.d \
./forbackup/src/wave/model/higher-tx-tag.d \
./forbackup/src/wave/model/ocb-wifi-mac.d \
./forbackup/src/wave/model/vendor-specific-action.d \
./forbackup/src/wave/model/vsa-manager.d \
./forbackup/src/wave/model/wave-mac-low.d \
./forbackup/src/wave/model/wave-net-device.d 

OBJS += \
./forbackup/src/wave/model/bsm-application.o \
./forbackup/src/wave/model/channel-coordinator.o \
./forbackup/src/wave/model/channel-manager.o \
./forbackup/src/wave/model/channel-scheduler.o \
./forbackup/src/wave/model/default-channel-scheduler.o \
./forbackup/src/wave/model/higher-tx-tag.o \
./forbackup/src/wave/model/ocb-wifi-mac.o \
./forbackup/src/wave/model/vendor-specific-action.o \
./forbackup/src/wave/model/vsa-manager.o \
./forbackup/src/wave/model/wave-mac-low.o \
./forbackup/src/wave/model/wave-net-device.o 


# Each subdirectory must supply rules for building sources it contributes
forbackup/src/wave/model/%.o: ../forbackup/src/wave/model/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


