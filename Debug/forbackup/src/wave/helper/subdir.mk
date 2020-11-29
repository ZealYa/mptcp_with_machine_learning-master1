################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../forbackup/src/wave/helper/wave-bsm-helper.cc \
../forbackup/src/wave/helper/wave-bsm-stats.cc \
../forbackup/src/wave/helper/wave-helper.cc \
../forbackup/src/wave/helper/wave-mac-helper.cc \
../forbackup/src/wave/helper/wifi-80211p-helper.cc 

CC_DEPS += \
./forbackup/src/wave/helper/wave-bsm-helper.d \
./forbackup/src/wave/helper/wave-bsm-stats.d \
./forbackup/src/wave/helper/wave-helper.d \
./forbackup/src/wave/helper/wave-mac-helper.d \
./forbackup/src/wave/helper/wifi-80211p-helper.d 

OBJS += \
./forbackup/src/wave/helper/wave-bsm-helper.o \
./forbackup/src/wave/helper/wave-bsm-stats.o \
./forbackup/src/wave/helper/wave-helper.o \
./forbackup/src/wave/helper/wave-mac-helper.o \
./forbackup/src/wave/helper/wifi-80211p-helper.o 


# Each subdirectory must supply rules for building sources it contributes
forbackup/src/wave/helper/%.o: ../forbackup/src/wave/helper/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


