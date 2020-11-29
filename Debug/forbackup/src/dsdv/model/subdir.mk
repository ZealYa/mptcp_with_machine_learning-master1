################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../forbackup/src/dsdv/model/dsdv-packet-queue.cc \
../forbackup/src/dsdv/model/dsdv-packet.cc \
../forbackup/src/dsdv/model/dsdv-routing-protocol.cc \
../forbackup/src/dsdv/model/dsdv-rtable.cc 

CC_DEPS += \
./forbackup/src/dsdv/model/dsdv-packet-queue.d \
./forbackup/src/dsdv/model/dsdv-packet.d \
./forbackup/src/dsdv/model/dsdv-routing-protocol.d \
./forbackup/src/dsdv/model/dsdv-rtable.d 

OBJS += \
./forbackup/src/dsdv/model/dsdv-packet-queue.o \
./forbackup/src/dsdv/model/dsdv-packet.o \
./forbackup/src/dsdv/model/dsdv-routing-protocol.o \
./forbackup/src/dsdv/model/dsdv-rtable.o 


# Each subdirectory must supply rules for building sources it contributes
forbackup/src/dsdv/model/%.o: ../forbackup/src/dsdv/model/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


