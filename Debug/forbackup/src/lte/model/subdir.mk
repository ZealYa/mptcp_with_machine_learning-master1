################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../forbackup/src/lte/model/a2-a4-rsrq-handover-algorithm.cc \
../forbackup/src/lte/model/a3-rsrp-handover-algorithm.cc \
../forbackup/src/lte/model/cqa-ff-mac-scheduler.cc \
../forbackup/src/lte/model/epc-enb-application.cc \
../forbackup/src/lte/model/epc-enb-s1-sap.cc \
../forbackup/src/lte/model/epc-gtpu-header.cc \
../forbackup/src/lte/model/epc-mme.cc \
../forbackup/src/lte/model/epc-s11-sap.cc \
../forbackup/src/lte/model/epc-s1ap-sap.cc \
../forbackup/src/lte/model/epc-sgw-pgw-application.cc \
../forbackup/src/lte/model/epc-tft-classifier.cc \
../forbackup/src/lte/model/epc-tft.cc \
../forbackup/src/lte/model/epc-ue-nas.cc \
../forbackup/src/lte/model/epc-x2-header.cc \
../forbackup/src/lte/model/epc-x2-sap.cc \
../forbackup/src/lte/model/epc-x2.cc \
../forbackup/src/lte/model/eps-bearer-tag.cc \
../forbackup/src/lte/model/eps-bearer.cc \
../forbackup/src/lte/model/fdbet-ff-mac-scheduler.cc \
../forbackup/src/lte/model/fdmt-ff-mac-scheduler.cc \
../forbackup/src/lte/model/fdtbfq-ff-mac-scheduler.cc \
../forbackup/src/lte/model/ff-mac-common.cc \
../forbackup/src/lte/model/ff-mac-csched-sap.cc \
../forbackup/src/lte/model/ff-mac-sched-sap.cc \
../forbackup/src/lte/model/ff-mac-scheduler.cc \
../forbackup/src/lte/model/lte-amc.cc \
../forbackup/src/lte/model/lte-anr-sap.cc \
../forbackup/src/lte/model/lte-anr.cc \
../forbackup/src/lte/model/lte-as-sap.cc \
../forbackup/src/lte/model/lte-asn1-header.cc \
../forbackup/src/lte/model/lte-chunk-processor.cc \
../forbackup/src/lte/model/lte-common.cc \
../forbackup/src/lte/model/lte-control-messages.cc \
../forbackup/src/lte/model/lte-enb-cmac-sap.cc \
../forbackup/src/lte/model/lte-enb-cphy-sap.cc \
../forbackup/src/lte/model/lte-enb-mac.cc \
../forbackup/src/lte/model/lte-enb-net-device.cc \
../forbackup/src/lte/model/lte-enb-phy-sap.cc \
../forbackup/src/lte/model/lte-enb-phy.cc \
../forbackup/src/lte/model/lte-enb-rrc.cc \
../forbackup/src/lte/model/lte-ffr-algorithm.cc \
../forbackup/src/lte/model/lte-ffr-distributed-algorithm.cc \
../forbackup/src/lte/model/lte-ffr-enhanced-algorithm.cc \
../forbackup/src/lte/model/lte-ffr-rrc-sap.cc \
../forbackup/src/lte/model/lte-ffr-sap.cc \
../forbackup/src/lte/model/lte-ffr-soft-algorithm.cc \
../forbackup/src/lte/model/lte-fr-hard-algorithm.cc \
../forbackup/src/lte/model/lte-fr-no-op-algorithm.cc \
../forbackup/src/lte/model/lte-fr-soft-algorithm.cc \
../forbackup/src/lte/model/lte-fr-strict-algorithm.cc \
../forbackup/src/lte/model/lte-handover-algorithm.cc \
../forbackup/src/lte/model/lte-handover-management-sap.cc \
../forbackup/src/lte/model/lte-harq-phy.cc \
../forbackup/src/lte/model/lte-interference.cc \
../forbackup/src/lte/model/lte-mac-sap.cc \
../forbackup/src/lte/model/lte-mi-error-model.cc \
../forbackup/src/lte/model/lte-net-device.cc \
../forbackup/src/lte/model/lte-pdcp-header.cc \
../forbackup/src/lte/model/lte-pdcp-sap.cc \
../forbackup/src/lte/model/lte-pdcp-tag.cc \
../forbackup/src/lte/model/lte-pdcp.cc \
../forbackup/src/lte/model/lte-phy-tag.cc \
../forbackup/src/lte/model/lte-phy.cc \
../forbackup/src/lte/model/lte-radio-bearer-info.cc \
../forbackup/src/lte/model/lte-radio-bearer-tag.cc \
../forbackup/src/lte/model/lte-rlc-am-header.cc \
../forbackup/src/lte/model/lte-rlc-am.cc \
../forbackup/src/lte/model/lte-rlc-header.cc \
../forbackup/src/lte/model/lte-rlc-sap.cc \
../forbackup/src/lte/model/lte-rlc-sdu-status-tag.cc \
../forbackup/src/lte/model/lte-rlc-sequence-number.cc \
../forbackup/src/lte/model/lte-rlc-tag.cc \
../forbackup/src/lte/model/lte-rlc-tm.cc \
../forbackup/src/lte/model/lte-rlc-um.cc \
../forbackup/src/lte/model/lte-rlc.cc \
../forbackup/src/lte/model/lte-rrc-header.cc \
../forbackup/src/lte/model/lte-rrc-protocol-ideal.cc \
../forbackup/src/lte/model/lte-rrc-protocol-real.cc \
../forbackup/src/lte/model/lte-rrc-sap.cc \
../forbackup/src/lte/model/lte-spectrum-phy.cc \
../forbackup/src/lte/model/lte-spectrum-signal-parameters.cc \
../forbackup/src/lte/model/lte-spectrum-value-helper.cc \
../forbackup/src/lte/model/lte-ue-cmac-sap.cc \
../forbackup/src/lte/model/lte-ue-cphy-sap.cc \
../forbackup/src/lte/model/lte-ue-mac.cc \
../forbackup/src/lte/model/lte-ue-net-device.cc \
../forbackup/src/lte/model/lte-ue-phy-sap.cc \
../forbackup/src/lte/model/lte-ue-phy.cc \
../forbackup/src/lte/model/lte-ue-power-control.cc \
../forbackup/src/lte/model/lte-ue-rrc.cc \
../forbackup/src/lte/model/lte-vendor-specific-parameters.cc \
../forbackup/src/lte/model/no-op-handover-algorithm.cc \
../forbackup/src/lte/model/pf-ff-mac-scheduler.cc \
../forbackup/src/lte/model/pss-ff-mac-scheduler.cc \
../forbackup/src/lte/model/rem-spectrum-phy.cc \
../forbackup/src/lte/model/rr-ff-mac-scheduler.cc \
../forbackup/src/lte/model/tdbet-ff-mac-scheduler.cc \
../forbackup/src/lte/model/tdmt-ff-mac-scheduler.cc \
../forbackup/src/lte/model/tdtbfq-ff-mac-scheduler.cc \
../forbackup/src/lte/model/trace-fading-loss-model.cc \
../forbackup/src/lte/model/tta-ff-mac-scheduler.cc 

