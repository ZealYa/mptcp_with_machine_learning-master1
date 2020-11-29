################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../forbackup/src/tap-bridge/examples/tap-csma-virtual-machine.cc \
../forbackup/src/tap-bridge/examples/tap-csma.cc \
../forbackup/src/tap-bridge/examples/tap-wifi-dumbbell.cc \
../forbackup/src/tap-bridge/examples/tap-wifi-virtual-machine.cc 

CC_DEPS += \
./forbackup/src/tap-bridge/examples/tap-csma-virtual-machine.d \
./forbackup/src/tap-bridge/examples/tap-csma.d \
./forbackup/src/tap-bridge/examples/tap-wifi-dumbbell.d \
./forbackup/src/tap-bridge/examples/tap-wifi-virtual-machine.d 

OBJS += \
./forbackup/src/tap-bridge/examples/tap-csma-virtual-machine.o \
./forbackup/src/tap-bridge/examples/tap-csma.o \
./forbackup/src/tap-bridge/examples/tap-wifi-dumbbell.o \
./forbackup/src/tap-bridge/examples/tap-wifi-virtual-machine.o 


# Each subdirectory must supply rules for building sources it contributes
forbackup/src/tap-bridge/examples/%.o: ../forbackup/src/tap-bridge/examples/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


