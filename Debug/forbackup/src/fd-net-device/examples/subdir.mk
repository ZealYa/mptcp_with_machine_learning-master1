################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../forbackup/src/fd-net-device/examples/dummy-network.cc \
../forbackup/src/fd-net-device/examples/fd-emu-onoff.cc \
../forbackup/src/fd-net-device/examples/fd-emu-ping.cc \
../forbackup/src/fd-net-device/examples/fd-emu-udp-echo.cc \
../forbackup/src/fd-net-device/examples/fd-planetlab-ping.cc \
../forbackup/src/fd-net-device/examples/fd-tap-ping.cc \
../forbackup/src/fd-net-device/examples/fd-tap-ping6.cc \
../forbackup/src/fd-net-device/examples/fd2fd-onoff.cc \
../forbackup/src/fd-net-device/examples/realtime-dummy-network.cc \
../forbackup/src/fd-net-device/examples/realtime-fd2fd-onoff.cc 

CC_DEPS += \
./forbackup/src/fd-net-device/examples/dummy-network.d \
./forbackup/src/fd-net-device/examples/fd-emu-onoff.d \
./forbackup/src/fd-net-device/examples/fd-emu-ping.d \
./forbackup/src/fd-net-device/examples/fd-emu-udp-echo.d \
./forbackup/src/fd-net-device/examples/fd-planetlab-ping.d \
./forbackup/src/fd-net-device/examples/fd-tap-ping.d \
./forbackup/src/fd-net-device/examples/fd-tap-ping6.d \
./forbackup/src/fd-net-device/examples/fd2fd-onoff.d \
./forbackup/src/fd-net-device/examples/realtime-dummy-network.d \
./forbackup/src/fd-net-device/examples/realtime-fd2fd-onoff.d 

OBJS += \
./forbackup/src/fd-net-device/examples/dummy-network.o \
./forbackup/src/fd-net-device/examples/fd-emu-onoff.o \
./forbackup/src/fd-net-device/examples/fd-emu-ping.o \
./forbackup/src/fd-net-device/examples/fd-emu-udp-echo.o \
./forbackup/src/fd-net-device/examples/fd-planetlab-ping.o \
./forbackup/src/fd-net-device/examples/fd-tap-ping.o \
./forbackup/src/fd-net-device/examples/fd-tap-ping6.o \
./forbackup/src/fd-net-device/examples/fd2fd-onoff.o \
./forbackup/src/fd-net-device/examples/realtime-dummy-network.o \
./forbackup/src/fd-net-device/examples/realtime-fd2fd-onoff.o 


# Each subdirectory must supply rules for building sources it contributes
forbackup/src/fd-net-device/examples/%.o: ../forbackup/src/fd-net-device/examples/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


