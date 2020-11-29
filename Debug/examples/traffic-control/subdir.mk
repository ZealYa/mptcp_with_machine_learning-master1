################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../examples/traffic-control/traffic-control.cc 

CC_DEPS += \
./examples/traffic-control/traffic-control.d 

OBJS += \
./examples/traffic-control/traffic-control.o 


# Each subdirectory must supply rules for building sources it contributes
examples/traffic-control/%.o: ../examples/traffic-control/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


