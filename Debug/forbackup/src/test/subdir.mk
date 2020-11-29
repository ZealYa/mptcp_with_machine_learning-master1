################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../forbackup/src/test/adaptive-red-queue-disc-test-suite.cc \
../forbackup/src/test/csma-system-test-suite.cc 

CC_DEPS += \
./forbackup/src/test/adaptive-red-queue-disc-test-suite.d \
./forbackup/src/test/csma-system-test-suite.d 

OBJS += \
./forbackup/src/test/adaptive-red-queue-disc-test-suite.o \
./forbackup/src/test/csma-system-test-suite.o 


# Each subdirectory must supply rules for building sources it contributes
forbackup/src/test/%.o: ../forbackup/src/test/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


