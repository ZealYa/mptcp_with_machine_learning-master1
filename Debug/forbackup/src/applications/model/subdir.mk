################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../forbackup/src/applications/model/application-packet-probe.cc \
../forbackup/src/applications/model/bulk-send-application.cc \
../forbackup/src/applications/model/onoff-application.cc \
../forbackup/src/applications/model/packet-loss-counter.cc \
../forbackup/src/applications/model/packet-sink.cc \
../forbackup/src/applications/model/seq-ts-header.cc \
../forbackup/src/applications/model/udp-client.cc \
../forbackup/src/applications/model/udp-echo-client.cc \
../forbackup/src/applications/model/udp-echo-server.cc \
../forbackup/src/applications/model/udp-server.cc \
../forbackup/src/applications/model/udp-trace-client.cc 

CC_DEPS += \
./forbackup/src/applications/model/application-packet-probe.d \
./forbackup/src/applications/model/bulk-send-application.d \
./forbackup/src/applications/model/onoff-application.d \
./forbackup/src/applications/model/packet-loss-counter.d \
./forbackup/src/applications/model/packet-sink.d \
./forbackup/src/applications/model/seq-ts-header.d \
./forbackup/src/applications/model/udp-client.d \
./forbackup/src/applications/model/udp-echo-client.d \
./forbackup/src/applications/model/udp-echo-server.d \
./forbackup/src/applications/model/udp-server.d \
./forbackup/src/applications/model/udp-trace-client.d 

OBJS += \
./forbackup/src/applications/model/application-packet-probe.o \
./forbackup/src/applications/model/bulk-send-application.o \
./forbackup/src/applications/model/onoff-application.o \
./forbackup/src/applications/model/packet-loss-counter.o \
./forbackup/src/applications/model/packet-sink.o \
./forbackup/src/applications/model/seq-ts-header.o \
./forbackup/src/applications/model/udp-client.o \
./forbackup/src/applications/model/udp-echo-client.o \
./forbackup/src/applications/model/udp-echo-server.o \
./forbackup/src/applications/model/udp-server.o \
./forbackup/src/applications/model/udp-trace-client.o 


# Each subdirectory must supply rules for building sources it contributes
forbackup/src/applications/model/%.o: ../forbackup/src/applications/model/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


