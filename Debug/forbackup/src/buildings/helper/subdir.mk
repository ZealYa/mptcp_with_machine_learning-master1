################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../forbackup/src/buildings/helper/building-allocator.cc \
../forbackup/src/buildings/helper/building-container.cc \
../forbackup/src/buildings/helper/building-position-allocator.cc \
../forbackup/src/buildings/helper/buildings-helper.cc 

CC_DEPS += \
./forbackup/src/buildings/helper/building-allocator.d \
./forbackup/src/buildings/helper/building-container.d \
./forbackup/src/buildings/helper/building-position-allocator.d \
./forbackup/src/buildings/helper/buildings-helper.d 

OBJS += \
./forbackup/src/buildings/helper/building-allocator.o \
./forbackup/src/buildings/helper/building-container.o \
./forbackup/src/buildings/helper/building-position-allocator.o \
./forbackup/src/buildings/helper/buildings-helper.o 


# Each subdirectory must supply rules for building sources it contributes
forbackup/src/buildings/helper/%.o: ../forbackup/src/buildings/helper/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


