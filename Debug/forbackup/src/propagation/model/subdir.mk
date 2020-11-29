################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../forbackup/src/propagation/model/cost231-propagation-loss-model.cc \
../forbackup/src/propagation/model/itu-r-1411-los-propagation-loss-model.cc \
../forbackup/src/propagation/model/itu-r-1411-nlos-over-rooftop-propagation-loss-model.cc \
../forbackup/src/propagation/model/jakes-process.cc \
../forbackup/src/propagation/model/jakes-propagation-loss-model.cc \
../forbackup/src/propagation/model/kun-2600-mhz-propagation-loss-model.cc \
../forbackup/src/propagation/model/okumura-hata-propagation-loss-model.cc \
../forbackup/src/propagation/model/propagation-delay-model.cc \
../forbackup/src/propagation/model/propagation-loss-model.cc 

CC_DEPS += \
./forbackup/src/propagation/model/cost231-propagation-loss-model.d \
./forbackup/src/propagation/model/itu-r-1411-los-propagation-loss-model.d \
./forbackup/src/propagation/model/itu-r-1411-nlos-over-rooftop-propagation-loss-model.d \
./forbackup/src/propagation/model/jakes-process.d \
./forbackup/src/propagation/model/jakes-propagation-loss-model.d \
./forbackup/src/propagation/model/kun-2600-mhz-propagation-loss-model.d \
./forbackup/src/propagation/model/okumura-hata-propagation-loss-model.d \
./forbackup/src/propagation/model/propagation-delay-model.d \
./forbackup/src/propagation/model/propagation-loss-model.d 

OBJS += \
./forbackup/src/propagation/model/cost231-propagation-loss-model.o \
./forbackup/src/propagation/model/itu-r-1411-los-propagation-loss-model.o \
./forbackup/src/propagation/model/itu-r-1411-nlos-over-rooftop-propagation-loss-model.o \
./forbackup/src/propagation/model/jakes-process.o \
./forbackup/src/propagation/model/jakes-propagation-loss-model.o \
./forbackup/src/propagation/model/kun-2600-mhz-propagation-loss-model.o \
./forbackup/src/propagation/model/okumura-hata-propagation-loss-model.o \
./forbackup/src/propagation/model/propagation-delay-model.o \
./forbackup/src/propagation/model/propagation-loss-model.o 


# Each subdirectory must supply rules for building sources it contributes
forbackup/src/propagation/model/%.o: ../forbackup/src/propagation/model/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


