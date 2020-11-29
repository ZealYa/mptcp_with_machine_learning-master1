################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../forbackup/src/csma/model/backoff.cc \
../forbackup/src/csma/model/csma-channel.cc \
../forbackup/src/csma/model/csma-net-device.cc 

CC_DEPS += \
./forbackup/src/csma/model/backoff.d \
./forbackup/src/csma/model/csma-channel.d \
./forbackup/src/csma/model/csma-net-device.d 

OBJS += \
./forbackup/src/csma/model/backoff.o \
./forbackup/src/csma/model/csma-channel.o \
./forbackup/src/csma/model/csma-net-device.o 


# Each subdirectory must supply rules for building sources it contributes
forbackup/src/csma/model/%.o: ../forbackup/src/csma/model/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


