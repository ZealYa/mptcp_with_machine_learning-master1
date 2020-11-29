################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../forbackup/src/buildings/examples/buildings-pathloss-profiler.cc 

CC_DEPS += \
./forbackup/src/buildings/examples/buildings-pathloss-profiler.d 

OBJS += \
./forbackup/src/buildings/examples/buildings-pathloss-profiler.o 


# Each subdirectory must supply rules for building sources it contributes
forbackup/src/buildings/examples/%.o: ../forbackup/src/buildings/examples/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


