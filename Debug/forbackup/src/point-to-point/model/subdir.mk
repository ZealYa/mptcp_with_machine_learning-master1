################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../forbackup/src/point-to-point/model/point-to-point-channel.cc \
../forbackup/src/point-to-point/model/point-to-point-net-device.cc \
../forbackup/src/point-to-point/model/point-to-point-remote-channel.cc \
../forbackup/src/point-to-point/model/ppp-header.cc 

CC_DEPS += \
./forbackup/src/point-to-point/model/point-to-point-channel.d \
./forbackup/src/point-to-point/model/point-to-point-net-device.d \
./forbackup/src/point-to-point/model/point-to-point-remote-channel.d \
./forbackup/src/point-to-point/model/ppp-header.d 

OBJS += \
./forbackup/src/point-to-point/model/point-to-point-channel.o \
./forbackup/src/point-to-point/model/point-to-point-net-device.o \
./forbackup/src/point-to-point/model/point-to-point-remote-channel.o \
./forbackup/src/point-to-point/model/ppp-header.o 


# Each subdirectory must supply rules for building sources it contributes
forbackup/src/point-to-point/model/%.o: ../forbackup/src/point-to-point/model/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


