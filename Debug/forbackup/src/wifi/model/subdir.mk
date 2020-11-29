################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../forbackup/src/wifi/model/aarf-wifi-manager.cc \
../forbackup/src/wifi/model/aarfcd-wifi-manager.cc \
../forbackup/src/wifi/model/adhoc-wifi-mac.cc \
../forbackup/src/wifi/model/ampdu-subframe-header.cc \
../forbackup/src/wifi/model/ampdu-tag.cc \
../forbackup/src/wifi/model/amrr-wifi-manager.cc \
../forbackup/src/wifi/model/amsdu-subframe-header.cc \
../forbackup/src/wifi/model/ap-wifi-mac.cc \
../forbackup/src/wifi/model/aparf-wifi-manager.cc \
../forbackup/src/wifi/model/arf-wifi-manager.cc \
../forbackup/src/wifi/model/block-ack-agreement.cc \
../forbackup/src/wifi/model/block-ack-cache.cc \
../forbackup/src/wifi/model/block-ack-manager.cc \
../forbackup/src/wifi/model/capability-information.cc \
../forbackup/src/wifi/model/cara-wifi-manager.cc \
../forbackup/src/wifi/model/constant-rate-wifi-manager.cc \
../forbackup/src/wifi/model/ctrl-headers.cc \
../forbackup/src/wifi/model/dca-txop.cc \
../forbackup/src/wifi/model/dcf-manager.cc \
../forbackup/src/wifi/model/dcf.cc \
../forbackup/src/wifi/model/dsss-error-rate-model.cc \
../forbackup/src/wifi/model/edca-parameter-set.cc \
../forbackup/src/wifi/model/edca-txop-n.cc \
../forbackup/src/wifi/model/erp-information.cc \
../forbackup/src/wifi/model/error-rate-model.cc \
../forbackup/src/wifi/model/ht-capabilities.cc \
../forbackup/src/wifi/model/ht-operations.cc \
../forbackup/src/wifi/model/ideal-wifi-manager.cc \
../forbackup/src/wifi/model/interference-helper.cc \
../forbackup/src/wifi/model/mac-low.cc \
../forbackup/src/wifi/model/mac-rx-middle.cc \
../forbackup/src/wifi/model/mac-tx-middle.cc \
../forbackup/src/wifi/model/mgt-headers.cc \
../forbackup/src/wifi/model/minstrel-ht-wifi-manager.cc \
../forbackup/src/wifi/model/minstrel-wifi-manager.cc \
../forbackup/src/wifi/model/mpdu-aggregator.cc \
../forbackup/src/wifi/model/mpdu-standard-aggregator.cc \
../forbackup/src/wifi/model/msdu-aggregator.cc \
../forbackup/src/wifi/model/msdu-standard-aggregator.cc \
../forbackup/src/wifi/model/nist-error-rate-model.cc \
../forbackup/src/wifi/model/onoe-wifi-manager.cc \
../forbackup/src/wifi/model/originator-block-ack-agreement.cc \
../forbackup/src/wifi/model/parf-wifi-manager.cc \
../forbackup/src/wifi/model/qos-blocked-destinations.cc \
../forbackup/src/wifi/model/qos-utils.cc \
../forbackup/src/wifi/model/random-stream.cc \
../forbackup/src/wifi/model/regular-wifi-mac.cc \
../forbackup/src/wifi/model/rraa-wifi-manager.cc \
../forbackup/src/wifi/model/snr-tag.cc \
../forbackup/src/wifi/model/ssid.cc \
../forbackup/src/wifi/model/sta-wifi-mac.cc \
../forbackup/src/wifi/model/status-code.cc \
../forbackup/src/wifi/model/supported-rates.cc \
../forbackup/src/wifi/model/vht-capabilities.cc \
../forbackup/src/wifi/model/wifi-channel.cc \
../forbackup/src/wifi/model/wifi-information-element-vector.cc \
../forbackup/src/wifi/model/wifi-information-element.cc \
../forbackup/src/wifi/model/wifi-mac-header.cc \
../forbackup/src/wifi/model/wifi-mac-queue.cc \
../forbackup/src/wifi/model/wifi-mac-trailer.cc \
../forbackup/src/wifi/model/wifi-mac.cc \
../forbackup/src/wifi/model/wifi-mode.cc \
../forbackup/src/wifi/model/wifi-net-device.cc \
../forbackup/src/wifi/model/wifi-phy-state-helper.cc \
../forbackup/src/wifi/model/wifi-phy.cc \
../forbackup/src/wifi/model/wifi-radio-energy-model.cc \
../forbackup/src/wifi/model/wifi-remote-station-manager.cc \
../forbackup/src/wifi/model/wifi-tx-current-model.cc \
../forbackup/src/wifi/model/wifi-tx-vector.cc \
../forbackup/src/wifi/model/yans-error-rate-model.cc \
../forbackup/src/wifi/model/yans-wifi-channel.cc \
../forbackup/src/wifi/model/yans-wifi-phy.cc 