CC_DEPS += \
./forbackup/src/lte/model/a2-a4-rsrq-handover-algorithm.d \
./forbackup/src/lte/model/a3-rsrp-handover-algorithm.d \
./forbackup/src/lte/model/cqa-ff-mac-scheduler.d \
./forbackup/src/lte/model/epc-enb-application.d \
./forbackup/src/lte/model/epc-enb-s1-sap.d \
./forbackup/src/lte/model/epc-gtpu-header.d \
./forbackup/src/lte/model/epc-mme.d \
./forbackup/src/lte/model/epc-s11-sap.d \
./forbackup/src/lte/model/epc-s1ap-sap.d \
./forbackup/src/lte/model/epc-sgw-pgw-application.d \
./forbackup/src/lte/model/epc-tft-classifier.d \
./forbackup/src/lte/model/epc-tft.d \
./forbackup/src/lte/model/epc-ue-nas.d \
./forbackup/src/lte/model/epc-x2-header.d \
./forbackup/src/lte/model/epc-x2-sap.d \
./forbackup/src/lte/model/epc-x2.d \
./forbackup/src/lte/model/eps-bearer-tag.d \
./forbackup/src/lte/model/eps-bearer.d \
./forbackup/src/lte/model/fdbet-ff-mac-scheduler.d \
./forbackup/src/lte/model/fdmt-ff-mac-scheduler.d \
./forbackup/src/lte/model/fdtbfq-ff-mac-scheduler.d \
./forbackup/src/lte/model/ff-mac-common.d \
./forbackup/src/lte/model/ff-mac-csched-sap.d \
./forbackup/src/lte/model/ff-mac-sched-sap.d \
./forbackup/src/lte/model/ff-mac-scheduler.d \
./forbackup/src/lte/model/lte-amc.d \
./forbackup/src/lte/model/lte-anr-sap.d \
./forbackup/src/lte/model/lte-anr.d \
./forbackup/src/lte/model/lte-as-sap.d \
./forbackup/src/lte/model/lte-asn1-header.d \
./forbackup/src/lte/model/lte-chunk-processor.d \
./forbackup/src/lte/model/lte-common.d \
./forbackup/src/lte/model/lte-control-messages.d \
./forbackup/src/lte/model/lte-enb-cmac-sap.d \
./forbackup/src/lte/model/lte-enb-cphy-sap.d \
./forbackup/src/lte/model/lte-enb-mac.d \
./forbackup/src/lte/model/lte-enb-net-device.d \
./forbackup/src/lte/model/lte-enb-phy-sap.d \
./forbackup/src/lte/model/lte-enb-phy.d \
./forbackup/src/lte/model/lte-enb-rrc.d \
./forbackup/src/lte/model/lte-ffr-algorithm.d \
./forbackup/src/lte/model/lte-ffr-distributed-algorithm.d \
./forbackup/src/lte/model/lte-ffr-enhanced-algorithm.d \
./forbackup/src/lte/model/lte-ffr-rrc-sap.d \
./forbackup/src/lte/model/lte-ffr-sap.d \
./forbackup/src/lte/model/lte-ffr-soft-algorithm.d \
./forbackup/src/lte/model/lte-fr-hard-algorithm.d \
./forbackup/src/lte/model/lte-fr-no-op-algorithm.d \
./forbackup/src/lte/model/lte-fr-soft-algorithm.d \
./forbackup/src/lte/model/lte-fr-strict-algorithm.d \
./forbackup/src/lte/model/lte-handover-algorithm.d \
./forbackup/src/lte/model/lte-handover-management-sap.d \
./forbackup/src/lte/model/lte-harq-phy.d \
./forbackup/src/lte/model/lte-interference.d \
./forbackup/src/lte/model/lte-mac-sap.d \
./forbackup/src/lte/model/lte-mi-error-model.d \
./forbackup/src/lte/model/lte-net-device.d \
./forbackup/src/lte/model/lte-pdcp-header.d \
./forbackup/src/lte/model/lte-pdcp-sap.d \
./forbackup/src/lte/model/lte-pdcp-tag.d \
./forbackup/src/lte/model/lte-pdcp.d \
./forbackup/src/lte/model/lte-phy-tag.d \
./forbackup/src/lte/model/lte-phy.d \
./forbackup/src/lte/model/lte-radio-bearer-info.d \
./forbackup/src/lte/model/lte-radio-bearer-tag.d \
./forbackup/src/lte/model/lte-rlc-am-header.d \
./forbackup/src/lte/model/lte-rlc-am.d \
./forbackup/src/lte/model/lte-rlc-header.d \
./forbackup/src/lte/model/lte-rlc-sap.d \
./forbackup/src/lte/model/lte-rlc-sdu-status-tag.d \
./forbackup/src/lte/model/lte-rlc-sequence-number.d \
./forbackup/src/lte/model/lte-rlc-tag.d \
./forbackup/src/lte/model/lte-rlc-tm.d \
./forbackup/src/lte/model/lte-rlc-um.d \
./forbackup/src/lte/model/lte-rlc.d \
./forbackup/src/lte/model/lte-rrc-header.d \
./forbackup/src/lte/model/lte-rrc-protocol-ideal.d \
./forbackup/src/lte/model/lte-rrc-protocol-real.d \
./forbackup/src/lte/model/lte-rrc-sap.d \
./forbackup/src/lte/model/lte-spectrum-phy.d \
./forbackup/src/lte/model/lte-spectrum-signal-parameters.d \
./forbackup/src/lte/model/lte-spectrum-value-helper.d \
./forbackup/src/lte/model/lte-ue-cmac-sap.d \
./forbackup/src/lte/model/lte-ue-cphy-sap.d \
./forbackup/src/lte/model/lte-ue-mac.d \
./forbackup/src/lte/model/lte-ue-net-device.d \
./forbackup/src/lte/model/lte-ue-phy-sap.d \
./forbackup/src/lte/model/lte-ue-phy.d \
./forbackup/src/lte/model/lte-ue-power-control.d \
./forbackup/src/lte/model/lte-ue-rrc.d \
./forbackup/src/lte/model/lte-vendor-specific-parameters.d \
./forbackup/src/lte/model/no-op-handover-algorithm.d \
./forbackup/src/lte/model/pf-ff-mac-scheduler.d \
./forbackup/src/lte/model/pss-ff-mac-scheduler.d \
./forbackup/src/lte/model/rem-spectrum-phy.d \
./forbackup/src/lte/model/rr-ff-mac-scheduler.d \
./forbackup/src/lte/model/tdbet-ff-mac-scheduler.d \
./forbackup/src/lte/model/tdmt-ff-mac-scheduler.d \
./forbackup/src/lte/model/tdtbfq-ff-mac-scheduler.d \
./forbackup/src/lte/model/trace-fading-loss-model.d \
./forbackup/src/lte/model/tta-ff-mac-scheduler.d 

