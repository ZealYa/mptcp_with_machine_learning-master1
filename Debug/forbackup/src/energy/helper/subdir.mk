################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../forbackup/src/energy/helper/basic-energy-harvester-helper.cc \
../forbackup/src/energy/helper/basic-energy-source-helper.cc \
../forbackup/src/energy/helper/energy-harvester-container.cc \
../forbackup/src/energy/helper/energy-harvester-helper.cc \
../forbackup/src/energy/helper/energy-model-helper.cc \
../forbackup/src/energy/helper/energy-source-container.cc \
../forbackup/src/energy/helper/li-ion-energy-source-helper.cc \
../forbackup/src/energy/helper/rv-battery-model-helper.cc 

CC_DEPS += \
./forbackup/src/energy/helper/basic-energy-harvester-helper.d \
./forbackup/src/energy/helper/basic-energy-source-helper.d \
./forbackup/src/energy/helper/energy-harvester-container.d \
./forbackup/src/energy/helper/energy-harvester-helper.d \
./forbackup/src/energy/helper/energy-model-helper.d \
./forbackup/src/energy/helper/energy-source-container.d \
./forbackup/src/energy/helper/li-ion-energy-source-helper.d \
./forbackup/src/energy/helper/rv-battery-model-helper.d 

OBJS += \
./forbackup/src/energy/helper/basic-energy-harvester-helper.o \
./forbackup/src/energy/helper/basic-energy-source-helper.o \
./forbackup/src/energy/helper/energy-harvester-container.o \
./forbackup/src/energy/helper/energy-harvester-helper.o \
./forbackup/src/energy/helper/energy-model-helper.o \
./forbackup/src/energy/helper/energy-source-container.o \
./forbackup/src/energy/helper/li-ion-energy-source-helper.o \
./forbackup/src/energy/helper/rv-battery-model-helper.o 


# Each subdirectory must supply rules for building sources it contributes
forbackup/src/energy/helper/%.o: ../forbackup/src/energy/helper/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


