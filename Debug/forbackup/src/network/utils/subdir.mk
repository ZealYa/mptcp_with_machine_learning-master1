################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../forbackup/src/network/utils/address-utils.cc \
../forbackup/src/network/utils/ascii-file.cc \
../forbackup/src/network/utils/crc32.cc \
../forbackup/src/network/utils/data-rate.cc \
../forbackup/src/network/utils/drop-tail-queue.cc \
../forbackup/src/network/utils/error-model.cc \
../forbackup/src/network/utils/ethernet-header.cc \
../forbackup/src/network/utils/ethernet-trailer.cc \
../forbackup/src/network/utils/flow-id-tag.cc \
../forbackup/src/network/utils/inet-socket-address.cc \
../forbackup/src/network/utils/inet6-socket-address.cc \
../forbackup/src/network/utils/ipv4-address.cc \
../forbackup/src/network/utils/ipv6-address.cc \
../forbackup/src/network/utils/llc-snap-header.cc \
../forbackup/src/network/utils/mac16-address.cc \
../forbackup/src/network/utils/mac48-address.cc \
../forbackup/src/network/utils/mac64-address.cc \
../forbackup/src/network/utils/output-stream-wrapper.cc \
../forbackup/src/network/utils/packet-burst.cc \
../forbackup/src/network/utils/packet-data-calculators.cc \
../forbackup/src/network/utils/packet-probe.cc \
../forbackup/src/network/utils/packet-socket-address.cc \
../forbackup/src/network/utils/packet-socket-client.cc \
../forbackup/src/network/utils/packet-socket-factory.cc \
../forbackup/src/network/utils/packet-socket-server.cc \
../forbackup/src/network/utils/packet-socket.cc \
../forbackup/src/network/utils/packetbb.cc \
../forbackup/src/network/utils/pcap-file-wrapper.cc \
../forbackup/src/network/utils/pcap-file.cc \
../forbackup/src/network/utils/queue.cc \
../forbackup/src/network/utils/radiotap-header.cc \
../forbackup/src/network/utils/simple-channel.cc \
../forbackup/src/network/utils/simple-net-device.cc \
../forbackup/src/network/utils/sll-header.cc 

CC_DEPS += \
./forbackup/src/network/utils/address-utils.d \
./forbackup/src/network/utils/ascii-file.d \
./forbackup/src/network/utils/crc32.d \
./forbackup/src/network/utils/data-rate.d \
./forbackup/src/network/utils/drop-tail-queue.d \
./forbackup/src/network/utils/error-model.d \
./forbackup/src/network/utils/ethernet-header.d \
./forbackup/src/network/utils/ethernet-trailer.d \
./forbackup/src/network/utils/flow-id-tag.d \
./forbackup/src/network/utils/inet-socket-address.d \
./forbackup/src/network/utils/inet6-socket-address.d \
./forbackup/src/network/utils/ipv4-address.d \
./forbackup/src/network/utils/ipv6-address.d \
./forbackup/src/network/utils/llc-snap-header.d \
./forbackup/src/network/utils/mac16-address.d \
./forbackup/src/network/utils/mac48-address.d \
./forbackup/src/network/utils/mac64-address.d \
./forbackup/src/network/utils/output-stream-wrapper.d \
./forbackup/src/network/utils/packet-burst.d \
./forbackup/src/network/utils/packet-data-calculators.d \
./forbackup/src/network/utils/packet-probe.d \
./forbackup/src/network/utils/packet-socket-address.d \
./forbackup/src/network/utils/packet-socket-client.d \
./forbackup/src/network/utils/packet-socket-factory.d \
./forbackup/src/network/utils/packet-socket-server.d \
./forbackup/src/network/utils/packet-socket.d \
./forbackup/src/network/utils/packetbb.d \
./forbackup/src/network/utils/pcap-file-wrapper.d \
./forbackup/src/network/utils/pcap-file.d \
./forbackup/src/network/utils/queue.d \
./forbackup/src/network/utils/radiotap-header.d \
./forbackup/src/network/utils/simple-channel.d \
./forbackup/src/network/utils/simple-net-device.d \
./forbackup/src/network/utils/sll-header.d 

OBJS += \
./forbackup/src/network/utils/address-utils.o \
./forbackup/src/network/utils/ascii-file.o \
./forbackup/src/network/utils/crc32.o \
./forbackup/src/network/utils/data-rate.o \
./forbackup/src/network/utils/drop-tail-queue.o \
./forbackup/src/network/utils/error-model.o \
./forbackup/src/network/utils/ethernet-header.o \
./forbackup/src/network/utils/ethernet-trailer.o \
./forbackup/src/network/utils/flow-id-tag.o \
./forbackup/src/network/utils/inet-socket-address.o \
./forbackup/src/network/utils/inet6-socket-address.o \
./forbackup/src/network/utils/ipv4-address.o \
./forbackup/src/network/utils/ipv6-address.o \
./forbackup/src/network/utils/llc-snap-header.o \
./forbackup/src/network/utils/mac16-address.o \
./forbackup/src/network/utils/mac48-address.o \
./forbackup/src/network/utils/mac64-address.o \
./forbackup/src/network/utils/output-stream-wrapper.o \
./forbackup/src/network/utils/packet-burst.o \
./forbackup/src/network/utils/packet-data-calculators.o \
./forbackup/src/network/utils/packet-probe.o \
./forbackup/src/network/utils/packet-socket-address.o \
./forbackup/src/network/utils/packet-socket-client.o \
./forbackup/src/network/utils/packet-socket-factory.o \
./forbackup/src/network/utils/packet-socket-server.o \
./forbackup/src/network/utils/packet-socket.o \
./forbackup/src/network/utils/packetbb.o \
./forbackup/src/network/utils/pcap-file-wrapper.o \
./forbackup/src/network/utils/pcap-file.o \
./forbackup/src/network/utils/queue.o \
./forbackup/src/network/utils/radiotap-header.o \
./forbackup/src/network/utils/simple-channel.o \
./forbackup/src/network/utils/simple-net-device.o \
./forbackup/src/network/utils/sll-header.o 


# Each subdirectory must supply rules for building sources it contributes
forbackup/src/network/utils/%.o: ../forbackup/src/network/utils/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


