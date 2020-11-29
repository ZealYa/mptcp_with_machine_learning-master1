################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../forbackup/src/topology-read/examples/topology-example-sim.cc 

CC_DEPS += \
./forbackup/src/topology-read/examples/topology-example-sim.d 

OBJS += \
./forbackup/src/topology-read/examples/topology-example-sim.o 


# Each subdirectory must supply rules for building sources it contributes
forbackup/src/topology-read/examples/%.o: ../forbackup/src/topology-read/examples/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


