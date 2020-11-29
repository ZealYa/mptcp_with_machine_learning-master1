################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../forbackup/src/network/model/address.cc \
../forbackup/src/network/model/application.cc \
../forbackup/src/network/model/buffer.cc \
../forbackup/src/network/model/byte-tag-list.cc \
../forbackup/src/network/model/channel-list.cc \
../forbackup/src/network/model/channel.cc \
../forbackup/src/network/model/chunk.cc \
../forbackup/src/network/model/header.cc \
../forbackup/src/network/model/net-device.cc \
../forbackup/src/network/model/nix-vector.cc \
../forbackup/src/network/model/node-list.cc \
../forbackup/src/network/model/node.cc \
../forbackup/src/network/model/packet-metadata.cc \
../forbackup/src/network/model/packet-tag-list.cc \
../forbackup/src/network/model/packet.cc \
../forbackup/src/network/model/socket-factory.cc \
../forbackup/src/network/model/socket.cc \
../forbackup/src/network/model/tag-buffer.cc \
../forbackup/src/network/model/tag.cc \
../forbackup/src/network/model/trailer.cc 

CC_DEPS += \
./forbackup/src/network/model/address.d \
./forbackup/src/network/model/application.d \
./forbackup/src/network/model/buffer.d \
./forbackup/src/network/model/byte-tag-list.d \
./forbackup/src/network/model/channel-list.d \
./forbackup/src/network/model/channel.d \
./forbackup/src/network/model/chunk.d \
./forbackup/src/network/model/header.d \
./forbackup/src/network/model/net-device.d \
./forbackup/src/network/model/nix-vector.d \
./forbackup/src/network/model/node-list.d \
./forbackup/src/network/model/node.d \
./forbackup/src/network/model/packet-metadata.d \
./forbackup/src/network/model/packet-tag-list.d \
./forbackup/src/network/model/packet.d \
./forbackup/src/network/model/socket-factory.d \
./forbackup/src/network/model/socket.d \
./forbackup/src/network/model/tag-buffer.d \
./forbackup/src/network/model/tag.d \
./forbackup/src/network/model/trailer.d 

OBJS += \
./forbackup/src/network/model/address.o \
./forbackup/src/network/model/application.o \
./forbackup/src/network/model/buffer.o \
./forbackup/src/network/model/byte-tag-list.o \
./forbackup/src/network/model/channel-list.o \
./forbackup/src/network/model/channel.o \
./forbackup/src/network/model/chunk.o \
./forbackup/src/network/model/header.o \
./forbackup/src/network/model/net-device.o \
./forbackup/src/network/model/nix-vector.o \
./forbackup/src/network/model/node-list.o \
./forbackup/src/network/model/node.o \
./forbackup/src/network/model/packet-metadata.o \
./forbackup/src/network/model/packet-tag-list.o \
./forbackup/src/network/model/packet.o \
./forbackup/src/network/model/socket-factory.o \
./forbackup/src/network/model/socket.o \
./forbackup/src/network/model/tag-buffer.o \
./forbackup/src/network/model/tag.o \
./forbackup/src/network/model/trailer.o 


# Each subdirectory must supply rules for building sources it contributes
forbackup/src/network/model/%.o: ../forbackup/src/network/model/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


