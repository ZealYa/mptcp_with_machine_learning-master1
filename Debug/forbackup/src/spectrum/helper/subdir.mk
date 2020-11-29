################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../forbackup/src/spectrum/helper/adhoc-aloha-noack-ideal-phy-helper.cc \
../forbackup/src/spectrum/helper/spectrum-analyzer-helper.cc \
../forbackup/src/spectrum/helper/spectrum-helper.cc \
../forbackup/src/spectrum/helper/tv-spectrum-transmitter-helper.cc \
../forbackup/src/spectrum/helper/waveform-generator-helper.cc 

CC_DEPS += \
./forbackup/src/spectrum/helper/adhoc-aloha-noack-ideal-phy-helper.d \
./forbackup/src/spectrum/helper/spectrum-analyzer-helper.d \
./forbackup/src/spectrum/helper/spectrum-helper.d \
./forbackup/src/spectrum/helper/tv-spectrum-transmitter-helper.d \
./forbackup/src/spectrum/helper/waveform-generator-helper.d 

OBJS += \
./forbackup/src/spectrum/helper/adhoc-aloha-noack-ideal-phy-helper.o \
./forbackup/src/spectrum/helper/spectrum-analyzer-helper.o \
./forbackup/src/spectrum/helper/spectrum-helper.o \
./forbackup/src/spectrum/helper/tv-spectrum-transmitter-helper.o \
./forbackup/src/spectrum/helper/waveform-generator-helper.o 


# Each subdirectory must supply rules for building sources it contributes
forbackup/src/spectrum/helper/%.o: ../forbackup/src/spectrum/helper/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


