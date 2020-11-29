################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../forbackup/src/traffic-control/model/codel-queue-disc.cc \
../forbackup/src/traffic-control/model/packet-filter.cc \
../forbackup/src/traffic-control/model/pfifo-fast-queue-disc.cc \
../forbackup/src/traffic-control/model/queue-disc.cc \
../forbackup/src/traffic-control/model/red-queue-disc.cc \
../forbackup/src/traffic-control/model/traffic-control-layer.cc 

CC_DEPS += \
./forbackup/src/traffic-control/model/codel-queue-disc.d \
./forbackup/src/traffic-control/model/packet-filter.d \
./forbackup/src/traffic-control/model/pfifo-fast-queue-disc.d \
./forbackup/src/traffic-control/model/queue-disc.d \
./forbackup/src/traffic-control/model/red-queue-disc.d \
./forbackup/src/traffic-control/model/traffic-control-layer.d 

OBJS += \
./forbackup/src/traffic-control/model/codel-queue-disc.o \
./forbackup/src/traffic-control/model/packet-filter.o \
./forbackup/src/traffic-control/model/pfifo-fast-queue-disc.o \
./forbackup/src/traffic-control/model/queue-disc.o \
./forbackup/src/traffic-control/model/red-queue-disc.o \
./forbackup/src/traffic-control/model/traffic-control-layer.o 


# Each subdirectory must supply rules for building sources it contributes
forbackup/src/traffic-control/model/%.o: ../forbackup/src/traffic-control/model/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