OBJS += \
./forbackup/src/lte/model/a2-a4-rsrq-handover-algorithm.o \
./forbackup/src/lte/model/a3-rsrp-handover-algorithm.o \
./forbackup/src/lte/model/cqa-ff-mac-scheduler.o \
./forbackup/src/lte/model/epc-enb-application.o \
./forbackup/src/lte/model/epc-enb-s1-sap.o \
./forbackup/src/lte/model/epc-gtpu-header.o \
./forbackup/src/lte/model/epc-mme.o \
./forbackup/src/lte/model/epc-s11-sap.o \
./forbackup/src/lte/model/epc-s1ap-sap.o \
./forbackup/src/lte/model/epc-sgw-pgw-application.o \
./forbackup/src/lte/model/epc-tft-classifier.o \
./forbackup/src/lte/model/epc-tft.o \
./forbackup/src/lte/model/epc-ue-nas.o \
./forbackup/src/lte/model/epc-x2-header.o \
./forbackup/src/lte/model/epc-x2-sap.o \
./forbackup/src/lte/model/epc-x2.o \
./forbackup/src/lte/model/eps-bearer-tag.o \
./forbackup/src/lte/model/eps-bearer.o \
./forbackup/src/lte/model/fdbet-ff-mac-scheduler.o \
./forbackup/src/lte/model/fdmt-ff-mac-scheduler.o \
./forbackup/src/lte/model/fdtbfq-ff-mac-scheduler.o \
./forbackup/src/lte/model/ff-mac-common.o \
./forbackup/src/lte/model/ff-mac-csched-sap.o \
./forbackup/src/lte/model/ff-mac-sched-sap.o \
./forbackup/src/lte/model/ff-mac-scheduler.o \
./forbackup/src/lte/model/lte-amc.o \
./forbackup/src/lte/model/lte-anr-sap.o \
./forbackup/src/lte/model/lte-anr.o \
./forbackup/src/lte/model/lte-as-sap.o \
./forbackup/src/lte/model/lte-asn1-header.o \
./forbackup/src/lte/model/lte-chunk-processor.o \
./forbackup/src/lte/model/lte-common.o \
./forbackup/src/lte/model/lte-control-messages.o \
./forbackup/src/lte/model/lte-enb-cmac-sap.o \
./forbackup/src/lte/model/lte-enb-cphy-sap.o \
./forbackup/src/lte/model/lte-enb-mac.o \
./forbackup/src/lte/model/lte-enb-net-device.o \
./forbackup/src/lte/model/lte-enb-phy-sap.o \
./forbackup/src/lte/model/lte-enb-phy.o \
./forbackup/src/lte/model/lte-enb-rrc.o \
./forbackup/src/lte/model/lte-ffr-algorithm.o \
./forbackup/src/lte/model/lte-ffr-distributed-algorithm.o \
./forbackup/src/lte/model/lte-ffr-enhanced-algorithm.o \
./forbackup/src/lte/model/lte-ffr-rrc-sap.o \
./forbackup/src/lte/model/lte-ffr-sap.o \
./forbackup/src/lte/model/lte-ffr-soft-algorithm.o \
./forbackup/src/lte/model/lte-fr-hard-algorithm.o \
./forbackup/src/lte/model/lte-fr-no-op-algorithm.o \
./forbackup/src/lte/model/lte-fr-soft-algorithm.o \
./forbackup/src/lte/model/lte-fr-strict-algorithm.o \
./forbackup/src/lte/model/lte-handover-algorithm.o \
./forbackup/src/lte/model/lte-handover-management-sap.o \
./forbackup/src/lte/model/lte-harq-phy.o \
./forbackup/src/lte/model/lte-interference.o \
./forbackup/src/lte/model/lte-mac-sap.o \
./forbackup/src/lte/model/lte-mi-error-model.o \
./forbackup/src/lte/model/lte-net-device.o \
./forbackup/src/lte/model/lte-pdcp-header.o \
./forbackup/src/lte/model/lte-pdcp-sap.o \
./forbackup/src/lte/model/lte-pdcp-tag.o \
./forbackup/src/lte/model/lte-pdcp.o \
./forbackup/src/lte/model/lte-phy-tag.o \
./forbackup/src/lte/model/lte-phy.o \
./forbackup/src/lte/model/lte-radio-bearer-info.o \
./forbackup/src/lte/model/lte-radio-bearer-tag.o \
./forbackup/src/lte/model/lte-rlc-am-header.o \
./forbackup/src/lte/model/lte-rlc-am.o \
./forbackup/src/lte/model/lte-rlc-header.o \
./forbackup/src/lte/model/lte-rlc-sap.o \
./forbackup/src/lte/model/lte-rlc-sdu-status-tag.o \
./forbackup/src/lte/model/lte-rlc-sequence-number.o \
./forbackup/src/lte/model/lte-rlc-tag.o \
./forbackup/src/lte/model/lte-rlc-tm.o \
./forbackup/src/lte/model/lte-rlc-um.o \
./forbackup/src/lte/model/lte-rlc.o \
./forbackup/src/lte/model/lte-rrc-header.o \
./forbackup/src/lte/model/lte-rrc-protocol-ideal.o \
./forbackup/src/lte/model/lte-rrc-protocol-real.o \
./forbackup/src/lte/model/lte-rrc-sap.o \
./forbackup/src/lte/model/lte-spectrum-phy.o \
./forbackup/src/lte/model/lte-spectrum-signal-parameters.o \
./forbackup/src/lte/model/lte-spectrum-value-helper.o \
./forbackup/src/lte/model/lte-ue-cmac-sap.o \
./forbackup/src/lte/model/lte-ue-cphy-sap.o \
./forbackup/src/lte/model/lte-ue-mac.o \
./forbackup/src/lte/model/lte-ue-net-device.o \
./forbackup/src/lte/model/lte-ue-phy-sap.o \
./forbackup/src/lte/model/lte-ue-phy.o \
./forbackup/src/lte/model/lte-ue-power-control.o \
./forbackup/src/lte/model/lte-ue-rrc.o \
./forbackup/src/lte/model/lte-vendor-specific-parameters.o \
./forbackup/src/lte/model/no-op-handover-algorithm.o \
./forbackup/src/lte/model/pf-ff-mac-scheduler.o \
./forbackup/src/lte/model/pss-ff-mac-scheduler.o \
./forbackup/src/lte/model/rem-spectrum-phy.o \
./forbackup/src/lte/model/rr-ff-mac-scheduler.o \
./forbackup/src/lte/model/tdbet-ff-mac-scheduler.o \
./forbackup/src/lte/model/tdmt-ff-mac-scheduler.o \
./forbackup/src/lte/model/tdtbfq-ff-mac-scheduler.o \
./forbackup/src/lte/model/trace-fading-loss-model.o \
./forbackup/src/lte/model/tta-ff-mac-scheduler.o 


# Each subdirectory must supply rules for building sources it contributes
forbackup/src/lte/model/%.o: ../forbackup/src/lte/model/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

