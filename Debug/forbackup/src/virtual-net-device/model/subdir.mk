################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../forbackup/src/virtual-net-device/model/virtual-net-device.cc 

CC_DEPS += \
./forbackup/src/virtual-net-device/model/virtual-net-device.d 

OBJS += \
./forbackup/src/virtual-net-device/model/virtual-net-device.o 


# Each subdirectory must supply rules for building sources it contributes
forbackup/src/virtual-net-device/model/%.o: ../forbackup/src/virtual-net-device/model/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


