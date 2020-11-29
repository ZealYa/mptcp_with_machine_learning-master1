################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../forbackup/src/dsdv/test/dsdv-testcase.cc 

CC_DEPS += \
./forbackup/src/dsdv/test/dsdv-testcase.d 

OBJS += \
./forbackup/src/dsdv/test/dsdv-testcase.o 


# Each subdirectory must supply rules for building sources it contributes
forbackup/src/dsdv/test/%.o: ../forbackup/src/dsdv/test/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


