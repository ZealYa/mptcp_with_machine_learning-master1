################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../forbackup/src/aodv/model/aodv-dpd.cc \
../forbackup/src/aodv/model/aodv-id-cache.cc \
../forbackup/src/aodv/model/aodv-neighbor.cc \
../forbackup/src/aodv/model/aodv-packet.cc \
../forbackup/src/aodv/model/aodv-routing-protocol.cc \
../forbackup/src/aodv/model/aodv-rqueue.cc \
../forbackup/src/aodv/model/aodv-rtable.cc 

CC_DEPS += \
./forbackup/src/aodv/model/aodv-dpd.d \
./forbackup/src/aodv/model/aodv-id-cache.d \
./forbackup/src/aodv/model/aodv-neighbor.d \
./forbackup/src/aodv/model/aodv-packet.d \
./forbackup/src/aodv/model/aodv-routing-protocol.d \
./forbackup/src/aodv/model/aodv-rqueue.d \
./forbackup/src/aodv/model/aodv-rtable.d 

OBJS += \
./forbackup/src/aodv/model/aodv-dpd.o \
./forbackup/src/aodv/model/aodv-id-cache.o \
./forbackup/src/aodv/model/aodv-neighbor.o \
./forbackup/src/aodv/model/aodv-packet.o \
./forbackup/src/aodv/model/aodv-routing-protocol.o \
./forbackup/src/aodv/model/aodv-rqueue.o \
./forbackup/src/aodv/model/aodv-rtable.o 


# Each subdirectory must supply rules for building sources it contributes
forbackup/src/aodv/model/%.o: ../forbackup/src/aodv/model/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


