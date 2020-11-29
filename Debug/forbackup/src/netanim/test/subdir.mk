################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../forbackup/src/netanim/test/netanim-test.cc 

CC_DEPS += \
./forbackup/src/netanim/test/netanim-test.d 

OBJS += \
./forbackup/src/netanim/test/netanim-test.o 


# Each subdirectory must supply rules for building sources it contributes
forbackup/src/netanim/test/%.o: ../forbackup/src/netanim/test/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


