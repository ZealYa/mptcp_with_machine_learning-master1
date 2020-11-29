################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../forbackup/src/csma-layout/examples/csma-star.cc 

CC_DEPS += \
./forbackup/src/csma-layout/examples/csma-star.d 

OBJS += \
./forbackup/src/csma-layout/examples/csma-star.o 


# Each subdirectory must supply rules for building sources it contributes
forbackup/src/csma-layout/examples/%.o: ../forbackup/src/csma-layout/examples/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


