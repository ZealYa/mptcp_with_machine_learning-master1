################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../forbackup/src/flow-monitor/model/flow-classifier.cc \
../forbackup/src/flow-monitor/model/flow-monitor.cc \
../forbackup/src/flow-monitor/model/flow-probe.cc \
../forbackup/src/flow-monitor/model/histogram.cc \
../forbackup/src/flow-monitor/model/ipv4-flow-classifier.cc \
../forbackup/src/flow-monitor/model/ipv4-flow-probe.cc \
../forbackup/src/flow-monitor/model/ipv6-flow-classifier.cc \
../forbackup/src/flow-monitor/model/ipv6-flow-probe.cc 

CC_DEPS += \
./forbackup/src/flow-monitor/model/flow-classifier.d \
./forbackup/src/flow-monitor/model/flow-monitor.d \
./forbackup/src/flow-monitor/model/flow-probe.d \
./forbackup/src/flow-monitor/model/histogram.d \
./forbackup/src/flow-monitor/model/ipv4-flow-classifier.d \
./forbackup/src/flow-monitor/model/ipv4-flow-probe.d \
./forbackup/src/flow-monitor/model/ipv6-flow-classifier.d \
./forbackup/src/flow-monitor/model/ipv6-flow-probe.d 

OBJS += \
./forbackup/src/flow-monitor/model/flow-classifier.o \
./forbackup/src/flow-monitor/model/flow-monitor.o \
./forbackup/src/flow-monitor/model/flow-probe.o \
./forbackup/src/flow-monitor/model/histogram.o \
./forbackup/src/flow-monitor/model/ipv4-flow-classifier.o \
./forbackup/src/flow-monitor/model/ipv4-flow-probe.o \
./forbackup/src/flow-monitor/model/ipv6-flow-classifier.o \
./forbackup/src/flow-monitor/model/ipv6-flow-probe.o 


# Each subdirectory must supply rules for building sources it contributes
forbackup/src/flow-monitor/model/%.o: ../forbackup/src/flow-monitor/model/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


