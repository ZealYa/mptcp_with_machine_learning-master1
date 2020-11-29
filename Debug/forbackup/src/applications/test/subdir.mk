################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../forbackup/src/applications/test/udp-client-server-test.cc 

CC_DEPS += \
./forbackup/src/applications/test/udp-client-server-test.d 

OBJS += \
./forbackup/src/applications/test/udp-client-server-test.o 


# Each subdirectory must supply rules for building sources it contributes
forbackup/src/applications/test/%.o: ../forbackup/src/applications/test/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


