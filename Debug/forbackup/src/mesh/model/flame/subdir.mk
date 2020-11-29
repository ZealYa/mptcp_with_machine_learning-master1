################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../forbackup/src/mesh/model/flame/flame-header.cc \
../forbackup/src/mesh/model/flame/flame-protocol-mac.cc \
../forbackup/src/mesh/model/flame/flame-protocol.cc \
../forbackup/src/mesh/model/flame/flame-rtable.cc 

CC_DEPS += \
./forbackup/src/mesh/model/flame/flame-header.d \
./forbackup/src/mesh/model/flame/flame-protocol-mac.d \
./forbackup/src/mesh/model/flame/flame-protocol.d \
./forbackup/src/mesh/model/flame/flame-rtable.d 

OBJS += \
./forbackup/src/mesh/model/flame/flame-header.o \
./forbackup/src/mesh/model/flame/flame-protocol-mac.o \
./forbackup/src/mesh/model/flame/flame-protocol.o \
./forbackup/src/mesh/model/flame/flame-rtable.o 


# Each subdirectory must supply rules for building sources it contributes
forbackup/src/mesh/model/flame/%.o: ../forbackup/src/mesh/model/flame/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


