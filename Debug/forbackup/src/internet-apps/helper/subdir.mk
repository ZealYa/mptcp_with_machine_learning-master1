################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../forbackup/src/internet-apps/helper/ping6-helper.cc \
../forbackup/src/internet-apps/helper/radvd-helper.cc \
../forbackup/src/internet-apps/helper/v4ping-helper.cc 

CC_DEPS += \
./forbackup/src/internet-apps/helper/ping6-helper.d \
./forbackup/src/internet-apps/helper/radvd-helper.d \
./forbackup/src/internet-apps/helper/v4ping-helper.d 

OBJS += \
./forbackup/src/internet-apps/helper/ping6-helper.o \
./forbackup/src/internet-apps/helper/radvd-helper.o \
./forbackup/src/internet-apps/helper/v4ping-helper.o 


# Each subdirectory must supply rules for building sources it contributes
forbackup/src/internet-apps/helper/%.o: ../forbackup/src/internet-apps/helper/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


