################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../forbackup/src/energy/test/basic-energy-harvester-test.cc \
../forbackup/src/energy/test/li-ion-energy-source-test.cc 

CC_DEPS += \
./forbackup/src/energy/test/basic-energy-harvester-test.d \
./forbackup/src/energy/test/li-ion-energy-source-test.d 

OBJS += \
./forbackup/src/energy/test/basic-energy-harvester-test.o \
./forbackup/src/energy/test/li-ion-energy-source-test.o 


# Each subdirectory must supply rules for building sources it contributes
forbackup/src/energy/test/%.o: ../forbackup/src/energy/test/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


