################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../forbackup/src/bridge/examples/csma-bridge-one-hop.cc \
../forbackup/src/bridge/examples/csma-bridge.cc 

CC_DEPS += \
./forbackup/src/bridge/examples/csma-bridge-one-hop.d \
./forbackup/src/bridge/examples/csma-bridge.d 

OBJS += \
./forbackup/src/bridge/examples/csma-bridge-one-hop.o \
./forbackup/src/bridge/examples/csma-bridge.o 


# Each subdirectory must supply rules for building sources it contributes
forbackup/src/bridge/examples/%.o: ../forbackup/src/bridge/examples/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


