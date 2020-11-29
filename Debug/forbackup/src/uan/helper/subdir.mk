################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../forbackup/src/uan/helper/acoustic-modem-energy-model-helper.cc \
../forbackup/src/uan/helper/uan-helper.cc 

CC_DEPS += \
./forbackup/src/uan/helper/acoustic-modem-energy-model-helper.d \
./forbackup/src/uan/helper/uan-helper.d 

OBJS += \
./forbackup/src/uan/helper/acoustic-modem-energy-model-helper.o \
./forbackup/src/uan/helper/uan-helper.o 


# Each subdirectory must supply rules for building sources it contributes
forbackup/src/uan/helper/%.o: ../forbackup/src/uan/helper/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