CC_DEPS += \
./forbackup/src/wifi/model/aarf-wifi-manager.d \
./forbackup/src/wifi/model/aarfcd-wifi-manager.d \
./forbackup/src/wifi/model/adhoc-wifi-mac.d \
./forbackup/src/wifi/model/ampdu-subframe-header.d \
./forbackup/src/wifi/model/ampdu-tag.d \
./forbackup/src/wifi/model/amrr-wifi-manager.d \
./forbackup/src/wifi/model/amsdu-subframe-header.d \
./forbackup/src/wifi/model/ap-wifi-mac.d \
./forbackup/src/wifi/model/aparf-wifi-manager.d \
./forbackup/src/wifi/model/arf-wifi-manager.d \
./forbackup/src/wifi/model/block-ack-agreement.d \
./forbackup/src/wifi/model/block-ack-cache.d \
./forbackup/src/wifi/model/block-ack-manager.d \
./forbackup/src/wifi/model/capability-information.d \
./forbackup/src/wifi/model/cara-wifi-manager.d \
./forbackup/src/wifi/model/constant-rate-wifi-manager.d \
./forbackup/src/wifi/model/ctrl-headers.d \
./forbackup/src/wifi/model/dca-txop.d \
./forbackup/src/wifi/model/dcf-manager.d \
./forbackup/src/wifi/model/dcf.d \
./forbackup/src/wifi/model/dsss-error-rate-model.d \
./forbackup/src/wifi/model/edca-parameter-set.d \
./forbackup/src/wifi/model/edca-txop-n.d \
./forbackup/src/wifi/model/erp-information.d \
./forbackup/src/wifi/model/error-rate-model.d \
./forbackup/src/wifi/model/ht-capabilities.d \
./forbackup/src/wifi/model/ht-operations.d \
./forbackup/src/wifi/model/ideal-wifi-manager.d \
./forbackup/src/wifi/model/interference-helper.d \
./forbackup/src/wifi/model/mac-low.d \
./forbackup/src/wifi/model/mac-rx-middle.d \
./forbackup/src/wifi/model/mac-tx-middle.d \
./forbackup/src/wifi/model/mgt-headers.d \
./forbackup/src/wifi/model/minstrel-ht-wifi-manager.d \
./forbackup/src/wifi/model/minstrel-wifi-manager.d \
./forbackup/src/wifi/model/mpdu-aggregator.d \
./forbackup/src/wifi/model/mpdu-standard-aggregator.d \
./forbackup/src/wifi/model/msdu-aggregator.d \
./forbackup/src/wifi/model/msdu-standard-aggregator.d \
./forbackup/src/wifi/model/nist-error-rate-model.d \
./forbackup/src/wifi/model/onoe-wifi-manager.d \
./forbackup/src/wifi/model/originator-block-ack-agreement.d \
./forbackup/src/wifi/model/parf-wifi-manager.d \
./forbackup/src/wifi/model/qos-blocked-destinations.d \
./forbackup/src/wifi/model/qos-utils.d \
./forbackup/src/wifi/model/random-stream.d \
./forbackup/src/wifi/model/regular-wifi-mac.d \
./forbackup/src/wifi/model/rraa-wifi-manager.d \
./forbackup/src/wifi/model/snr-tag.d \
./forbackup/src/wifi/model/ssid.d \
./forbackup/src/wifi/model/sta-wifi-mac.d \
./forbackup/src/wifi/model/status-code.d \
./forbackup/src/wifi/model/supported-rates.d \
./forbackup/src/wifi/model/vht-capabilities.d \
./forbackup/src/wifi/model/wifi-channel.d \
./forbackup/src/wifi/model/wifi-information-element-vector.d \
./forbackup/src/wifi/model/wifi-information-element.d \
./forbackup/src/wifi/model/wifi-mac-header.d \
./forbackup/src/wifi/model/wifi-mac-queue.d \
./forbackup/src/wifi/model/wifi-mac-trailer.d \
./forbackup/src/wifi/model/wifi-mac.d \
./forbackup/src/wifi/model/wifi-mode.d \
./forbackup/src/wifi/model/wifi-net-device.d \
./forbackup/src/wifi/model/wifi-phy-state-helper.d \
./forbackup/src/wifi/model/wifi-phy.d \
./forbackup/src/wifi/model/wifi-radio-energy-model.d \
./forbackup/src/wifi/model/wifi-remote-station-manager.d \
./forbackup/src/wifi/model/wifi-tx-current-model.d \
./forbackup/src/wifi/model/wifi-tx-vector.d \
./forbackup/src/wifi/model/yans-error-rate-model.d \
./forbackup/src/wifi/model/yans-wifi-channel.d \
./forbackup/src/wifi/model/yans-wifi-phy.d 

