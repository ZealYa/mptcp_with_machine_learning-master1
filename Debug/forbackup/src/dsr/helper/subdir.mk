################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../forbackup/src/dsr/helper/dsr-helper.cc \
../forbackup/src/dsr/helper/dsr-main-helper.cc 

CC_DEPS += \
./forbackup/src/dsr/helper/dsr-helper.d \
./forbackup/src/dsr/helper/dsr-main-helper.d 

OBJS += \
./forbackup/src/dsr/helper/dsr-helper.o \
./forbackup/src/dsr/helper/dsr-main-helper.o 


# Each subdirectory must supply rules for building sources it contributes
forbackup/src/dsr/helper/%.o: ../forbackup/src/dsr/helper/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


