################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../forbackup/src/mesh/model/mesh-information-element-vector.cc \
../forbackup/src/mesh/model/mesh-l2-routing-protocol.cc \
../forbackup/src/mesh/model/mesh-point-device.cc \
../forbackup/src/mesh/model/mesh-wifi-beacon.cc \
../forbackup/src/mesh/model/mesh-wifi-interface-mac.cc 

CC_DEPS += \
./forbackup/src/mesh/model/mesh-information-element-vector.d \
./forbackup/src/mesh/model/mesh-l2-routing-protocol.d \
./forbackup/src/mesh/model/mesh-point-device.d \
./forbackup/src/mesh/model/mesh-wifi-beacon.d \
./forbackup/src/mesh/model/mesh-wifi-interface-mac.d 

OBJS += \
./forbackup/src/mesh/model/mesh-information-element-vector.o \
./forbackup/src/mesh/model/mesh-l2-routing-protocol.o \
./forbackup/src/mesh/model/mesh-point-device.o \
./forbackup/src/mesh/model/mesh-wifi-beacon.o \
./forbackup/src/mesh/model/mesh-wifi-interface-mac.o 


# Each subdirectory must supply rules for building sources it contributes
forbackup/src/mesh/model/%.o: ../forbackup/src/mesh/model/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


