################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../forbackup/src/network/examples/main-packet-header.cc \
../forbackup/src/network/examples/main-packet-tag.cc \
../forbackup/src/network/examples/packet-socket-apps.cc 

CC_DEPS += \
./forbackup/src/network/examples/main-packet-header.d \
./forbackup/src/network/examples/main-packet-tag.d \
./forbackup/src/network/examples/packet-socket-apps.d 

OBJS += \
./forbackup/src/network/examples/main-packet-header.o \
./forbackup/src/network/examples/main-packet-tag.o \
./forbackup/src/network/examples/packet-socket-apps.o 


# Each subdirectory must supply rules for building sources it contributes
forbackup/src/network/examples/%.o: ../forbackup/src/network/examples/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


