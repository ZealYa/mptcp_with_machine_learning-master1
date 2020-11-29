################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../forbackup/src/energy/examples/basic-energy-model-test.cc \
../forbackup/src/energy/examples/li-ion-energy-source.cc \
../forbackup/src/energy/examples/rv-battery-model-test.cc 

CC_DEPS += \
./forbackup/src/energy/examples/basic-energy-model-test.d \
./forbackup/src/energy/examples/li-ion-energy-source.d \
./forbackup/src/energy/examples/rv-battery-model-test.d 

OBJS += \
./forbackup/src/energy/examples/basic-energy-model-test.o \
./forbackup/src/energy/examples/li-ion-energy-source.o \
./forbackup/src/energy/examples/rv-battery-model-test.o 


# Each subdirectory must supply rules for building sources it contributes
forbackup/src/energy/examples/%.o: ../forbackup/src/energy/examples/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


