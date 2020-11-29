################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../forbackup/src/propagation/examples/jakes-propagation-model-example.cc \
../forbackup/src/propagation/examples/main-propagation-loss.cc 

CC_DEPS += \
./forbackup/src/propagation/examples/jakes-propagation-model-example.d \
./forbackup/src/propagation/examples/main-propagation-loss.d 

OBJS += \
./forbackup/src/propagation/examples/jakes-propagation-model-example.o \
./forbackup/src/propagation/examples/main-propagation-loss.o 


# Each subdirectory must supply rules for building sources it contributes
forbackup/src/propagation/examples/%.o: ../forbackup/src/propagation/examples/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


