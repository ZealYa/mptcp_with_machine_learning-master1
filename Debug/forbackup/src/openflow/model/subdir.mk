################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../forbackup/src/openflow/model/openflow-interface.cc \
../forbackup/src/openflow/model/openflow-switch-net-device.cc 

CC_DEPS += \
./forbackup/src/openflow/model/openflow-interface.d \
./forbackup/src/openflow/model/openflow-switch-net-device.d 

OBJS += \
./forbackup/src/openflow/model/openflow-interface.o \
./forbackup/src/openflow/model/openflow-switch-net-device.o 


# Each subdirectory must supply rules for building sources it contributes
forbackup/src/openflow/model/%.o: ../forbackup/src/openflow/model/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


