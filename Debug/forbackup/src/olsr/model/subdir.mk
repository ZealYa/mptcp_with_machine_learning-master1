################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../forbackup/src/olsr/model/olsr-header.cc \
../forbackup/src/olsr/model/olsr-routing-protocol.cc \
../forbackup/src/olsr/model/olsr-state.cc 

CC_DEPS += \
./forbackup/src/olsr/model/olsr-header.d \
./forbackup/src/olsr/model/olsr-routing-protocol.d \
./forbackup/src/olsr/model/olsr-state.d 

OBJS += \
./forbackup/src/olsr/model/olsr-header.o \
./forbackup/src/olsr/model/olsr-routing-protocol.o \
./forbackup/src/olsr/model/olsr-state.o 


# Each subdirectory must supply rules for building sources it contributes
forbackup/src/olsr/model/%.o: ../forbackup/src/olsr/model/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


