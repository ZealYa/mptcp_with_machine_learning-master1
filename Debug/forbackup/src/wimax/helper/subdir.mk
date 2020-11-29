################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../forbackup/src/wimax/helper/wimax-helper.cc 

CC_DEPS += \
./forbackup/src/wimax/helper/wimax-helper.d 

OBJS += \
./forbackup/src/wimax/helper/wimax-helper.o 


# Each subdirectory must supply rules for building sources it contributes
forbackup/src/wimax/helper/%.o: ../forbackup/src/wimax/helper/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


