################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../forbackup/src/wimax/model/bandwidth-manager.cc \
../forbackup/src/wimax/model/bs-link-manager.cc \
../forbackup/src/wimax/model/bs-net-device.cc \
../forbackup/src/wimax/model/bs-scheduler-rtps.cc \
../forbackup/src/wimax/model/bs-scheduler-simple.cc \
../forbackup/src/wimax/model/bs-scheduler.cc \
../forbackup/src/wimax/model/bs-service-flow-manager.cc \
../forbackup/src/wimax/model/bs-uplink-scheduler-mbqos.cc \
../forbackup/src/wimax/model/bs-uplink-scheduler-rtps.cc \
../forbackup/src/wimax/model/bs-uplink-scheduler-simple.cc \
../forbackup/src/wimax/model/bs-uplink-scheduler.cc \
../forbackup/src/wimax/model/burst-profile-manager.cc \
../forbackup/src/wimax/model/cid-factory.cc \
../forbackup/src/wimax/model/cid.cc \
../forbackup/src/wimax/model/connection-manager.cc \
../forbackup/src/wimax/model/crc8.cc \
../forbackup/src/wimax/model/cs-parameters.cc \
../forbackup/src/wimax/model/dl-mac-messages.cc \
../forbackup/src/wimax/model/ipcs-classifier-record.cc \
../forbackup/src/wimax/model/ipcs-classifier.cc \
../forbackup/src/wimax/model/mac-messages.cc \
../forbackup/src/wimax/model/ofdm-downlink-frame-prefix.cc \
../forbackup/src/wimax/model/send-params.cc \
../forbackup/src/wimax/model/service-flow-manager.cc \
../forbackup/src/wimax/model/service-flow-record.cc \
../forbackup/src/wimax/model/service-flow.cc \
../forbackup/src/wimax/model/simple-ofdm-send-param.cc \
../forbackup/src/wimax/model/simple-ofdm-wimax-channel.cc \
../forbackup/src/wimax/model/simple-ofdm-wimax-phy.cc \
../forbackup/src/wimax/model/snr-to-block-error-rate-manager.cc \
../forbackup/src/wimax/model/snr-to-block-error-rate-record.cc \
../forbackup/src/wimax/model/ss-link-manager.cc \
../forbackup/src/wimax/model/ss-manager.cc \
../forbackup/src/wimax/model/ss-net-device.cc \
../forbackup/src/wimax/model/ss-record.cc \
../forbackup/src/wimax/model/ss-scheduler.cc \
../forbackup/src/wimax/model/ss-service-flow-manager.cc \
../forbackup/src/wimax/model/ul-job.cc \
../forbackup/src/wimax/model/ul-mac-messages.cc \
../forbackup/src/wimax/model/wimax-channel.cc \
../forbackup/src/wimax/model/wimax-connection.cc \
../forbackup/src/wimax/model/wimax-mac-header.cc \
../forbackup/src/wimax/model/wimax-mac-queue.cc \
../forbackup/src/wimax/model/wimax-mac-to-mac-header.cc \
../forbackup/src/wimax/model/wimax-net-device.cc \
../forbackup/src/wimax/model/wimax-phy.cc \
../forbackup/src/wimax/model/wimax-tlv.cc 

CC_DEPS += \
./forbackup/src/wimax/model/bandwidth-manager.d \
./forbackup/src/wimax/model/bs-link-manager.d \
./forbackup/src/wimax/model/bs-net-device.d \
./forbackup/src/wimax/model/bs-scheduler-rtps.d \
./forbackup/src/wimax/model/bs-scheduler-simple.d \
./forbackup/src/wimax/model/bs-scheduler.d \
./forbackup/src/wimax/model/bs-service-flow-manager.d \
./forbackup/src/wimax/model/bs-uplink-scheduler-mbqos.d \
./forbackup/src/wimax/model/bs-uplink-scheduler-rtps.d \
./forbackup/src/wimax/model/bs-uplink-scheduler-simple.d \
./forbackup/src/wimax/model/bs-uplink-scheduler.d \
./forbackup/src/wimax/model/burst-profile-manager.d \
./forbackup/src/wimax/model/cid-factory.d \
./forbackup/src/wimax/model/cid.d \
./forbackup/src/wimax/model/connection-manager.d \
./forbackup/src/wimax/model/crc8.d \
./forbackup/src/wimax/model/cs-parameters.d \
./forbackup/src/wimax/model/dl-mac-messages.d \
./forbackup/src/wimax/model/ipcs-classifier-record.d \
./forbackup/src/wimax/model/ipcs-classifier.d \
./forbackup/src/wimax/model/mac-messages.d \
./forbackup/src/wimax/model/ofdm-downlink-frame-prefix.d \
./forbackup/src/wimax/model/send-params.d \
./forbackup/src/wimax/model/service-flow-manager.d \
./forbackup/src/wimax/model/service-flow-record.d \
./forbackup/src/wimax/model/service-flow.d \
./forbackup/src/wimax/model/simple-ofdm-send-param.d \
./forbackup/src/wimax/model/simple-ofdm-wimax-channel.d \
./forbackup/src/wimax/model/simple-ofdm-wimax-phy.d \
./forbackup/src/wimax/model/snr-to-block-error-rate-manager.d \
./forbackup/src/wimax/model/snr-to-block-error-rate-record.d \
./forbackup/src/wimax/model/ss-link-manager.d \
./forbackup/src/wimax/model/ss-manager.d \
./forbackup/src/wimax/model/ss-net-device.d \
./forbackup/src/wimax/model/ss-record.d \
./forbackup/src/wimax/model/ss-scheduler.d \
./forbackup/src/wimax/model/ss-service-flow-manager.d \
./forbackup/src/wimax/model/ul-job.d \
./forbackup/src/wimax/model/ul-mac-messages.d \
./forbackup/src/wimax/model/wimax-channel.d \
./forbackup/src/wimax/model/wimax-connection.d \
./forbackup/src/wimax/model/wimax-mac-header.d \
./forbackup/src/wimax/model/wimax-mac-queue.d \
./forbackup/src/wimax/model/wimax-mac-to-mac-header.d \
./forbackup/src/wimax/model/wimax-net-device.d \
./forbackup/src/wimax/model/wimax-phy.d \
./forbackup/src/wimax/model/wimax-tlv.d 

