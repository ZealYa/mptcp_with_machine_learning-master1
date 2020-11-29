################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../forbackup/src/aodv/examples/aodv.cc 

CC_DEPS += \
./forbackup/src/aodv/examples/aodv.d 

OBJS += \
./forbackup/src/aodv/examples/aodv.o 


# Each subdirectory must supply rules for building sources it contributes
forbackup/src/aodv/examples/%.o: ../forbackup/src/aodv/examples/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


