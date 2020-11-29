################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../forbackup/src/wifi/helper/athstats-helper.cc \
../forbackup/src/wifi/helper/ht-wifi-mac-helper.cc \
../forbackup/src/wifi/helper/nqos-wifi-mac-helper.cc \
../forbackup/src/wifi/helper/qos-wifi-mac-helper.cc \
../forbackup/src/wifi/helper/vht-wifi-mac-helper.cc \
../forbackup/src/wifi/helper/wifi-helper.cc \
../forbackup/src/wifi/helper/wifi-mac-helper.cc \
../forbackup/src/wifi/helper/wifi-radio-energy-model-helper.cc \
../forbackup/src/wifi/helper/yans-wifi-helper.cc 

CC_DEPS += \
./forbackup/src/wifi/helper/athstats-helper.d \
./forbackup/src/wifi/helper/ht-wifi-mac-helper.d \
./forbackup/src/wifi/helper/nqos-wifi-mac-helper.d \
./forbackup/src/wifi/helper/qos-wifi-mac-helper.d \
./forbackup/src/wifi/helper/vht-wifi-mac-helper.d \
./forbackup/src/wifi/helper/wifi-helper.d \
./forbackup/src/wifi/helper/wifi-mac-helper.d \
./forbackup/src/wifi/helper/wifi-radio-energy-model-helper.d \
./forbackup/src/wifi/helper/yans-wifi-helper.d 

OBJS += \
./forbackup/src/wifi/helper/athstats-helper.o \
./forbackup/src/wifi/helper/ht-wifi-mac-helper.o \
./forbackup/src/wifi/helper/nqos-wifi-mac-helper.o \
./forbackup/src/wifi/helper/qos-wifi-mac-helper.o \
./forbackup/src/wifi/helper/vht-wifi-mac-helper.o \
./forbackup/src/wifi/helper/wifi-helper.o \
./forbackup/src/wifi/helper/wifi-mac-helper.o \
./forbackup/src/wifi/helper/wifi-radio-energy-model-helper.o \
./forbackup/src/wifi/helper/yans-wifi-helper.o 


# Each subdirectory must supply rules for building sources it contributes
forbackup/src/wifi/helper/%.o: ../forbackup/src/wifi/helper/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


