################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../forbackup/src/wimax/test/mac-messages-test.cc \
../forbackup/src/wimax/test/phy-test.cc \
../forbackup/src/wimax/test/qos-test.cc \
../forbackup/src/wimax/test/ss-mac-test.cc \
../forbackup/src/wimax/test/wimax-fragmentation-test.cc \
../forbackup/src/wimax/test/wimax-service-flow-test.cc \
../forbackup/src/wimax/test/wimax-tlv-test.cc 

CC_DEPS += \
./forbackup/src/wimax/test/mac-messages-test.d \
./forbackup/src/wimax/test/phy-test.d \
./forbackup/src/wimax/test/qos-test.d \
./forbackup/src/wimax/test/ss-mac-test.d \
./forbackup/src/wimax/test/wimax-fragmentation-test.d \
./forbackup/src/wimax/test/wimax-service-flow-test.d \
./forbackup/src/wimax/test/wimax-tlv-test.d 

OBJS += \
./forbackup/src/wimax/test/mac-messages-test.o \
./forbackup/src/wimax/test/phy-test.o \
./forbackup/src/wimax/test/qos-test.o \
./forbackup/src/wimax/test/ss-mac-test.o \
./forbackup/src/wimax/test/wimax-fragmentation-test.o \
./forbackup/src/wimax/test/wimax-service-flow-test.o \
./forbackup/src/wimax/test/wimax-tlv-test.o 


# Each subdirectory must supply rules for building sources it contributes
forbackup/src/wimax/test/%.o: ../forbackup/src/wimax/test/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


