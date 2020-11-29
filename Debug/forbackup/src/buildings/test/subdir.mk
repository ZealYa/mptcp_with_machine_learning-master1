################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../forbackup/src/buildings/test/building-position-allocator-test.cc \
../forbackup/src/buildings/test/buildings-helper-test.cc \
../forbackup/src/buildings/test/buildings-pathloss-test.cc \
../forbackup/src/buildings/test/buildings-shadowing-test.cc 

CC_DEPS += \
./forbackup/src/buildings/test/building-position-allocator-test.d \
./forbackup/src/buildings/test/buildings-helper-test.d \
./forbackup/src/buildings/test/buildings-pathloss-test.d \
./forbackup/src/buildings/test/buildings-shadowing-test.d 

OBJS += \
./forbackup/src/buildings/test/building-position-allocator-test.o \
./forbackup/src/buildings/test/buildings-helper-test.o \
./forbackup/src/buildings/test/buildings-pathloss-test.o \
./forbackup/src/buildings/test/buildings-shadowing-test.o 


# Each subdirectory must supply rules for building sources it contributes
forbackup/src/buildings/test/%.o: ../forbackup/src/buildings/test/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


