################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../forbackup/src/sixlowpan/test/error-channel-sixlow.cc \
../forbackup/src/sixlowpan/test/sixlowpan-fragmentation-test.cc \
../forbackup/src/sixlowpan/test/sixlowpan-hc1-test.cc \
../forbackup/src/sixlowpan/test/sixlowpan-iphc-test.cc 

CC_DEPS += \
./forbackup/src/sixlowpan/test/error-channel-sixlow.d \
./forbackup/src/sixlowpan/test/sixlowpan-fragmentation-test.d \
./forbackup/src/sixlowpan/test/sixlowpan-hc1-test.d \
./forbackup/src/sixlowpan/test/sixlowpan-iphc-test.d 

OBJS += \
./forbackup/src/sixlowpan/test/error-channel-sixlow.o \
./forbackup/src/sixlowpan/test/sixlowpan-fragmentation-test.o \
./forbackup/src/sixlowpan/test/sixlowpan-hc1-test.o \
./forbackup/src/sixlowpan/test/sixlowpan-iphc-test.o 


# Each subdirectory must supply rules for building sources it contributes
forbackup/src/sixlowpan/test/%.o: ../forbackup/src/sixlowpan/test/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


