################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../forbackup/src/brite/test/brite-test-topology.cc 

CC_DEPS += \
./forbackup/src/brite/test/brite-test-topology.d 

OBJS += \
./forbackup/src/brite/test/brite-test-topology.o 


# Each subdirectory must supply rules for building sources it contributes
forbackup/src/brite/test/%.o: ../forbackup/src/brite/test/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


