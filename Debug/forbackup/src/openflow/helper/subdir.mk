################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../forbackup/src/openflow/helper/openflow-switch-helper.cc 

CC_DEPS += \
./forbackup/src/openflow/helper/openflow-switch-helper.d 

OBJS += \
./forbackup/src/openflow/helper/openflow-switch-helper.o 


# Each subdirectory must supply rules for building sources it contributes
forbackup/src/openflow/helper/%.o: ../forbackup/src/openflow/helper/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


