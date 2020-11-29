################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../forbackup/src/buildings/model/building-list.cc \
../forbackup/src/buildings/model/building.cc \
../forbackup/src/buildings/model/buildings-propagation-loss-model.cc \
../forbackup/src/buildings/model/hybrid-buildings-propagation-loss-model.cc \
../forbackup/src/buildings/model/itu-r-1238-propagation-loss-model.cc \
../forbackup/src/buildings/model/mobility-building-info.cc \
../forbackup/src/buildings/model/oh-buildings-propagation-loss-model.cc 

CC_DEPS += \
./forbackup/src/buildings/model/building-list.d \
./forbackup/src/buildings/model/building.d \
./forbackup/src/buildings/model/buildings-propagation-loss-model.d \
./forbackup/src/buildings/model/hybrid-buildings-propagation-loss-model.d \
./forbackup/src/buildings/model/itu-r-1238-propagation-loss-model.d \
./forbackup/src/buildings/model/mobility-building-info.d \
./forbackup/src/buildings/model/oh-buildings-propagation-loss-model.d 

OBJS += \
./forbackup/src/buildings/model/building-list.o \
./forbackup/src/buildings/model/building.o \
./forbackup/src/buildings/model/buildings-propagation-loss-model.o \
./forbackup/src/buildings/model/hybrid-buildings-propagation-loss-model.o \
./forbackup/src/buildings/model/itu-r-1238-propagation-loss-model.o \
./forbackup/src/buildings/model/mobility-building-info.o \
./forbackup/src/buildings/model/oh-buildings-propagation-loss-model.o 


# Each subdirectory must supply rules for building sources it contributes
forbackup/src/buildings/model/%.o: ../forbackup/src/buildings/model/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


