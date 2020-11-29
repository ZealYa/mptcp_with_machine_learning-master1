################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../forbackup/src/spectrum/test/spectrum-ideal-phy-test.cc \
../forbackup/src/spectrum/test/spectrum-interference-test.cc \
../forbackup/src/spectrum/test/spectrum-value-test.cc \
../forbackup/src/spectrum/test/spectrum-waveform-generator-test.cc \
../forbackup/src/spectrum/test/tv-helper-distribution-test.cc \
../forbackup/src/spectrum/test/tv-spectrum-transmitter-test.cc 

CC_DEPS += \
./forbackup/src/spectrum/test/spectrum-ideal-phy-test.d \
./forbackup/src/spectrum/test/spectrum-interference-test.d \
./forbackup/src/spectrum/test/spectrum-value-test.d \
./forbackup/src/spectrum/test/spectrum-waveform-generator-test.d \
./forbackup/src/spectrum/test/tv-helper-distribution-test.d \
./forbackup/src/spectrum/test/tv-spectrum-transmitter-test.d 

OBJS += \
./forbackup/src/spectrum/test/spectrum-ideal-phy-test.o \
./forbackup/src/spectrum/test/spectrum-interference-test.o \
./forbackup/src/spectrum/test/spectrum-value-test.o \
./forbackup/src/spectrum/test/spectrum-waveform-generator-test.o \
./forbackup/src/spectrum/test/tv-helper-distribution-test.o \
./forbackup/src/spectrum/test/tv-spectrum-transmitter-test.o 


# Each subdirectory must supply rules for building sources it contributes
forbackup/src/spectrum/test/%.o: ../forbackup/src/spectrum/test/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


