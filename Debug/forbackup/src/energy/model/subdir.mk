################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../forbackup/src/energy/model/basic-energy-harvester.cc \
../forbackup/src/energy/model/basic-energy-source.cc \
../forbackup/src/energy/model/device-energy-model-container.cc \
../forbackup/src/energy/model/device-energy-model.cc \
../forbackup/src/energy/model/energy-harvester.cc \
../forbackup/src/energy/model/energy-source.cc \
../forbackup/src/energy/model/li-ion-energy-source.cc \
../forbackup/src/energy/model/rv-battery-model.cc \
../forbackup/src/energy/model/simple-device-energy-model.cc 

CC_DEPS += \
./forbackup/src/energy/model/basic-energy-harvester.d \
./forbackup/src/energy/model/basic-energy-source.d \
./forbackup/src/energy/model/device-energy-model-container.d \
./forbackup/src/energy/model/device-energy-model.d \
./forbackup/src/energy/model/energy-harvester.d \
./forbackup/src/energy/model/energy-source.d \
./forbackup/src/energy/model/li-ion-energy-source.d \
./forbackup/src/energy/model/rv-battery-model.d \
./forbackup/src/energy/model/simple-device-energy-model.d 

OBJS += \
./forbackup/src/energy/model/basic-energy-harvester.o \
./forbackup/src/energy/model/basic-energy-source.o \
./forbackup/src/energy/model/device-energy-model-container.o \
./forbackup/src/energy/model/device-energy-model.o \
./forbackup/src/energy/model/energy-harvester.o \
./forbackup/src/energy/model/energy-source.o \
./forbackup/src/energy/model/li-ion-energy-source.o \
./forbackup/src/energy/model/rv-battery-model.o \
./forbackup/src/energy/model/simple-device-energy-model.o 


# Each subdirectory must supply rules for building sources it contributes
forbackup/src/energy/model/%.o: ../forbackup/src/energy/model/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


