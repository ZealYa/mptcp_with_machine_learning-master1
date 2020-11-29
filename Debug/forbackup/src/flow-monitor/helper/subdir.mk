################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../forbackup/src/flow-monitor/helper/flow-monitor-helper.cc 

CC_DEPS += \
./forbackup/src/flow-monitor/helper/flow-monitor-helper.d 

OBJS += \
./forbackup/src/flow-monitor/helper/flow-monitor-helper.o 


# Each subdirectory must supply rules for building sources it contributes
forbackup/src/flow-monitor/helper/%.o: ../forbackup/src/flow-monitor/helper/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