OBJS += \
./forbackup/src/wifi/model/aarf-wifi-manager.o \
./forbackup/src/wifi/model/aarfcd-wifi-manager.o \
./forbackup/src/wifi/model/adhoc-wifi-mac.o \
./forbackup/src/wifi/model/ampdu-subframe-header.o \
./forbackup/src/wifi/model/ampdu-tag.o \
./forbackup/src/wifi/model/amrr-wifi-manager.o \
./forbackup/src/wifi/model/amsdu-subframe-header.o \
./forbackup/src/wifi/model/ap-wifi-mac.o \
./forbackup/src/wifi/model/aparf-wifi-manager.o \
./forbackup/src/wifi/model/arf-wifi-manager.o \
./forbackup/src/wifi/model/block-ack-agreement.o \
./forbackup/src/wifi/model/block-ack-cache.o \
./forbackup/src/wifi/model/block-ack-manager.o \
./forbackup/src/wifi/model/capability-information.o \
./forbackup/src/wifi/model/cara-wifi-manager.o \
./forbackup/src/wifi/model/constant-rate-wifi-manager.o \
./forbackup/src/wifi/model/ctrl-headers.o \
./forbackup/src/wifi/model/dca-txop.o \
./forbackup/src/wifi/model/dcf-manager.o \
./forbackup/src/wifi/model/dcf.o \
./forbackup/src/wifi/model/dsss-error-rate-model.o \
./forbackup/src/wifi/model/edca-parameter-set.o \
./forbackup/src/wifi/model/edca-txop-n.o \
./forbackup/src/wifi/model/erp-information.o \
./forbackup/src/wifi/model/error-rate-model.o \
./forbackup/src/wifi/model/ht-capabilities.o \
./forbackup/src/wifi/model/ht-operations.o \
./forbackup/src/wifi/model/ideal-wifi-manager.o \
./forbackup/src/wifi/model/interference-helper.o \
./forbackup/src/wifi/model/mac-low.o \
./forbackup/src/wifi/model/mac-rx-middle.o \
./forbackup/src/wifi/model/mac-tx-middle.o \
./forbackup/src/wifi/model/mgt-headers.o \
./forbackup/src/wifi/model/minstrel-ht-wifi-manager.o \
./forbackup/src/wifi/model/minstrel-wifi-manager.o \
./forbackup/src/wifi/model/mpdu-aggregator.o \
./forbackup/src/wifi/model/mpdu-standard-aggregator.o \
./forbackup/src/wifi/model/msdu-aggregator.o \
./forbackup/src/wifi/model/msdu-standard-aggregator.o \
./forbackup/src/wifi/model/nist-error-rate-model.o \
./forbackup/src/wifi/model/onoe-wifi-manager.o \
./forbackup/src/wifi/model/originator-block-ack-agreement.o \
./forbackup/src/wifi/model/parf-wifi-manager.o \
./forbackup/src/wifi/model/qos-blocked-destinations.o \
./forbackup/src/wifi/model/qos-utils.o \
./forbackup/src/wifi/model/random-stream.o \
./forbackup/src/wifi/model/regular-wifi-mac.o \
./forbackup/src/wifi/model/rraa-wifi-manager.o \
./forbackup/src/wifi/model/snr-tag.o \
./forbackup/src/wifi/model/ssid.o \
./forbackup/src/wifi/model/sta-wifi-mac.o \
./forbackup/src/wifi/model/status-code.o \
./forbackup/src/wifi/model/supported-rates.o \
./forbackup/src/wifi/model/vht-capabilities.o \
./forbackup/src/wifi/model/wifi-channel.o \
./forbackup/src/wifi/model/wifi-information-element-vector.o \
./forbackup/src/wifi/model/wifi-information-element.o \
./forbackup/src/wifi/model/wifi-mac-header.o \
./forbackup/src/wifi/model/wifi-mac-queue.o \
./forbackup/src/wifi/model/wifi-mac-trailer.o \
./forbackup/src/wifi/model/wifi-mac.o \
./forbackup/src/wifi/model/wifi-mode.o \
./forbackup/src/wifi/model/wifi-net-device.o \
./forbackup/src/wifi/model/wifi-phy-state-helper.o \
./forbackup/src/wifi/model/wifi-phy.o \
./forbackup/src/wifi/model/wifi-radio-energy-model.o \
./forbackup/src/wifi/model/wifi-remote-station-manager.o \
./forbackup/src/wifi/model/wifi-tx-current-model.o \
./forbackup/src/wifi/model/wifi-tx-vector.o \
./forbackup/src/wifi/model/yans-error-rate-model.o \
./forbackup/src/wifi/model/yans-wifi-channel.o \
./forbackup/src/wifi/model/yans-wifi-phy.o 


# Each subdirectory must supply rules for building sources it contributes
forbackup/src/wifi/model/%.o: ../forbackup/src/wifi/model/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


