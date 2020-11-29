################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../forbackup/src/dsr/examples/dsr.cc 

CC_DEPS += \
./forbackup/src/dsr/examples/dsr.d 

OBJS += \
./forbackup/src/dsr/examples/dsr.o 


# Each subdirectory must supply rules for building sources it contributes
forbackup/src/dsr/examples/%.o: ../forbackup/src/dsr/examples/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


