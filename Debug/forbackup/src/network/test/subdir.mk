################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../forbackup/src/network/test/buffer-test.cc \
../forbackup/src/network/test/drop-tail-queue-test-suite.cc \
../forbackup/src/network/test/error-model-test-suite.cc \
../forbackup/src/network/test/ipv6-address-test-suite.cc \
../forbackup/src/network/test/packet-metadata-test.cc \
../forbackup/src/network/test/packet-socket-apps-test-suite.cc \
../forbackup/src/network/test/packet-test-suite.cc \
../forbackup/src/network/test/packetbb-test-suite.cc \
../forbackup/src/network/test/pcap-file-test-suite.cc \
../forbackup/src/network/test/sequence-number-test-suite.cc 

CC_DEPS += \
./forbackup/src/network/test/buffer-test.d \
./forbackup/src/network/test/drop-tail-queue-test-suite.d \
./forbackup/src/network/test/error-model-test-suite.d \
./forbackup/src/network/test/ipv6-address-test-suite.d \
./forbackup/src/network/test/packet-metadata-test.d \
./forbackup/src/network/test/packet-socket-apps-test-suite.d \
./forbackup/src/network/test/packet-test-suite.d \
./forbackup/src/network/test/packetbb-test-suite.d \
./forbackup/src/network/test/pcap-file-test-suite.d \
./forbackup/src/network/test/sequence-number-test-suite.d 

OBJS += \
./forbackup/src/network/test/buffer-test.o \
./forbackup/src/network/test/drop-tail-queue-test-suite.o \
./forbackup/src/network/test/error-model-test-suite.o \
./forbackup/src/network/test/ipv6-address-test-suite.o \
./forbackup/src/network/test/packet-metadata-test.o \
./forbackup/src/network/test/packet-socket-apps-test-suite.o \
./forbackup/src/network/test/packet-test-suite.o \
./forbackup/src/network/test/packetbb-test-suite.o \
./forbackup/src/network/test/pcap-file-test-suite.o \
./forbackup/src/network/test/sequence-number-test-suite.o 


# Each subdirectory must supply rules for building sources it contributes
forbackup/src/network/test/%.o: ../forbackup/src/network/test/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


