################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../forbackup/src/lr-wpan/examples/lr-wpan-data.cc \
../forbackup/src/lr-wpan/examples/lr-wpan-error-distance-plot.cc \
../forbackup/src/lr-wpan/examples/lr-wpan-error-model-plot.cc \
../forbackup/src/lr-wpan/examples/lr-wpan-packet-print.cc \
../forbackup/src/lr-wpan/examples/lr-wpan-phy-test.cc 

CC_DEPS += \
./forbackup/src/lr-wpan/examples/lr-wpan-data.d \
./forbackup/src/lr-wpan/examples/lr-wpan-error-distance-plot.d \
./forbackup/src/lr-wpan/examples/lr-wpan-error-model-plot.d \
./forbackup/src/lr-wpan/examples/lr-wpan-packet-print.d \
./forbackup/src/lr-wpan/examples/lr-wpan-phy-test.d 

OBJS += \
./forbackup/src/lr-wpan/examples/lr-wpan-data.o \
./forbackup/src/lr-wpan/examples/lr-wpan-error-distance-plot.o \
./forbackup/src/lr-wpan/examples/lr-wpan-error-model-plot.o \
./forbackup/src/lr-wpan/examples/lr-wpan-packet-print.o \
./forbackup/src/lr-wpan/examples/lr-wpan-phy-test.o 


# Each subdirectory must supply rules for building sources it contributes
forbackup/src/lr-wpan/examples/%.o: ../forbackup/src/lr-wpan/examples/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


