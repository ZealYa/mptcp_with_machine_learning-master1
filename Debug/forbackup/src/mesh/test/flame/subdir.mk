################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../forbackup/src/mesh/test/flame/flame-regression.cc \
../forbackup/src/mesh/test/flame/flame-test-suite.cc \
../forbackup/src/mesh/test/flame/regression.cc 

CC_DEPS += \
./forbackup/src/mesh/test/flame/flame-regression.d \
./forbackup/src/mesh/test/flame/flame-test-suite.d \
./forbackup/src/mesh/test/flame/regression.d 

OBJS += \
./forbackup/src/mesh/test/flame/flame-regression.o \
./forbackup/src/mesh/test/flame/flame-test-suite.o \
./forbackup/src/mesh/test/flame/regression.o 


# Each subdirectory must supply rules for building sources it contributes
forbackup/src/mesh/test/flame/%.o: ../forbackup/src/mesh/test/flame/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


