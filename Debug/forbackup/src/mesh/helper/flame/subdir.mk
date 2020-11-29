################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../forbackup/src/mesh/helper/flame/flame-installer.cc 

CC_DEPS += \
./forbackup/src/mesh/helper/flame/flame-installer.d 

OBJS += \
./forbackup/src/mesh/helper/flame/flame-installer.o 


# Each subdirectory must supply rules for building sources it contributes
forbackup/src/mesh/helper/flame/%.o: ../forbackup/src/mesh/helper/flame/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


