################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../forbackup/src/test/ns3wifi/wifi-ac-mapping-test-suite.cc \
../forbackup/src/test/ns3wifi/wifi-interference-test-suite.cc \
../forbackup/src/test/ns3wifi/wifi-msdu-aggregator-test-suite.cc 

CC_DEPS += \
./forbackup/src/test/ns3wifi/wifi-ac-mapping-test-suite.d \
./forbackup/src/test/ns3wifi/wifi-interference-test-suite.d \
./forbackup/src/test/ns3wifi/wifi-msdu-aggregator-test-suite.d 

OBJS += \
./forbackup/src/test/ns3wifi/wifi-ac-mapping-test-suite.o \
./forbackup/src/test/ns3wifi/wifi-interference-test-suite.o \
./forbackup/src/test/ns3wifi/wifi-msdu-aggregator-test-suite.o 


# Each subdirectory must supply rules for building sources it contributes
forbackup/src/test/ns3wifi/%.o: ../forbackup/src/test/ns3wifi/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


