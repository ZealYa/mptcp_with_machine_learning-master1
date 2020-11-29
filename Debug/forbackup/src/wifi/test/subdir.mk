################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../forbackup/src/wifi/test/block-ack-test-suite.cc \
../forbackup/src/wifi/test/dcf-manager-test.cc \
../forbackup/src/wifi/test/power-rate-adaptation-test.cc \
../forbackup/src/wifi/test/tx-duration-test.cc \
../forbackup/src/wifi/test/wifi-aggregation-test.cc \
../forbackup/src/wifi/test/wifi-error-rate-models-test.cc \
../forbackup/src/wifi/test/wifi-test.cc 

C_SRCS += \
../forbackup/src/wifi/test/80211b.c 

CC_DEPS += \
./forbackup/src/wifi/test/block-ack-test-suite.d \
./forbackup/src/wifi/test/dcf-manager-test.d \
./forbackup/src/wifi/test/power-rate-adaptation-test.d \
./forbackup/src/wifi/test/tx-duration-test.d \
./forbackup/src/wifi/test/wifi-aggregation-test.d \
./forbackup/src/wifi/test/wifi-error-rate-models-test.d \
./forbackup/src/wifi/test/wifi-test.d 

OBJS += \
./forbackup/src/wifi/test/80211b.o \
./forbackup/src/wifi/test/block-ack-test-suite.o \
./forbackup/src/wifi/test/dcf-manager-test.o \
./forbackup/src/wifi/test/power-rate-adaptation-test.o \
./forbackup/src/wifi/test/tx-duration-test.o \
./forbackup/src/wifi/test/wifi-aggregation-test.o \
./forbackup/src/wifi/test/wifi-error-rate-models-test.o \
./forbackup/src/wifi/test/wifi-test.o 

C_DEPS += \
./forbackup/src/wifi/test/80211b.d 


# Each subdirectory must supply rules for building sources it contributes
forbackup/src/wifi/test/%.o: ../forbackup/src/wifi/test/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: Cross GCC Compiler'
	gcc -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

forbackup/src/wifi/test/%.o: ../forbackup/src/wifi/test/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


