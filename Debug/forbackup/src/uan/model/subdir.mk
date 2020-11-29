################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../forbackup/src/uan/model/acoustic-modem-energy-model.cc \
../forbackup/src/uan/model/uan-address.cc \
../forbackup/src/uan/model/uan-channel.cc \
../forbackup/src/uan/model/uan-header-common.cc \
../forbackup/src/uan/model/uan-header-rc.cc \
../forbackup/src/uan/model/uan-mac-aloha.cc \
../forbackup/src/uan/model/uan-mac-cw.cc \
../forbackup/src/uan/model/uan-mac-rc-gw.cc \
../forbackup/src/uan/model/uan-mac-rc.cc \
../forbackup/src/uan/model/uan-mac.cc \
../forbackup/src/uan/model/uan-net-device.cc \
../forbackup/src/uan/model/uan-noise-model-default.cc \
../forbackup/src/uan/model/uan-noise-model.cc \
../forbackup/src/uan/model/uan-phy-dual.cc \
../forbackup/src/uan/model/uan-phy-gen.cc \
../forbackup/src/uan/model/uan-phy.cc \
../forbackup/src/uan/model/uan-prop-model-ideal.cc \
../forbackup/src/uan/model/uan-prop-model-thorp.cc \
../forbackup/src/uan/model/uan-prop-model.cc \
../forbackup/src/uan/model/uan-transducer-hd.cc \
../forbackup/src/uan/model/uan-transducer.cc \
../forbackup/src/uan/model/uan-tx-mode.cc 

CC_DEPS += \
./forbackup/src/uan/model/acoustic-modem-energy-model.d \
./forbackup/src/uan/model/uan-address.d \
./forbackup/src/uan/model/uan-channel.d \
./forbackup/src/uan/model/uan-header-common.d \
./forbackup/src/uan/model/uan-header-rc.d \
./forbackup/src/uan/model/uan-mac-aloha.d \
./forbackup/src/uan/model/uan-mac-cw.d \
./forbackup/src/uan/model/uan-mac-rc-gw.d \
./forbackup/src/uan/model/uan-mac-rc.d \
./forbackup/src/uan/model/uan-mac.d \
./forbackup/src/uan/model/uan-net-device.d \
./forbackup/src/uan/model/uan-noise-model-default.d \
./forbackup/src/uan/model/uan-noise-model.d \
./forbackup/src/uan/model/uan-phy-dual.d \
./forbackup/src/uan/model/uan-phy-gen.d \
./forbackup/src/uan/model/uan-phy.d \
./forbackup/src/uan/model/uan-prop-model-ideal.d \
./forbackup/src/uan/model/uan-prop-model-thorp.d \
./forbackup/src/uan/model/uan-prop-model.d \
./forbackup/src/uan/model/uan-transducer-hd.d \
./forbackup/src/uan/model/uan-transducer.d \
./forbackup/src/uan/model/uan-tx-mode.d 

OBJS += \
./forbackup/src/uan/model/acoustic-modem-energy-model.o \
./forbackup/src/uan/model/uan-address.o \
./forbackup/src/uan/model/uan-channel.o \
./forbackup/src/uan/model/uan-header-common.o \
./forbackup/src/uan/model/uan-header-rc.o \
./forbackup/src/uan/model/uan-mac-aloha.o \
./forbackup/src/uan/model/uan-mac-cw.o \
./forbackup/src/uan/model/uan-mac-rc-gw.o \
./forbackup/src/uan/model/uan-mac-rc.o \
./forbackup/src/uan/model/uan-mac.o \
./forbackup/src/uan/model/uan-net-device.o \
./forbackup/src/uan/model/uan-noise-model-default.o \
./forbackup/src/uan/model/uan-noise-model.o \
./forbackup/src/uan/model/uan-phy-dual.o \
./forbackup/src/uan/model/uan-phy-gen.o \
./forbackup/src/uan/model/uan-phy.o \
./forbackup/src/uan/model/uan-prop-model-ideal.o \
./forbackup/src/uan/model/uan-prop-model-thorp.o \
./forbackup/src/uan/model/uan-prop-model.o \
./forbackup/src/uan/model/uan-transducer-hd.o \
./forbackup/src/uan/model/uan-transducer.o \
./forbackup/src/uan/model/uan-tx-mode.o 


# Each subdirectory must supply rules for building sources it contributes
forbackup/src/uan/model/%.o: ../forbackup/src/uan/model/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


