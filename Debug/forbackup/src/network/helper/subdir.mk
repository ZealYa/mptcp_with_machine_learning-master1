################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../forbackup/src/network/helper/application-container.cc \
../forbackup/src/network/helper/delay-jitter-estimation.cc \
../forbackup/src/network/helper/net-device-container.cc \
../forbackup/src/network/helper/node-container.cc \
../forbackup/src/network/helper/packet-socket-helper.cc \
../forbackup/src/network/helper/simple-net-device-helper.cc \
../forbackup/src/network/helper/trace-helper.cc 

CC_DEPS += \
./forbackup/src/network/helper/application-container.d \
./forbackup/src/network/helper/delay-jitter-estimation.d \
./forbackup/src/network/helper/net-device-container.d \
./forbackup/src/network/helper/node-container.d \
./forbackup/src/network/helper/packet-socket-helper.d \
./forbackup/src/network/helper/simple-net-device-helper.d \
./forbackup/src/network/helper/trace-helper.d 

OBJS += \
./forbackup/src/network/helper/application-container.o \
./forbackup/src/network/helper/delay-jitter-estimation.o \
./forbackup/src/network/helper/net-device-container.o \
./forbackup/src/network/helper/node-container.o \
./forbackup/src/network/helper/packet-socket-helper.o \
./forbackup/src/network/helper/simple-net-device-helper.o \
./forbackup/src/network/helper/trace-helper.o 


# Each subdirectory must supply rules for building sources it contributes
forbackup/src/network/helper/%.o: ../forbackup/src/network/helper/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