OBJS += \
./forbackup/src/wimax/model/bandwidth-manager.o \
./forbackup/src/wimax/model/bs-link-manager.o \
./forbackup/src/wimax/model/bs-net-device.o \
./forbackup/src/wimax/model/bs-scheduler-rtps.o \
./forbackup/src/wimax/model/bs-scheduler-simple.o \
./forbackup/src/wimax/model/bs-scheduler.o \
./forbackup/src/wimax/model/bs-service-flow-manager.o \
./forbackup/src/wimax/model/bs-uplink-scheduler-mbqos.o \
./forbackup/src/wimax/model/bs-uplink-scheduler-rtps.o \
./forbackup/src/wimax/model/bs-uplink-scheduler-simple.o \
./forbackup/src/wimax/model/bs-uplink-scheduler.o \
./forbackup/src/wimax/model/burst-profile-manager.o \
./forbackup/src/wimax/model/cid-factory.o \
./forbackup/src/wimax/model/cid.o \
./forbackup/src/wimax/model/connection-manager.o \
./forbackup/src/wimax/model/crc8.o \
./forbackup/src/wimax/model/cs-parameters.o \
./forbackup/src/wimax/model/dl-mac-messages.o \
./forbackup/src/wimax/model/ipcs-classifier-record.o \
./forbackup/src/wimax/model/ipcs-classifier.o \
./forbackup/src/wimax/model/mac-messages.o \
./forbackup/src/wimax/model/ofdm-downlink-frame-prefix.o \
./forbackup/src/wimax/model/send-params.o \
./forbackup/src/wimax/model/service-flow-manager.o \
./forbackup/src/wimax/model/service-flow-record.o \
./forbackup/src/wimax/model/service-flow.o \
./forbackup/src/wimax/model/simple-ofdm-send-param.o \
./forbackup/src/wimax/model/simple-ofdm-wimax-channel.o \
./forbackup/src/wimax/model/simple-ofdm-wimax-phy.o \
./forbackup/src/wimax/model/snr-to-block-error-rate-manager.o \
./forbackup/src/wimax/model/snr-to-block-error-rate-record.o \
./forbackup/src/wimax/model/ss-link-manager.o \
./forbackup/src/wimax/model/ss-manager.o \
./forbackup/src/wimax/model/ss-net-device.o \
./forbackup/src/wimax/model/ss-record.o \
./forbackup/src/wimax/model/ss-scheduler.o \
./forbackup/src/wimax/model/ss-service-flow-manager.o \
./forbackup/src/wimax/model/ul-job.o \
./forbackup/src/wimax/model/ul-mac-messages.o \
./forbackup/src/wimax/model/wimax-channel.o \
./forbackup/src/wimax/model/wimax-connection.o \
./forbackup/src/wimax/model/wimax-mac-header.o \
./forbackup/src/wimax/model/wimax-mac-queue.o \
./forbackup/src/wimax/model/wimax-mac-to-mac-header.o \
./forbackup/src/wimax/model/wimax-net-device.o \
./forbackup/src/wimax/model/wimax-phy.o \
./forbackup/src/wimax/model/wimax-tlv.o 


# Each subdirectory must supply rules for building sources it contributes
forbackup/src/wimax/model/%.o: ../forbackup/src/wimax/model/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


