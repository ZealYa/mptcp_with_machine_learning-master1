################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../forbackup/src/mesh/model/dot11s/airtime-metric.cc \
../forbackup/src/mesh/model/dot11s/dot11s-mac-header.cc \
../forbackup/src/mesh/model/dot11s/hwmp-protocol-mac.cc \
../forbackup/src/mesh/model/dot11s/hwmp-protocol.cc \
../forbackup/src/mesh/model/dot11s/hwmp-rtable.cc \
../forbackup/src/mesh/model/dot11s/hwmp-tag.cc \
../forbackup/src/mesh/model/dot11s/ie-dot11s-beacon-timing.cc \
../forbackup/src/mesh/model/dot11s/ie-dot11s-configuration.cc \
../forbackup/src/mesh/model/dot11s/ie-dot11s-id.cc \
../forbackup/src/mesh/model/dot11s/ie-dot11s-metric-report.cc \
../forbackup/src/mesh/model/dot11s/ie-dot11s-peer-management.cc \
../forbackup/src/mesh/model/dot11s/ie-dot11s-peering-protocol.cc \
../forbackup/src/mesh/model/dot11s/ie-dot11s-perr.cc \
../forbackup/src/mesh/model/dot11s/ie-dot11s-prep.cc \
../forbackup/src/mesh/model/dot11s/ie-dot11s-preq.cc \
../forbackup/src/mesh/model/dot11s/ie-dot11s-rann.cc \
../forbackup/src/mesh/model/dot11s/peer-link-frame.cc \
../forbackup/src/mesh/model/dot11s/peer-link.cc \
../forbackup/src/mesh/model/dot11s/peer-management-protocol-mac.cc \
../forbackup/src/mesh/model/dot11s/peer-management-protocol.cc 

CC_DEPS += \
./forbackup/src/mesh/model/dot11s/airtime-metric.d \
./forbackup/src/mesh/model/dot11s/dot11s-mac-header.d \
./forbackup/src/mesh/model/dot11s/hwmp-protocol-mac.d \
./forbackup/src/mesh/model/dot11s/hwmp-protocol.d \
./forbackup/src/mesh/model/dot11s/hwmp-rtable.d \
./forbackup/src/mesh/model/dot11s/hwmp-tag.d \
./forbackup/src/mesh/model/dot11s/ie-dot11s-beacon-timing.d \
./forbackup/src/mesh/model/dot11s/ie-dot11s-configuration.d \
./forbackup/src/mesh/model/dot11s/ie-dot11s-id.d \
./forbackup/src/mesh/model/dot11s/ie-dot11s-metric-report.d \
./forbackup/src/mesh/model/dot11s/ie-dot11s-peer-management.d \
./forbackup/src/mesh/model/dot11s/ie-dot11s-peering-protocol.d \
./forbackup/src/mesh/model/dot11s/ie-dot11s-perr.d \
./forbackup/src/mesh/model/dot11s/ie-dot11s-prep.d \
./forbackup/src/mesh/model/dot11s/ie-dot11s-preq.d \
./forbackup/src/mesh/model/dot11s/ie-dot11s-rann.d \
./forbackup/src/mesh/model/dot11s/peer-link-frame.d \
./forbackup/src/mesh/model/dot11s/peer-link.d \
./forbackup/src/mesh/model/dot11s/peer-management-protocol-mac.d \
./forbackup/src/mesh/model/dot11s/peer-management-protocol.d 

OBJS += \
./forbackup/src/mesh/model/dot11s/airtime-metric.o \
./forbackup/src/mesh/model/dot11s/dot11s-mac-header.o \
./forbackup/src/mesh/model/dot11s/hwmp-protocol-mac.o \
./forbackup/src/mesh/model/dot11s/hwmp-protocol.o \
./forbackup/src/mesh/model/dot11s/hwmp-rtable.o \
./forbackup/src/mesh/model/dot11s/hwmp-tag.o \
./forbackup/src/mesh/model/dot11s/ie-dot11s-beacon-timing.o \
./forbackup/src/mesh/model/dot11s/ie-dot11s-configuration.o \
./forbackup/src/mesh/model/dot11s/ie-dot11s-id.o \
./forbackup/src/mesh/model/dot11s/ie-dot11s-metric-report.o \
./forbackup/src/mesh/model/dot11s/ie-dot11s-peer-management.o \
./forbackup/src/mesh/model/dot11s/ie-dot11s-peering-protocol.o \
./forbackup/src/mesh/model/dot11s/ie-dot11s-perr.o \
./forbackup/src/mesh/model/dot11s/ie-dot11s-prep.o \
./forbackup/src/mesh/model/dot11s/ie-dot11s-preq.o \
./forbackup/src/mesh/model/dot11s/ie-dot11s-rann.o \
./forbackup/src/mesh/model/dot11s/peer-link-frame.o \
./forbackup/src/mesh/model/dot11s/peer-link.o \
./forbackup/src/mesh/model/dot11s/peer-management-protocol-mac.o \
./forbackup/src/mesh/model/dot11s/peer-management-protocol.o 


# Each subdirectory must supply rules for building sources it contributes
forbackup/src/mesh/model/dot11s/%.o: ../forbackup/src/mesh/model/dot11s/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


