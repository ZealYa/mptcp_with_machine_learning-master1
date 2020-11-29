################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../forbackup/src/applications/helper/bulk-send-helper.cc \
../forbackup/src/applications/helper/on-off-helper.cc \
../forbackup/src/applications/helper/packet-sink-helper.cc \
../forbackup/src/applications/helper/udp-client-server-helper.cc \
../forbackup/src/applications/helper/udp-echo-helper.cc 

CC_DEPS += \
./forbackup/src/applications/helper/bulk-send-helper.d \
./forbackup/src/applications/helper/on-off-helper.d \
./forbackup/src/applications/helper/packet-sink-helper.d \
./forbackup/src/applications/helper/udp-client-server-helper.d \
./forbackup/src/applications/helper/udp-echo-helper.d 

OBJS += \
./forbackup/src/applications/helper/bulk-send-helper.o \
./forbackup/src/applications/helper/on-off-helper.o \
./forbackup/src/applications/helper/packet-sink-helper.o \
./forbackup/src/applications/helper/udp-client-server-helper.o \
./forbackup/src/applications/helper/udp-echo-helper.o 


# Each subdirectory must supply rules for building sources it contributes
forbackup/src/applications/helper/%.o: ../forbackup/src/applications/helper/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


