################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../forbackup/src/core/bindings/module_helpers.cc 

CC_DEPS += \
./forbackup/src/core/bindings/module_helpers.d 

OBJS += \
./forbackup/src/core/bindings/module_helpers.o 


# Each subdirectory must supply rules for building sources it contributes
forbackup/src/core/bindings/%.o: ../forbackup/src/core/bindings/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


