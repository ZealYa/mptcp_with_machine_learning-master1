################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../forbackup/src/aodv/test/aodv-id-cache-test-suite.cc \
../forbackup/src/aodv/test/aodv-regression.cc \
../forbackup/src/aodv/test/aodv-test-suite.cc \
../forbackup/src/aodv/test/bug-772.cc \
../forbackup/src/aodv/test/loopback.cc 

CC_DEPS += \
./forbackup/src/aodv/test/aodv-id-cache-test-suite.d \
./forbackup/src/aodv/test/aodv-regression.d \
./forbackup/src/aodv/test/aodv-test-suite.d \
./forbackup/src/aodv/test/bug-772.d \
./forbackup/src/aodv/test/loopback.d 

OBJS += \
./forbackup/src/aodv/test/aodv-id-cache-test-suite.o \
./forbackup/src/aodv/test/aodv-regression.o \
./forbackup/src/aodv/test/aodv-test-suite.o \
./forbackup/src/aodv/test/bug-772.o \
./forbackup/src/aodv/test/loopback.o 


# Each subdirectory must supply rules for building sources it contributes
forbackup/src/aodv/test/%.o: ../forbackup/src/aodv/test/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


