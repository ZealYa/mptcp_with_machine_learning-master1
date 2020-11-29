################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../forbackup/src/tap-bridge/model/tap-bridge.cc \
../forbackup/src/tap-bridge/model/tap-creator.cc \
../forbackup/src/tap-bridge/model/tap-encode-decode.cc 

CC_DEPS += \
./forbackup/src/tap-bridge/model/tap-bridge.d \
./forbackup/src/tap-bridge/model/tap-creator.d \
./forbackup/src/tap-bridge/model/tap-encode-decode.d 

OBJS += \
./forbackup/src/tap-bridge/model/tap-bridge.o \
./forbackup/src/tap-bridge/model/tap-creator.o \
./forbackup/src/tap-bridge/model/tap-encode-decode.o 


# Each subdirectory must supply rules for building sources it contributes
forbackup/src/tap-bridge/model/%.o: ../forbackup/src/tap-bridge/model/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


