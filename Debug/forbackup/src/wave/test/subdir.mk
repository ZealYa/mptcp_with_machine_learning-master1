################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../forbackup/src/wave/test/mac-extension-test-suite.cc \
../forbackup/src/wave/test/ocb-test-suite.cc 

CC_DEPS += \
./forbackup/src/wave/test/mac-extension-test-suite.d \
./forbackup/src/wave/test/ocb-test-suite.d 

OBJS += \
./forbackup/src/wave/test/mac-extension-test-suite.o \
./forbackup/src/wave/test/ocb-test-suite.o 


# Each subdirectory must supply rules for building sources it contributes
forbackup/src/wave/test/%.o: ../forbackup/src/wave/test/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


