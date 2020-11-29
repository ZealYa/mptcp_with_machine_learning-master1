################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../forbackup/src/lr-wpan/test/lr-wpan-ack-test.cc \
../forbackup/src/lr-wpan/test/lr-wpan-cca-test.cc \
../forbackup/src/lr-wpan/test/lr-wpan-collision-test.cc \
../forbackup/src/lr-wpan/test/lr-wpan-ed-test.cc \
../forbackup/src/lr-wpan/test/lr-wpan-error-model-test.cc \
../forbackup/src/lr-wpan/test/lr-wpan-packet-test.cc \
../forbackup/src/lr-wpan/test/lr-wpan-pd-plme-sap-test.cc \
../forbackup/src/lr-wpan/test/lr-wpan-spectrum-value-helper-test.cc 

CC_DEPS += \
./forbackup/src/lr-wpan/test/lr-wpan-ack-test.d \
./forbackup/src/lr-wpan/test/lr-wpan-cca-test.d \
./forbackup/src/lr-wpan/test/lr-wpan-collision-test.d \
./forbackup/src/lr-wpan/test/lr-wpan-ed-test.d \
./forbackup/src/lr-wpan/test/lr-wpan-error-model-test.d \
./forbackup/src/lr-wpan/test/lr-wpan-packet-test.d \
./forbackup/src/lr-wpan/test/lr-wpan-pd-plme-sap-test.d \
./forbackup/src/lr-wpan/test/lr-wpan-spectrum-value-helper-test.d 

OBJS += \
./forbackup/src/lr-wpan/test/lr-wpan-ack-test.o \
./forbackup/src/lr-wpan/test/lr-wpan-cca-test.o \
./forbackup/src/lr-wpan/test/lr-wpan-collision-test.o \
./forbackup/src/lr-wpan/test/lr-wpan-ed-test.o \
./forbackup/src/lr-wpan/test/lr-wpan-error-model-test.o \
./forbackup/src/lr-wpan/test/lr-wpan-packet-test.o \
./forbackup/src/lr-wpan/test/lr-wpan-pd-plme-sap-test.o \
./forbackup/src/lr-wpan/test/lr-wpan-spectrum-value-helper-test.o 


# Each subdirectory must supply rules for building sources it contributes
forbackup/src/lr-wpan/test/%.o: ../forbackup/src/lr-wpan/test/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


