################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../forbackup/src/mobility/test/geo-to-cartesian-test.cc \
../forbackup/src/mobility/test/mobility-test-suite.cc \
../forbackup/src/mobility/test/mobility-trace-test-suite.cc \
../forbackup/src/mobility/test/ns2-mobility-helper-test-suite.cc \
../forbackup/src/mobility/test/rand-cart-around-geo-test.cc \
../forbackup/src/mobility/test/steady-state-random-waypoint-mobility-model-test.cc \
../forbackup/src/mobility/test/waypoint-mobility-model-test.cc 

CC_DEPS += \
./forbackup/src/mobility/test/geo-to-cartesian-test.d \
./forbackup/src/mobility/test/mobility-test-suite.d \
./forbackup/src/mobility/test/mobility-trace-test-suite.d \
./forbackup/src/mobility/test/ns2-mobility-helper-test-suite.d \
./forbackup/src/mobility/test/rand-cart-around-geo-test.d \
./forbackup/src/mobility/test/steady-state-random-waypoint-mobility-model-test.d \
./forbackup/src/mobility/test/waypoint-mobility-model-test.d 

OBJS += \
./forbackup/src/mobility/test/geo-to-cartesian-test.o \
./forbackup/src/mobility/test/mobility-test-suite.o \
./forbackup/src/mobility/test/mobility-trace-test-suite.o \
./forbackup/src/mobility/test/ns2-mobility-helper-test-suite.o \
./forbackup/src/mobility/test/rand-cart-around-geo-test.o \
./forbackup/src/mobility/test/steady-state-random-waypoint-mobility-model-test.o \
./forbackup/src/mobility/test/waypoint-mobility-model-test.o 


# Each subdirectory must supply rules for building sources it contributes
forbackup/src/mobility/test/%.o: ../forbackup/src/mobility/test/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


