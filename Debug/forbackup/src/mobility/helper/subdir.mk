################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../forbackup/src/mobility/helper/mobility-helper.cc \
../forbackup/src/mobility/helper/ns2-mobility-helper.cc 

CC_DEPS += \
./forbackup/src/mobility/helper/mobility-helper.d \
./forbackup/src/mobility/helper/ns2-mobility-helper.d 

OBJS += \
./forbackup/src/mobility/helper/mobility-helper.o \
./forbackup/src/mobility/helper/ns2-mobility-helper.o 


# Each subdirectory must supply rules for building sources it contributes
forbackup/src/mobility/helper/%.o: ../forbackup/src/mobility/helper/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


