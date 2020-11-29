################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../forbackup/src/sixlowpan/helper/sixlowpan-helper.cc 

CC_DEPS += \
./forbackup/src/sixlowpan/helper/sixlowpan-helper.d 

OBJS += \
./forbackup/src/sixlowpan/helper/sixlowpan-helper.o 


# Each subdirectory must supply rules for building sources it contributes
forbackup/src/sixlowpan/helper/%.o: ../forbackup/src/sixlowpan/helper/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


