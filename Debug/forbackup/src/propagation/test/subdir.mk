################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../forbackup/src/propagation/test/itu-r-1411-los-test-suite.cc \
../forbackup/src/propagation/test/itu-r-1411-nlos-over-rooftop-test-suite.cc \
../forbackup/src/propagation/test/kun-2600-mhz-test-suite.cc \
../forbackup/src/propagation/test/okumura-hata-test-suite.cc \
../forbackup/src/propagation/test/propagation-loss-model-test-suite.cc 

CC_DEPS += \
./forbackup/src/propagation/test/itu-r-1411-los-test-suite.d \
./forbackup/src/propagation/test/itu-r-1411-nlos-over-rooftop-test-suite.d \
./forbackup/src/propagation/test/kun-2600-mhz-test-suite.d \
./forbackup/src/propagation/test/okumura-hata-test-suite.d \
./forbackup/src/propagation/test/propagation-loss-model-test-suite.d 

OBJS += \
./forbackup/src/propagation/test/itu-r-1411-los-test-suite.o \
./forbackup/src/propagation/test/itu-r-1411-nlos-over-rooftop-test-suite.o \
./forbackup/src/propagation/test/kun-2600-mhz-test-suite.o \
./forbackup/src/propagation/test/okumura-hata-test-suite.o \
./forbackup/src/propagation/test/propagation-loss-model-test-suite.o 


# Each subdirectory must supply rules for building sources it contributes
forbackup/src/propagation/test/%.o: ../forbackup/src/propagation/test/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


