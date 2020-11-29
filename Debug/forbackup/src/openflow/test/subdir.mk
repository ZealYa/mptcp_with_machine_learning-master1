################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../forbackup/src/openflow/test/openflow-switch-test-suite.cc 

CC_DEPS += \
./forbackup/src/openflow/test/openflow-switch-test-suite.d 

OBJS += \
./forbackup/src/openflow/test/openflow-switch-test-suite.o 


# Each subdirectory must supply rules for building sources it contributes
forbackup/src/openflow/test/%.o: ../forbackup/src/openflow/test/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


