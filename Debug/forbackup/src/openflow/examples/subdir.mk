################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../forbackup/src/openflow/examples/openflow-switch.cc 

CC_DEPS += \
./forbackup/src/openflow/examples/openflow-switch.d 

OBJS += \
./forbackup/src/openflow/examples/openflow-switch.o 


# Each subdirectory must supply rules for building sources it contributes
forbackup/src/openflow/examples/%.o: ../forbackup/src/openflow/examples/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


