################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../forbackup/src/uan/test/uan-energy-model-test.cc \
../forbackup/src/uan/test/uan-test.cc 

CC_DEPS += \
./forbackup/src/uan/test/uan-energy-model-test.d \
./forbackup/src/uan/test/uan-test.d 

OBJS += \
./forbackup/src/uan/test/uan-energy-model-test.o \
./forbackup/src/uan/test/uan-test.o 


# Each subdirectory must supply rules for building sources it contributes
forbackup/src/uan/test/%.o: ../forbackup/src/uan/test/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


