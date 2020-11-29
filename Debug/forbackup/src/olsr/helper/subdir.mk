################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../forbackup/src/olsr/helper/olsr-helper.cc 

CC_DEPS += \
./forbackup/src/olsr/helper/olsr-helper.d 

OBJS += \
./forbackup/src/olsr/helper/olsr-helper.o 


# Each subdirectory must supply rules for building sources it contributes
forbackup/src/olsr/helper/%.o: ../forbackup/src/olsr/helper/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


