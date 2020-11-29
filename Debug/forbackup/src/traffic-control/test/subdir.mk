################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../forbackup/src/traffic-control/test/codel-queue-disc-test-suite.cc \
../forbackup/src/traffic-control/test/red-queue-disc-test-suite.cc 

CC_DEPS += \
./forbackup/src/traffic-control/test/codel-queue-disc-test-suite.d \
./forbackup/src/traffic-control/test/red-queue-disc-test-suite.d 

OBJS += \
./forbackup/src/traffic-control/test/codel-queue-disc-test-suite.o \
./forbackup/src/traffic-control/test/red-queue-disc-test-suite.o 


# Each subdirectory must supply rules for building sources it contributes
forbackup/src/traffic-control/test/%.o: ../forbackup/src/traffic-control/test/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


