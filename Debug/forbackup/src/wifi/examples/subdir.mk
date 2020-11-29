################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../forbackup/src/wifi/examples/ideal-wifi-manager-example.cc \
../forbackup/src/wifi/examples/minstrel-ht-wifi-manager-example.cc \
../forbackup/src/wifi/examples/test-interference-helper.cc \
../forbackup/src/wifi/examples/wifi-phy-test.cc 

CC_DEPS += \
./forbackup/src/wifi/examples/ideal-wifi-manager-example.d \
./forbackup/src/wifi/examples/minstrel-ht-wifi-manager-example.d \
./forbackup/src/wifi/examples/test-interference-helper.d \
./forbackup/src/wifi/examples/wifi-phy-test.d 

OBJS += \
./forbackup/src/wifi/examples/ideal-wifi-manager-example.o \
./forbackup/src/wifi/examples/minstrel-ht-wifi-manager-example.o \
./forbackup/src/wifi/examples/test-interference-helper.o \
./forbackup/src/wifi/examples/wifi-phy-test.o 


# Each subdirectory must supply rules for building sources it contributes
forbackup/src/wifi/examples/%.o: ../forbackup/src/wifi/examples/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


