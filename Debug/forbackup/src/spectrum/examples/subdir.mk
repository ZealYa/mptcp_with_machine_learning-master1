################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../forbackup/src/spectrum/examples/adhoc-aloha-ideal-phy-matrix-propagation-loss-model.cc \
../forbackup/src/spectrum/examples/adhoc-aloha-ideal-phy-with-microwave-oven.cc \
../forbackup/src/spectrum/examples/adhoc-aloha-ideal-phy.cc \
../forbackup/src/spectrum/examples/tv-trans-example.cc \
../forbackup/src/spectrum/examples/tv-trans-regional-example.cc 

CC_DEPS += \
./forbackup/src/spectrum/examples/adhoc-aloha-ideal-phy-matrix-propagation-loss-model.d \
./forbackup/src/spectrum/examples/adhoc-aloha-ideal-phy-with-microwave-oven.d \
./forbackup/src/spectrum/examples/adhoc-aloha-ideal-phy.d \
./forbackup/src/spectrum/examples/tv-trans-example.d \
./forbackup/src/spectrum/examples/tv-trans-regional-example.d 

OBJS += \
./forbackup/src/spectrum/examples/adhoc-aloha-ideal-phy-matrix-propagation-loss-model.o \
./forbackup/src/spectrum/examples/adhoc-aloha-ideal-phy-with-microwave-oven.o \
./forbackup/src/spectrum/examples/adhoc-aloha-ideal-phy.o \
./forbackup/src/spectrum/examples/tv-trans-example.o \
./forbackup/src/spectrum/examples/tv-trans-regional-example.o 


# Each subdirectory must supply rules for building sources it contributes
forbackup/src/spectrum/examples/%.o: ../forbackup/src/spectrum/examples/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


