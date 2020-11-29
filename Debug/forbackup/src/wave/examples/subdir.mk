################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../forbackup/src/wave/examples/vanet-routing-compare.cc \
../forbackup/src/wave/examples/wave-simple-80211p.cc \
../forbackup/src/wave/examples/wave-simple-device.cc 

CC_DEPS += \
./forbackup/src/wave/examples/vanet-routing-compare.d \
./forbackup/src/wave/examples/wave-simple-80211p.d \
./forbackup/src/wave/examples/wave-simple-device.d 

OBJS += \
./forbackup/src/wave/examples/vanet-routing-compare.o \
./forbackup/src/wave/examples/wave-simple-80211p.o \
./forbackup/src/wave/examples/wave-simple-device.o 


# Each subdirectory must supply rules for building sources it contributes
forbackup/src/wave/examples/%.o: ../forbackup/src/wave/examples/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


