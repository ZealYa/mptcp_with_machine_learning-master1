################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../forbackup/src/spectrum/model/aloha-noack-mac-header.cc \
../forbackup/src/spectrum/model/aloha-noack-net-device.cc \
../forbackup/src/spectrum/model/constant-spectrum-propagation-loss.cc \
../forbackup/src/spectrum/model/friis-spectrum-propagation-loss.cc \
../forbackup/src/spectrum/model/half-duplex-ideal-phy-signal-parameters.cc \
../forbackup/src/spectrum/model/half-duplex-ideal-phy.cc \
../forbackup/src/spectrum/model/microwave-oven-spectrum-value-helper.cc \
../forbackup/src/spectrum/model/multi-model-spectrum-channel.cc \
../forbackup/src/spectrum/model/non-communicating-net-device.cc \
../forbackup/src/spectrum/model/single-model-spectrum-channel.cc \
../forbackup/src/spectrum/model/spectrum-analyzer.cc \
../forbackup/src/spectrum/model/spectrum-channel.cc \
../forbackup/src/spectrum/model/spectrum-converter.cc \
../forbackup/src/spectrum/model/spectrum-error-model.cc \
../forbackup/src/spectrum/model/spectrum-interference.cc \
../forbackup/src/spectrum/model/spectrum-model-300kHz-300GHz-log.cc \
../forbackup/src/spectrum/model/spectrum-model-ism2400MHz-res1MHz.cc \
../forbackup/src/spectrum/model/spectrum-model.cc \
../forbackup/src/spectrum/model/spectrum-phy.cc \
../forbackup/src/spectrum/model/spectrum-propagation-loss-model.cc \
../forbackup/src/spectrum/model/spectrum-signal-parameters.cc \
../forbackup/src/spectrum/model/spectrum-value.cc \
../forbackup/src/spectrum/model/tv-spectrum-transmitter.cc \
../forbackup/src/spectrum/model/waveform-generator.cc \
../forbackup/src/spectrum/model/wifi-spectrum-value-helper.cc 

CC_DEPS += \
./forbackup/src/spectrum/model/aloha-noack-mac-header.d \
./forbackup/src/spectrum/model/aloha-noack-net-device.d \
./forbackup/src/spectrum/model/constant-spectrum-propagation-loss.d \
./forbackup/src/spectrum/model/friis-spectrum-propagation-loss.d \
./forbackup/src/spectrum/model/half-duplex-ideal-phy-signal-parameters.d \
./forbackup/src/spectrum/model/half-duplex-ideal-phy.d \
./forbackup/src/spectrum/model/microwave-oven-spectrum-value-helper.d \
./forbackup/src/spectrum/model/multi-model-spectrum-channel.d \
./forbackup/src/spectrum/model/non-communicating-net-device.d \
./forbackup/src/spectrum/model/single-model-spectrum-channel.d \
./forbackup/src/spectrum/model/spectrum-analyzer.d \
./forbackup/src/spectrum/model/spectrum-channel.d \
./forbackup/src/spectrum/model/spectrum-converter.d \
./forbackup/src/spectrum/model/spectrum-error-model.d \
./forbackup/src/spectrum/model/spectrum-interference.d \
./forbackup/src/spectrum/model/spectrum-model-300kHz-300GHz-log.d \
./forbackup/src/spectrum/model/spectrum-model-ism2400MHz-res1MHz.d \
./forbackup/src/spectrum/model/spectrum-model.d \
./forbackup/src/spectrum/model/spectrum-phy.d \
./forbackup/src/spectrum/model/spectrum-propagation-loss-model.d \
./forbackup/src/spectrum/model/spectrum-signal-parameters.d \
./forbackup/src/spectrum/model/spectrum-value.d \
./forbackup/src/spectrum/model/tv-spectrum-transmitter.d \
./forbackup/src/spectrum/model/waveform-generator.d \
./forbackup/src/spectrum/model/wifi-spectrum-value-helper.d 

OBJS += \
./forbackup/src/spectrum/model/aloha-noack-mac-header.o \
./forbackup/src/spectrum/model/aloha-noack-net-device.o \
./forbackup/src/spectrum/model/constant-spectrum-propagation-loss.o \
./forbackup/src/spectrum/model/friis-spectrum-propagation-loss.o \
./forbackup/src/spectrum/model/half-duplex-ideal-phy-signal-parameters.o \
./forbackup/src/spectrum/model/half-duplex-ideal-phy.o \
./forbackup/src/spectrum/model/microwave-oven-spectrum-value-helper.o \
./forbackup/src/spectrum/model/multi-model-spectrum-channel.o \
./forbackup/src/spectrum/model/non-communicating-net-device.o \
./forbackup/src/spectrum/model/single-model-spectrum-channel.o \
./forbackup/src/spectrum/model/spectrum-analyzer.o \
./forbackup/src/spectrum/model/spectrum-channel.o \
./forbackup/src/spectrum/model/spectrum-converter.o \
./forbackup/src/spectrum/model/spectrum-error-model.o \
./forbackup/src/spectrum/model/spectrum-interference.o \
./forbackup/src/spectrum/model/spectrum-model-300kHz-300GHz-log.o \
./forbackup/src/spectrum/model/spectrum-model-ism2400MHz-res1MHz.o \
./forbackup/src/spectrum/model/spectrum-model.o \
./forbackup/src/spectrum/model/spectrum-phy.o \
./forbackup/src/spectrum/model/spectrum-propagation-loss-model.o \
./forbackup/src/spectrum/model/spectrum-signal-parameters.o \
./forbackup/src/spectrum/model/spectrum-value.o \
./forbackup/src/spectrum/model/tv-spectrum-transmitter.o \
./forbackup/src/spectrum/model/waveform-generator.o \
./forbackup/src/spectrum/model/wifi-spectrum-value-helper.o 


# Each subdirectory must supply rules for building sources it contributes
forbackup/src/spectrum/model/%.o: ../forbackup/src/spectrum/model/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


