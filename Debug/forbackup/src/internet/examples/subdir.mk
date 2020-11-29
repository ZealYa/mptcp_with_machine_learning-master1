################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../forbackup/src/internet/examples/main-simple.cc 

CC_DEPS += \
./forbackup/src/internet/examples/main-simple.d 

OBJS += \
./forbackup/src/internet/examples/main-simple.o 


# Each subdirectory must supply rules for building sources it contributes
forbackup/src/internet/examples/%.o: ../forbackup/src/internet/examples/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


