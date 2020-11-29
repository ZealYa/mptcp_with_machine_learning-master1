################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../forbackup/src/traffic-control/examples/adaptive-red-tests.cc \
../forbackup/src/traffic-control/examples/codel-vs-pfifo-asymmetric.cc \
../forbackup/src/traffic-control/examples/codel-vs-pfifo-basic-test.cc \
../forbackup/src/traffic-control/examples/pfifo-vs-red.cc \
../forbackup/src/traffic-control/examples/red-tests.cc \
../forbackup/src/traffic-control/examples/red-vs-ared.cc 

CC_DEPS += \
./forbackup/src/traffic-control/examples/adaptive-red-tests.d \
./forbackup/src/traffic-control/examples/codel-vs-pfifo-asymmetric.d \
./forbackup/src/traffic-control/examples/codel-vs-pfifo-basic-test.d \
./forbackup/src/traffic-control/examples/pfifo-vs-red.d \
./forbackup/src/traffic-control/examples/red-tests.d \
./forbackup/src/traffic-control/examples/red-vs-ared.d 

OBJS += \
./forbackup/src/traffic-control/examples/adaptive-red-tests.o \
./forbackup/src/traffic-control/examples/codel-vs-pfifo-asymmetric.o \
./forbackup/src/traffic-control/examples/codel-vs-pfifo-basic-test.o \
./forbackup/src/traffic-control/examples/pfifo-vs-red.o \
./forbackup/src/traffic-control/examples/red-tests.o \
./forbackup/src/traffic-control/examples/red-vs-ared.o 


# Each subdirectory must supply rules for building sources it contributes
forbackup/src/traffic-control/examples/%.o: ../forbackup/src/traffic-control/examples/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


