################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../src/traffic-control/test/codel-queue-disc-test-suite.cc \
../src/traffic-control/test/red-queue-disc-test-suite.cc 

CC_DEPS += \
./src/traffic-control/test/codel-queue-disc-test-suite.d \
./src/traffic-control/test/red-queue-disc-test-suite.d 

OBJS += \
./src/traffic-control/test/codel-queue-disc-test-suite.o \
./src/traffic-control/test/red-queue-disc-test-suite.o 


# Each subdirectory must supply rules for building sources it contributes
src/traffic-control/test/%.o: ../src/traffic-control/test/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


