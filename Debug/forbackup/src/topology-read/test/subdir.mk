################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../forbackup/src/topology-read/test/rocketfuel-topology-reader-test-suite.cc 

CC_DEPS += \
./forbackup/src/topology-read/test/rocketfuel-topology-reader-test-suite.d 

OBJS += \
./forbackup/src/topology-read/test/rocketfuel-topology-reader-test-suite.o 


# Each subdirectory must supply rules for building sources it contributes
forbackup/src/topology-read/test/%.o: ../forbackup/src/topology-read/test/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


