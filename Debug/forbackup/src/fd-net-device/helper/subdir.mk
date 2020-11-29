################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../forbackup/src/fd-net-device/helper/creator-utils.cc \
../forbackup/src/fd-net-device/helper/emu-fd-net-device-helper.cc \
../forbackup/src/fd-net-device/helper/encode-decode.cc \
../forbackup/src/fd-net-device/helper/fd-net-device-helper.cc \
../forbackup/src/fd-net-device/helper/planetlab-fd-net-device-helper.cc \
../forbackup/src/fd-net-device/helper/planetlab-tap-creator.cc \
../forbackup/src/fd-net-device/helper/raw-sock-creator.cc \
../forbackup/src/fd-net-device/helper/tap-device-creator.cc \
../forbackup/src/fd-net-device/helper/tap-fd-net-device-helper.cc 

CC_DEPS += \
./forbackup/src/fd-net-device/helper/creator-utils.d \
./forbackup/src/fd-net-device/helper/emu-fd-net-device-helper.d \
./forbackup/src/fd-net-device/helper/encode-decode.d \
./forbackup/src/fd-net-device/helper/fd-net-device-helper.d \
./forbackup/src/fd-net-device/helper/planetlab-fd-net-device-helper.d \
./forbackup/src/fd-net-device/helper/planetlab-tap-creator.d \
./forbackup/src/fd-net-device/helper/raw-sock-creator.d \
./forbackup/src/fd-net-device/helper/tap-device-creator.d \
./forbackup/src/fd-net-device/helper/tap-fd-net-device-helper.d 

OBJS += \
./forbackup/src/fd-net-device/helper/creator-utils.o \
./forbackup/src/fd-net-device/helper/emu-fd-net-device-helper.o \
./forbackup/src/fd-net-device/helper/encode-decode.o \
./forbackup/src/fd-net-device/helper/fd-net-device-helper.o \
./forbackup/src/fd-net-device/helper/planetlab-fd-net-device-helper.o \
./forbackup/src/fd-net-device/helper/planetlab-tap-creator.o \
./forbackup/src/fd-net-device/helper/raw-sock-creator.o \
./forbackup/src/fd-net-device/helper/tap-device-creator.o \
./forbackup/src/fd-net-device/helper/tap-fd-net-device-helper.o 


# Each subdirectory must supply rules for building sources it contributes
forbackup/src/fd-net-device/helper/%.o: ../forbackup/src/fd-net-device/helper/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


