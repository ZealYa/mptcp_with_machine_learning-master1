################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../forbackup/src/csma/examples/csma-broadcast.cc \
../forbackup/src/csma/examples/csma-multicast.cc \
../forbackup/src/csma/examples/csma-one-subnet.cc \
../forbackup/src/csma/examples/csma-packet-socket.cc \
../forbackup/src/csma/examples/csma-ping.cc \
../forbackup/src/csma/examples/csma-raw-ip-socket.cc 

CC_DEPS += \
./forbackup/src/csma/examples/csma-broadcast.d \
./forbackup/src/csma/examples/csma-multicast.d \
./forbackup/src/csma/examples/csma-one-subnet.d \
./forbackup/src/csma/examples/csma-packet-socket.d \
./forbackup/src/csma/examples/csma-ping.d \
./forbackup/src/csma/examples/csma-raw-ip-socket.d 

OBJS += \
./forbackup/src/csma/examples/csma-broadcast.o \
./forbackup/src/csma/examples/csma-multicast.o \
./forbackup/src/csma/examples/csma-one-subnet.o \
./forbackup/src/csma/examples/csma-packet-socket.o \
./forbackup/src/csma/examples/csma-ping.o \
./forbackup/src/csma/examples/csma-raw-ip-socket.o 


# Each subdirectory must supply rules for building sources it contributes
forbackup/src/csma/examples/%.o: ../forbackup/src/csma/examples/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


