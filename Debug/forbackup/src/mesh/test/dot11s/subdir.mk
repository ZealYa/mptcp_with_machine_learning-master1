################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../forbackup/src/mesh/test/dot11s/dot11s-test-suite.cc \
../forbackup/src/mesh/test/dot11s/hwmp-proactive-regression.cc \
../forbackup/src/mesh/test/dot11s/hwmp-reactive-regression.cc \
../forbackup/src/mesh/test/dot11s/hwmp-simplest-regression.cc \
../forbackup/src/mesh/test/dot11s/hwmp-target-flags-regression.cc \
../forbackup/src/mesh/test/dot11s/pmp-regression.cc \
../forbackup/src/mesh/test/dot11s/regression.cc 

CC_DEPS += \
./forbackup/src/mesh/test/dot11s/dot11s-test-suite.d \
./forbackup/src/mesh/test/dot11s/hwmp-proactive-regression.d \
./forbackup/src/mesh/test/dot11s/hwmp-reactive-regression.d \
./forbackup/src/mesh/test/dot11s/hwmp-simplest-regression.d \
./forbackup/src/mesh/test/dot11s/hwmp-target-flags-regression.d \
./forbackup/src/mesh/test/dot11s/pmp-regression.d \
./forbackup/src/mesh/test/dot11s/regression.d 

OBJS += \
./forbackup/src/mesh/test/dot11s/dot11s-test-suite.o \
./forbackup/src/mesh/test/dot11s/hwmp-proactive-regression.o \
./forbackup/src/mesh/test/dot11s/hwmp-reactive-regression.o \
./forbackup/src/mesh/test/dot11s/hwmp-simplest-regression.o \
./forbackup/src/mesh/test/dot11s/hwmp-target-flags-regression.o \
./forbackup/src/mesh/test/dot11s/pmp-regression.o \
./forbackup/src/mesh/test/dot11s/regression.o 


# Each subdirectory must supply rules for building sources it contributes
forbackup/src/mesh/test/dot11s/%.o: ../forbackup/src/mesh/test/dot11s/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


